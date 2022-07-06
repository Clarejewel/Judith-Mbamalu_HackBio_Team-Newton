#!/usr/bin/env bash
#create script to download each region
#1. European Region (Greece)
mkdir raw_data
nano gr_downloader.sh
#!/usr/bin/env bash

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/000/SRR8607460/SRR8607460_1.fastq.gz -o SRR8607460_GR_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/000/SRR8607460/SRR8607460_2.fastq.gz -o SRR8607460_GR_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/001/SRR8607471/SRR8607471_1.fastq.gz -o SRR8607471_GR_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/001/SRR8607471/SRR8607471_2.fastq.gz -o SRR8607471_GR_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/000/SRR8607470/SRR8607470_1.fastq.gz -o SRR8607470_GR_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/000/SRR8607470/SRR8607470_2.fastq.gz -o SRR8607470_GR_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/008/SRR8607468/SRR8607468_1.fastq.gz -o SRR8607468_GR_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/008/SRR8607468/SRR8607468_2.fastq.gz -o SRR8607468_GR_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/009/SRR8607469/SRR8607469_1.fastq.gz -o SRR8607469_GR_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR860/009/SRR8607469/SRR8607469_2.fastq.gz -o SRR8607469_GR_2.fastq.gz


#2.	Eastern Mediteranian Region (Pakistan)
mkdir raw_data
nano pak_downloader.sh
#!/usr/bin/env bash

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/055/SRR13007255/SRR13007255_1.fastq.gz -o SRR13007255_PAK_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/055/SRR13007255/SRR13007255_2.fastq.gz -o SRR13007255_PAK_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/051/SRR13007251/SRR13007251_1.fastq.gz -o SRR13007251_PAK_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/051/SRR13007251/SRR13007251_2.fastq.gz -o SRR13007251_PAK_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/053/SRR13007253/SRR13007253_1.fastq.gz -o SRR13007253_PAK_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/053/SRR13007253/SRR13007253_2.fastq.gz -o SRR13007253_PAK_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/052/SRR13007252/SRR13007252_1.fastq.gz -o SRR13007252_PAK_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/052/SRR13007252/SRR13007252_2.fastq.gz -o SRR13007252_PAK_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/054/SRR13007254/SRR13007254_1.fastq.gz -o SRR13007254_PAK_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR130/054/SRR13007254/SRR13007254_2.fastq.gz -o SRR13007254_PAK_2.fastq.gz



#3. 	African Region (AFR) (South Africa)
mkdir raw_data

nano sa_downloader.sh
#!/usr/bin/env bash

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/009/ERR6384999/ERR6384999_1.fastq.gz -o ERR6384999_SA_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/009/ERR6384999/ERR6384999_2.fastq.gz -o ERR6384999_SA_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/005/ERR6384995/ERR6384995_1.fastq.gz -o ERR6384995_SA_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/005/ERR6384995/ERR6384995_2.fastq.gz -o ERR6384995_SA_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/007/ERR6384997/ERR6384997_1.fastq.gz -o ERR6384997_SA_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/007/ERR6384997/ERR6384997_2.fastq.gz -o ERR6384997_SA_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/003/ERR6384993/ERR6384993_1.fastq.gz -o ERR6384993_SA_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/003/ERR6384993/ERR6384993_2.fastq.gz -o ERR6384993_SA_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/008/ERR6384998/ERR6384998_1.fastq.gz -o ERR6384998_SA_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR638/008/ERR6384998/ERR6384998_2.fastq.gz -o ERR6384998_SA_2.fastq.gz



#4.	Region of the Americas (USA)
mkdir rawdata
nano us_downloader.sh
#!/usr/bin/env bash

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/066/SRR14108566/SRR14108566_1.fastq.gz -o SRR14108566_US_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/066/SRR14108566/SRR14108566_2.fastq.gz -o SRR14108566_US_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/055/SRR14108555/SRR14108555_1.fastq.gz -o SRR14108555_US_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/055/SRR14108555/SRR14108555_2.fastq.gz -o SRR14108555_US_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/059/SRR14108559/SRR14108559_1.fastq.gz -o SRR14108559_US_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/059/SRR14108559/SRR14108559_2.fastq.gz -o SRR14108559_US_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/057/SRR14108557/SRR14108557_1.fastq.gz -o SRR14108557_US_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/057/SRR14108557/SRR14108557_2.fastq.gz -o SRR14108557_US_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/064/SRR14108564/SRR14108564_1.fastq.gz -o SRR14108564_US_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR141/064/SRR14108564/SRR14108564_2.fastq.gz -o SRR14108564_US_2.fastq.gz



