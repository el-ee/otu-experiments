#!/bin/bash

# reasoning here: 
# Paired reads with overlap
# "If you have paired reads with an overlap that is long enough to merge them using fastq_mergepairs" (done)
# "then it is usually best to merge first, then quality filter with fastq_filter using a maximum expected"
# "errors threshold with no length truncation."

# on what expected errors mean:
# "the expected number of errors is the average number of errors per read that we would find in that sample of reads. This is roughly equivalent to the most likely number of errors in the read, though the number of expected errors is not always an integer and can be less than one."

# guidance on maxee: 
# "Set the maximum expected error parameter (fastq_maxee) to a few reasonable values (say, 0.25, 0.5 and 1) "

# e.g. sample 1:
# with ee of 1, only 28.6% of reads are kept, rest are all discarded for ee > 1.00
# similar for other samples, in the 20-30% of reads kept 

# elsewhere, people discuss higher numbers as reasonable, e.g. 3 (https://wiki.bils.se/wiki/Running_the_Uparse_pipeline_at_the_UPPMAX_cluster)
# 2 gives about 50%
# 3 gives about 65%
# 4 gives around 75%+


for i in {1..62}
do
  usearch -fastq_filter "merged/S""$i""_merged.fastq" -fastq_maxee 3.2 -fastaout "filtered_a/S""$i""_filtered.fasta" -fastqout "filtered_q/S""$i""_filtered.fastq" 
done



