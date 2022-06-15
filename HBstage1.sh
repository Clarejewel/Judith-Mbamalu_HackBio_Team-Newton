#!/bin/bash 
  
#Count no of sequences in DNA.fa 
#First download the file
wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa
nano DNA.fa
grep -c "^>" DNA.fa
cat DNA.fa
#One line command in Bash to get total A, T, G, C counts
$echo -e "seq_id\tA\tT\tG\tC"; while read line; do echo $line | grep ">" | sed 's/>//g'; for i in A T G C;do echo $line | grep -v ">" | grep -o $i | wc -l | grep -v "^0"; done; done < DNA.fa | paste - - - - -

#Picked fastp, fastqc and bwa
#setting up conda environment
#download minicondona
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
ls
bash Miniconda3-latest-Linux-x86_64.sh
exit
#download and install the softwares
conda install -y -c bioconda \
fastp \
fastqc \
bwa
#download datasets from the link provided https://github.com/josoga2/yt-dataset/tree/main/dataset
mkdir listed_dataset && cd $_        

wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R2.fastq.gz?raw=true -O ACBarrie_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R1.fastq.gz?raw=true -O Alsen_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R2.fastq.gz?raw=true -O Alsen_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R1.fastq.gz?raw=true -O Baxter_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Baxter_R2.fastq.gz?raw=true -O  Baxter_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R1.fastq.gz?raw=true -O Chara_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R2.fastq.gz?raw=true -O Chara_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Drysdale_R1.fastq.gz?raw=true -O Drysdale_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Drysdale_R2.fastq.gz?raw=true -O Drysdale_R2.fastq.gz

#create a folder named output
cd ..
mkdir output
mkdir QC_Output

#run fastqc on listed_dataset. This is the first step once given a set of sequences to process.
#Instead of running the operation on the files one after the other, make use of the wildcard *. The operation below means run fastqc on the files with the extension (*.fastq.gz) in the stated diretory then -o the result to the desired folder. 

fastqc ~/listed_dataset/*.fastq.gz -o QC_Output/

mv QC_Output ~/output/

#To trim low quality reads and trim adapters, run #fastp on the listed dataset. Since working with multiple sequence reads, use a script with a loop to avoid running the operation one by one on all the samples.
#create script in the listed-dataset folder
cd listed_dataset

nano trim.sh

#!/bin/bash 
mkdir trimmed_output
#create an array of sequence files
SAMPLES=(
  "ACBarrie"
  "Alsen"
  "Baxter"
  "Chara"
  "Drysdale"
)

#create a foreloop to run the various sequence reads using their names

for SAMPLE in "${SAMPLES[@]}"; do

fastp \
 -i "$PWD/${SAMPLE}_R1.fastq.gz" \
 -I "$PWD/${SAMPLE}_R2.fastq.gz" \
 -o "trimmed_output/${SAMPLE}_R1.fastq.gz" \
 -O "trimmed_output/${SAMPLE}_R2.fastq.gz" \
 --html "trimmed_output/${SAMPLE}_fastp.html"
 done
#Save and exit
bash trim.sh

#move trimmed_output to Output folder
mv trimmed_output ~/output/

cd
#Genome mapping with Burrow Wheeler Alignment (BWA)
#First correct disordered reads using bbtools.sh
 #Download and install the tool using 
 conda install -c agbiome bbtools

#download the reference genome from https://github.com/josoga2/yt-dataset/tree/main/dataset/references/reference.fasta

mkdir references
wget https://github.com/josoga2/yt-dataset/tree/main/dataset/references/reference.fasta

cd ~/output/
 #Since you are working with multiple sequence reads, write a script.

 nano alignment.sh

 #!/bin/bash 
 #create an array of sequence files
 SAMPLES=(
  "ACBarrie"
  "Alsen"
  "Baxter"
  "Chara"
  "Drysdale"
)
#Build ref genome index with bwa index
bwa index references/reference.fasta
#create folders for the repaired/corrected sequences and the final alignment
mkdir repaired
mkdir alignment_output

#create a foreloop to repair the various sequence reads 

for SAMPLE in "${SAMPLES[@]}"; do

 repair.sh in1="trimmed_output/${SAMPLE}_R1.fastq.gz" in2="trimmed_output/${SAMPLE}_R2.fastq.gz" out1="repaired/${SAMPLE}_R1_rep.fastq.gz" out2="repaired/${SAMPLE}_R2_rep.fastq.gz" outsingle="repaired/${SAMPLE}_single.fq"
 echo $PWD

 #Perform alignment with bwa mem
 bwa mem -t 1 \
 references/reference.fasta \
 "repaired/${SAMPLE}_R1_rep.fastq.gz" "repaired/${SAMPLE}_R2_rep.fastq.gz" \

 #Compress the alignment output with samtools
 | samtools view -b \
 > "alignment_output/${SAMPLE}.bam"
 done
 #Save and Exit
 bash alignment.sh
 
