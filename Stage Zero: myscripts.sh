#!/usr/bin/bash

firstname="Judith"
lastname="Mbamalu"

# Print strings on same line.
echo $firstname $lastname

#Print strings on different lines.
echo $firstname
echo $lastname

#Bash story one
#One- Create a directory with name 
mkdir Judith_Mbamalu

# Two- Create another directory named biocomputing and change to that directory in one line of command
mkdir biocomputing && cd $_

#Three- Download the three files 
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

# Four- Move the .fna file to the folder named Judith_Mbamalu
mv wildtype.fna ../Judith_Mbamalu

# Five- Delete the duplicated file
rm wildtype.gbk.1

# Six- Confirm if the file is mutant or wildtype
grep "tatatata" ../Judith_Mbamalu/wildtype.fna

# Seven- Print all the line
grep "tatatata" ../Judith_Mbamalu/wildtype.fna > mutant.txt

# Eight - Clear terminal and print all the command used today
clear && history

# Nine- List the files in the two folders
ls ~/Judith_Mbamalu ~/biocomputing 


# Bash story two
# One- Graphical representation
#Download the command
sudo apt-get install figlet
figlet Judith

# Three- Create a folder named compare 
mkdir compare

# Four-
# a Download the file within compare
cd compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz

# b Unzip the file 
gunzip unix_intro_data.tar.gz

# c untar the file 
tar -xvf unix_intro_data.tar

# d  Identify the rRNAs present in Mito.dat within seqmonk_genomes
cd "seqmonk_genomes/Saccharomyces cerevisiae/EF4"

grep "rRNA" Mito.dat
# e Copy Mito.dat to compare 
cp Mito.dat ~/compare/

# f -i Change Mito to Mitochondrion in the ID and AC header lines
nano Mito.dat

#  f-ii Save the file using ctrl + s and exit with ctrl + x

# f-iii Rename Mito.dat to Mitichondrion
mv Mito.dat Mitochondrion.txt

# Move to compare and cd to FastQ_Data directory
cd ~/compare/
cd FastQ_Data 

# calculate the total number of lines in lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
cat lane8_DD_P4_TTAGGC_L008_R1.fastq.gz | wc -l

# Print the total number of lines in all fastq.gz files and save it as a new file.
cat *.fastq.gz | wc -l > newfile.txt
