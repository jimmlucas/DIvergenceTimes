#!/bin/bash

IMPUT_DIR="/Users/jimmlucas/Tesis/Data/Mapping"
OUTPUT="/Users/jimmlucas/Tesis/Data/Duplicate"

for file in $IMPUT_DIR/*.sorted.bam
do
    FILE="$file"
    OUT_PUT=$(basename "$FILE" .sorted.bam)
 
        picard MarkDuplicates \
        I=$FILE \
        O="$OUTPUT/$OUT_PUT.dedup.bam" \
        METRICS_FILE=markDuplicatesMetrics.txt \
        ASSUME_SORTED=TRUE
done