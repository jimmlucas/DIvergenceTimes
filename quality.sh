#!/bin/bash

input_dir="/Users/jimmlucas/Tesis/Data/raw_date"
output_dir="/Users/jimmlucas/Tesis/Data/Processed/Filtering/Triming"

trimmomatic_jar="/Users/jimmlucas/Tesis/Trimmomatic-0.39/trimmomatic-0.39.jar"
adapters="/Users/jimmlucas/Tesis/Trimmomatic-0.39/adapters/TruSeq3-PE.fa"
phred="33"
LEADING="20" #Elimina las bases del principio de la lectura hasta que se encuentra una base con calidad mayor a 20.
TRAILING="20" #Elimina las bases del final de la lectura hasta que se encuentra una base con calidad mayor a 20.
SLIDINGWINDOW="4:20" #Analiza la calidad de las bases en ventanas de tamaño 4. Si la calidad media es menor a 20, se recorta la ventana.
MINLEN="50" #Descarta las lecturas que quedan con una longitud menor a 50 bases después de los recortes.

for file in $input_dir/*_1.fastq.gz
do
    pair1="$file"
    pair2="$(echo $pair1 | sed 's/_1/_2/')"

    base="$(basename $pair1 _1.fastq.gz)"
    output_pair1="${output_dir}/${base}_1_paired.fastq.gz"
    output_pair1_unpaired="${output_dir}/${base}_1_unpaired.fastq.gz"
    output_pair2="${output_dir}/${base}_2_paired.fastq.gz"
    output_pair2_unpaired="${output_dir}/${base}_2_unpaired.fastq.gz"
 
    java -jar $trimmomatic_jar PE -threads 4 -phred33 \
    $pair1 $pair2 \
    $output_pair1 $output_pair1_unpaired \
    $output_pair2 $output_pair2_unpaired \
    ILLUMINACLIP:"$adapters":2:30:10 \
    LEADING:$LEADING TRAILING:$TRAILING SLIDINGWINDOW:$SLIDINGWINDOW MINLEN:$MINLEN

    fastqc -o $output_dir $output_pair1 $output_pair2
done                                                      
