#!/bin/bash
for i in {1..62}
do
  usearch -fastq_mergepairs "AgapakisFastq01252014/Agapakis-""$i""_S""$i""_L001_R1_001.fastq" -reverse "AgapakisFastq01252014/Agapakis-""$i""_S""$i""_L001_R2_001.fastq" -fastq_truncqual 2 -fastqout "merged/S""$i""_merged.fastq" -fastq_allowmergestagger 
done
