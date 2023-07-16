#!/bin/bash/

IMPUT_DIR="/Users/jimmlucas/Tesis/Data/Annotation"
OUTPUT="/Users/jimmlucas/Tesis/Data/VariantCalling"
REF_GENOME="/Users/jimmlucas/Tesis/Data/Reference_genome/CBS12357_polished_20170509.fasta"

for f in $IMPUT_DIR/*.dedup.bam.RG.bam
do
    FILE="$f"
    OUT_PUT="$(echo $FILE | sed 's/dedup.bam.RG.bam/vcf/')"
    gatk --java-options "-Xmx4g" HaplotypeCaller\
    -R $REF_GENOME \
    -I $FILE \
    -O "{$OUT_PUT}"
done