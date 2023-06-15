#!/bin/bash                                                                                                                                                                                             

REF_GENOME="/Users/jimmlucas/Tesis/Data/Reference_genome/CBS12357_polished_20170509.fasta"
READS_DIR="/Users/jimmlucas/Tesis/Data/Processed/Filtering/Triming"
OUTPUT_DIR="/Users/jimmlucas/Tesis/Data/Mapping"

for f in "$READS_DIR"/*_paired.fastq.gz
do
    base=$(basename "${f}" "_1_paired.fastq.gz")  
    base=$(basename "${base}" "_2_paired.fastq.gz")

    read1="${READS_DIR}/${base}_1_paired.fastq.gz"
    read2="${READS_DIR}/${base}_2_paired.fastq.gz"
    out="${OUTPUT_DIR}/${base}.sam"
    
    bwa mem -M -t4 "$REF_GENOME" "$read1" "$read2" > "$out"
    
    samtools view -b "$out" > "${out%.sam}.bam"
 
 done
