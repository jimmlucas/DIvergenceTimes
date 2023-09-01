#!/bin/bash

INPUT="/Users/jimmlucas/Tesis/Data/VariantCalling/*.g.vcf.gz"
OUTPUT="/Users/jimmlucas/Tesis/Data/VariantCalling/combined.g.vcf.gz"
REF_GENOME="/Users/jimmlucas/Tesis/Data/Reference_genome/CBS12357_polished_20170509.fasta"

for vcf_file in $INPUT;
do
    echo "Agregando $vcf_file al archivo combinado"
    gatk CombineGVCFs \
        -R "$reference_genome" \
        -V "$vcf_file" \
        -O "$OUTPUT"
done