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










