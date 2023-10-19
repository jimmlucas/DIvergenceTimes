#!/bin/bash

INPUT="/Users/jimmlucas/Tesis/Data/VariantCalling2/*.g.vcf.gz"
OUTPUT="/Users/jimmlucas/Tesis/Data/VariantCalling2/final.vcf.gz"
REF_GENOME="/Users/jimmlucas/Tesis/Data/Reference_genome/CBS12357_polished_20170509.fasta"

gatk --java-options "-Xmx96g -Xms96g" GenotypeGVCFs \
-R $REF_GENOME \
-V $INPUT \
-O $OUTPUT
