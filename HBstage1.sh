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
#create a folder for each software's output
mkdir qc_output
mkdir trimming_output
mkdir bwa_output

#run fastqc on listed dataset
fastqc ~/listed_dataset/*.fastg.gz
cd listed_dataset/
ls
mv *.html *.zip ~/output/qc_output
cd ~/output/qc_output

#run fastp on the listed dataset to trim
cd trimming_output