#5. Western Pacific Region (WPR) (Vietnam)
mkdir rawdata
nano viet_downloader.sh
#!/usr/bin/env bash

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/009/SRR6656609/SRR6656609_1.fastq.gz -o SRR6656609_viet_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/009/SRR6656609/SRR6656609_2.fastq.gz -o SRR6656609_viet_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/000/SRR6656610/SRR6656610_1.fastq.gz -o SRR6656610_viet_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/000/SRR6656610/SRR6656610_2.fastq.gz -o SRR6656610_viet_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/006/SRR6656626/SRR6656626_1.fastq.gz -o SRR6656626_viet_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/006/SRR6656626/SRR6656626_2.fastq.gz -o SRR6656626_viet_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/007/SRR6656627/SRR6656627_1.fastq.gz -o SRR6656627_viet_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/007/SRR6656627/SRR6656627_2.fastq.gz -o SRR6656627_viet_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/008/SRR6656628/SRR6656628_1.fastq.gz -o SRR6656628_viet_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR665/008/SRR6656628/SRR6656628_2.fastq.gz -o SRR6656628_viet_2.fastq.gz



#Quality control script
qc.sh
#mkdir Fastqc_Reports in all regions:greece, pakistan, unitedstates, southafrica and vietnam

#!/usr/bin/env bash

# run quality control on Greece dataset
mkdir -p greece/Fastqc_Reports

