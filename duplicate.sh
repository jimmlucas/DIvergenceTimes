#!/bin/bash

IMPUT_DIR="/Users/jimmlucas/Tesis/Data/Mapping"
OUTPUT="/Users/jimmlucas/Tesis/Data/Annotation"

for file in $IMPUT_DIR/*.sorted.bam
do
    FILE="$file"
    OUT_PUT=$(basename "$FILE" .sorted.bam)

    picard AddOrReplaceReadGroups \
    I=$FILE \
    O="$FILE/$OUT_PUT.RG.bam" \
    RGID="$OUT_PUT" \
    RGLB=lib1 \
    RGPL=ILLUMINA \
    RGPU=unit1 \
    RGSM="$OUT_PUT" \
    CREATE_INDEX=true
done