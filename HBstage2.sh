#!/bin/bash
#login to the server using ssh by downloading putty from putty.org, inputting the ip address and password
#Alternatively, you could just go on cloud and 
ssh einstein@7.tcp.eu.ngrok.io -p 18467
#password: einstein


#Create my folder within team newton
cd newton
mkdir judith
#Create folder for raw dataset
cd judith
mkdir -p raw_data

cd raw_data
#Download the raw data

wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r1_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r2_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r1_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r2_chr5_12_17.fastq.gz

#download reference sequence
wget https://zenodo.org/record/2582555/files/hg19.chr5_12_17.fa.gz

#unzip the reference sequence (I got a comment that it is not a zip file or it constitutes one disk of a multi-part archive.  In the  latter case the central directory and zipfile comment will be found on  the last disk(s) of this archive) so I used gunzip
gunzip hg19.chr5_12_17.fa.gz 

cd ..

#Preprocessing and Trimming using fastqc and multiqc
#first download multiqc as you already have fastqc installed
conda install -c bioconda fastqc multiqc --yes

echo -e "\n Data Preprocessing... \n"

#create .txt file containing the names of the raw data
touch list.txt
nano list.txt
#type in the names of the .fasta.gz files and save

#create directory for the fastqc output

mkdir -p Fastqc_Reports

#Run quality control on the sequences
for sample in `cat list.txt`
do
	fastqc raw_data/${sample}*.fastq.gz -o Fastqc_Reports
done

multiqc Fastqc_Reports -o Fastqc_Reports

#Removing low quality sequences using Trimmomatic
#Download the software from http://www.usadellab.org/cms/?page=trimmomatic

apt.get http://www.usadellab.org/cms/?page=trimmomatic
#in this case it was already insstalled so i just went to the folder where it could be found and copied the TrimSeq file using cp


mkdir -p trimmed_reads
cd trimmed_reads
mkdir Fastqc_results
#run trimmomatic
for sample in `cat list.txt`
do
       trimmomatic PE -threads 8 raw_data/${sample}_r1_chr5_12_17.fastq.gz raw_data/${sample}_r2_chr5_12_17.fastq.gz \
               trimmed_reads/${sample}_r1_paired.fq.gz trimmed_reads/${sample}_r1_unpaired.fq.gz \
               trimmed_reads/${sample}_r2_paired.fq.gz trimmed_reads/${sample}_r2_unpaired.fq.gz \
               ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:8:keepBothReads \
               LEADING:3 TRAILING:10 MINLEN:25
       
       fastqc  trimmed_reads/${sample}_r1_paired.fq.gz  trimmed_reads/${sample}_r2_paired.fq.gz \
                 -o trimmed_reads/Fastqc_results
done 

multiqc  trimmed_reads/Fastqc_results  -o trimmed_reads/Fastqc_results

#Mapped read postprocessing
#install the tools
conda install -y -c bioconda bwa
conda install -c bioconda samtools
conda install -c bioconda bamtools

#Read mapping
#Index reference file. But first creat a folder named references and copy the reference from raw data to it.
mkdir reference
cd raw_data
mv  hg19.chr5_12_17.fa ~/newton/judith/reference

# Then index. 
cd reference
bwa index hg19.chr5_12_17.fa 
#5 files will appear
cd ~/judith
#mapping proper
mkdir Mapping
#perform alignment
bwa mem -R '@RG\tID:231335\tSM:Normal' reference/hg19.chr5_12_17.fa trimmed_reads/SLGFSK-N_231335_r1_paired.fq.gz \
      trimmed_reads/SLGFSK-N_231335_r2_paired.fq.gz > Mapping/SLGFSK-N_231335.sam

bwa mem -R '@RG\tID:231336\tSM:Tumor' reference/hg19.chr5_12_17.fa trimmed_reads/SLGFSK-T_231336_r1_paired.fq.gz \
       trimmed_reads/SLGFSK-T_231336_r2_paired.fq.gz > Mapping/SLGFSK-T_231336.sam	

 #Conversion of SAM file to BAM file, indexing and sorting
 for sample in `cat list.txt`
do
        #Convert SAM to BAM and sort it 
        samtools view -@ 20 -S -b Mapping/${sample}.sam | samtools sort -@ 32 > Mapping/${sample}.sorted.bam
        
        #Index BAM file
        samtools index Mapping/${sample}.sorted.bam
done

#Mapped reads filtering
for sample in `cat list.txt`
do
	
        samtools view -q 1 -f 0x2 -F 0x8 -b Mapping/${sample}.sorted.bam > Mapping/${sample}.filtered1.bam
done
#remove pcr duplicates that can cause false SNPs
#use the command markdup
for sample in `cat list.txt`
do
	samtools collate -o Mapping/${sample}.namecollate.bam Mapping/${sample}.filtered1.bam
        samtools fixmate -m Mapping/${sample}.namecollate.bam Mapping/${sample}.fixmate.bam
        samtools sort -@ 32 -o Mapping/${sample}.positionsort.bam Mapping/${sample}.fixmate.bam
        samtools markdup -@32 -r Mapping/${sample}.positionsort.bam Mapping/${sample}.clean.bam
done

#Left Align BAM
for sample in `cat list.txt`
do      
        cat Mapping/${sample}.clean.bam  | bamleftalign -f hg19.chr5_12_17.fa -m 5 -c > Mapping/${sample}.leftAlign.bam

#-c - compressed, -m - max-iterations

#Recalibrate read mapping qualities
for sample in `cat list.txt`
do
        samtools calmd -@ 32 -b Mapping/${sample}.leftAlign.bam hg19.chr5_12_17.fa > Mapping/${sample}.recalibrate.bam
done

#Refilter read mapping qualities
for sample in `cat list.txt`
do
        bamtools filter -in Mapping/${sample}.recalibrate.bam -mapQuality <=254 > Mapping/${sample}.refilter.bam
done

#Variant calling and classification
#install tool using wget https://sourceforge.net/projects/varscan/files/VarScan.v2.3.9.jar		
#Convert data to pileup
mkdir Variants

for sample in `cat list.txt`
do
        samtools mpileup -f hg19.chr5_12_17.fa Mapping/${sample}.refilter.bam --min-MQ 1 --min-BQ 28 \
                > Variants/${sample}.pileup
done

#Call variants
java -jar VarScan.v2.3.9.jar somatic Variants/SLGFSK-N_231335.pileup \
        Variants/SLGFSK-T_231336.pileup Variants/SLGFSK \
        --normal-purity 1  --tumor-purity 0.5 --output-vcf 1 

#Merge vcf: VarScan generates 2 outputs (indel.vcf and snp.vcf), merge the two into one vcf file using bcftools.

#merge vcf
bgzip Variants/SLGFSK.snp.vcf > Variants/SLGFSK.snp.vcf.gz
bgzip Variants/SLGFSK.indel.vcf > Variants/SLGFSK.indel.vcf.gz
tabix Variants/SLGFSK.snp.vcf.gz
tabix Variants/SLGFSK.indel.vcf.gz
bcftools merge Variants/SLGFSK.snp.vcf.gz Variants/SLGFSK.indel.vcf.gz > Variants/SLGFSK.vcf

#Variant Annotation
#Functional Annotation using SnpEff
#download jar file
wget https://snpeff.blob.core.windows.net/versions/snpEff_latest_core.zip

# Unzip file
unzip snpEff_latest_core.zip
		
#download snpEff database
java -jar snpEff.jar download hg19

#annotate variants
java -Xmx8g -jar snpEff/snpEff.jar hg19 Variants/SLGFSK.vcf > Variants/SLGFSK.ann.vcf