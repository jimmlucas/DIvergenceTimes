#!/bin/bash

IMPUT_DIR="/Users/jimmlucas/Tesis/Data/Mapping"
OUTPUT="/Users/jimmlucas/Tesis/Data/Annotation"
GATK="/opt/homebrew/Caskroom/miniforge/base/envs/tesi/share/gatk4-4.4.0.0-0/gatk-package-4.4.0.0-local.jar"

for file in $IMPUT_DIR/*.sorted.bam
do
    FILE="$file"
    OUT_PUT=$(basename "$f" .sorted.bam)

    java -jar $GATK AddOrReplaceReadGroups \
    -I $FILE \
    -O $OUT_PUT.RG.bam \
    -SORT_ORDER coordinate \
    -RGID $OUT_PUT \
    -RGLB 01 \
    -RGPL illumina \
    -RGPU 001 \
    -CREATE_INDEX True
done