fastqc greece/raw_data/*.fastq.gz -o greece/Fastqc_Reports
multiqc Fastqc_Reports -o Fastqc_Reports

# run quality control on Pakistan dataset
mkdir -p pakistan/Fastqc_Reports

fastqc pakistan/raw_data/*.fastq.gz -o pakistan/Fastqc_Reports
multiqc Fastqc_Reports -o Fastqc_Reports

# run quality control on South Africa dataset
mkdir -p southafrica/Fastqc_Reports

fastqc southafrica/raw_reads/*.fastq.gz -o southafrica/Fastqc_Reports
multiqc Fastqc_Reports -o Fastqc_Reports

# run quality control on United States dataset
mkdir -p unitedstates/Fastqc_Reports

fastqc unitedstates/raw_reads/*.fastq.gz -o unitedstates/Fastqc_Reports
multiqc Fastqc_Reports -o Fastqc_Reports


# run quality control on United States dataset
mkdir -p vietnam/Fastqc_Reports

fastqc unitedstates/raw_reads/*.fastq.gz -o vietnam/Fastqc_Reports
multiqc Fastqc_Reports -o Fastqc_Reports


#Trim using fastp
mkdir -p greece/trimmed_data
mkdir -p pakistan/trimmed_data
mkdir -p southafrica/trimmed_data
mkdir -p unitedstates/trimmed_data
mkdir -p vietnam/trimmed_data

nano trim.sh
#!/usr/bin/env bash

greece_samples=(
  "SRR8607460_GR"
  "SRR8607471_GR"
  "SRR8607470_GR"
  "SRR8607468_GR"
  "SRR8607469_GR"
)

for sample in ${greece_samples[@]}

do
    fastp \
    -i greece/raw_data/${sample}_1.fastq.gz \
    -I greece/raw_data/${sample}_2.fastq.gz \
    -o greece/trimmed_data/${sample}_trimmed_1.fastq.gz \
    -O greece/trimmed_data/${sample}_trimmed_2.fastq.gz \
    --html greece/trimmed_data/${sample}_fastp.html
done


pak_samples=( 
  "SRR13007255_PAK"
  "SRR13007251_PAK"
  "SRR13007253_PAK"
  "SRR13007252_PAK"
  "SRR13007254_PAK"
 )

for sample in ${pak_samples[@]}

do
    fastp \
    -i pakistan/raw_data/${sample}_1.fastq.gz \
    -I pakistan/raw_data/${sample}_2.fastq.gz \
    -o pakistan/trimmed_data/${sample}_trimmed_1.fastq.gz \
    -O pakistan/trimmed_data/${sample}_trimmed_2.fastq.gz \
    --html pakistan/trimmed_data/${sample}_fastp.html
done

  
sa_samples=(
  "ERR6384999_SA"
  "ERR6384995_SA"
  "ERR6384997_SA"
  "ERR6384993_SA"
  "ERR6384998_SA"
)

for sample in ${sa_samples[@]}
do
    fastp \
    -i southafrica/raw_data/${sample}_1.fastq.gz \
    -I southafrica/raw_data/${sample}_2.fastq.gz \
    -o southafrica/trimmed_data/${sample}_trimmed_1.fastq.gz \
    -O southafrica/trimmed_data/${sample}_trimmed_2.fastq.gz \
    --html southafrica/trimmed_data/${sample}_fastp.html
done

us_samples=(
  "SRR14108566_US"
  "SRR14108555_US"
  "SRR14108559_US"
  "SRR14108557_US"
  "SRR14108564_US"
)

for sample in ${us_samples[@]}

do
    fastp \
    -i unitedstates/raw_data/${sample}_1.fastq.gz \
    -I unitedstates/raw_data/${sample}_2.fastq.gz \
    -o unitedstates/trimmed_data/${sample}_trimmed_1.fastq.gz \
    -O unitedstates/trimmed_data/${sample}_trimmed_2.fastq.gz \
    --html unitedstates/trimmed_data/${sample}_fastp.html
done


viet_samples=(
  "SRR6656609_viet"
  "SRR6656610_viet"
  "SRR6656626_viet"
  "SRR6656627_viet"
  "SRR6656628_viet"
 )

for sample in ${viet_samples[@]}

do
    fastp \
    -i vietnam/raw_data/${sample}_1.fastq.gz \
    -I vietnam/raw_data/${sample}_2.fastq.gz \
    -o vietnam/trimmed_data/${sample}_trimmed_1.fastq.gz \
    -O vietnam/trimmed_data/${sample}_trimmed_2.fastq.gz \
    --html vietnam/trimmed_data/${sample}_fastp.html
done


#Assembly
nano assembly.sh
#!usr/bin/env bash

# Run assembly
mkdir -p greece/assembly
mkdir -p pakistan/assembly
mkdir -p southafrica/assembly
mkdir -p unitedstates/assembly
mkdir -p vietnam/assembly


greece_samples=(
  "SRR8607460_GR"
  "SRR8607471_GR"
  "SRR8607470_GR"
  "SRR8607468_GR"
  "SRR8607469_GR"
)

for sample in ${greece_samples[@]}


do
   spades.py --careful \
   -1 greece/trimmed_data/${sample}_trimmed_1.fastq.gz \
   -2 greece/trimmed_reads/${sample}_trimmed_2.fastq.gz \
   -o greece/assembly/${sample}
done


pak_samples=( 
  "SRR13007255_PAK"
  "SRR13007251_PAK"
  "SRR13007253_PAK"
  "SRR13007252_PAK"
  "SRR13007254_PAK"
 )

for sample in ${pak_samples[@]}
do
   spades.py --careful \
   -1 pakistan/trimmed_data/${sample}_trimmed_1.fastq.gz \
   -2 pakistan/trimmed_reads/${sample}_trimmed_2.fastq.gz \
   -o pakistan/assembly/${sample}
done

sa_samples=(
  "ERR6384999_SA"
  "ERR6384995_SA"
  "ERR6384997_SA"
  "ERR6384993_SA"
  "ERR6384998_SA"
)

for sample in ${sa_samples[@]}
do
   spades.py --careful \
   -1 southafrica/trimmed_data/${sample}_trimmed_1.fastq.gz \
   -2 southafrica/trimmed_reads/${sample}_trimmed_2.fastq.gz \
   -o southafrica/assembly/${sample}
done


us_samples=(
  "SRR14108566_US"
  "SRR14108555_US"
  "SRR14108559_US"
  "SRR14108557_US"
  "SRR14108564_US"
)

for sample in ${us_samples[@]}
do
   spades.py --careful \
   -1 unitedstates/trimmed_data/${sample}_trimmed_1.fastq.gz \
   -2 unitedstates/trimmed_reads/${sample}_trimmed_2.fastq.gz \
   -o unitedstates/assembly/${sample}
done

viet_samples=(
  "SRR6656609_viet"
  "SRR6656610_viet"
  "SRR6656626_viet"
  "SRR6656627_viet"
  "SRR6656628_viet"
 )

for sample in ${viet_samples[@]}

do
   spades.py --careful \
   -1 vietnam/trimmed_data/${sample}_trimmed_1.fastq.gz \
   -2 vietnam/trimmed_reads/${sample}_trimmed_2.fastq.gz \
   -o vietnam/assembly/${sample}
done

#Load unto Resfinder

