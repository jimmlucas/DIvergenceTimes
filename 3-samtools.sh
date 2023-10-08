#!/bin/bash                                                                                                                                                                                             

FILE="/Users/jimmlucas/Tesis/Data/Mapping/"

for f in "$FILE"/*.bam
do
      OUT_PUT=$(basename "$f" .bam)
      
      samtools sort "$FILE/$OUT_PUT.bam" \
      -o "$FILE/$OUT_PUT.sorted.bam"
  
      samtools index "$FILE/$OUT_PUT.sorted.bam"
done