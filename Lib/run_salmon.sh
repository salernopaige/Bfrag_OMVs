#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
echo running salmon
ls NCTC-9343_*.fastp.fastq.gz | while read x; do

  # save the file name
  sample=`echo "$x"`
  # get everything in file name before "/" (to remove '../smRNA-Seq_201201/')
  sample=`echo "$sample" | cut -d"/" -f8`
  # get everything in file name before "fastp" e.g. "NCTC-9343_"
  sample=`echo "$sample" | cut -d"." -f1`
  echo processing "$sample"
  
  salmon quant -i index/NCTC_index/ -l A -r ${sample}.fastp.fastq.gz -o quant/${sample}.quant --validateMappings --rangeFactorizationBins 4 --gcBias --seqBias

done

ls ETBF_*.fastp.fastq.gz | while read x; do

  # save the file name
  sample=`echo "$x"`
  # get everything in file name before "/" (to remove '../smRNA-Seq_201201/')
  sample=`echo "$sample" | cut -d"/" -f8`
  # get everything in file name before "fastp" e.g. "ETBF_"
  sample=`echo "$sample" | cut -d"." -f1`
  echo processing "$sample"
  
  salmon quant -i index/NCTC_index/ --libType A -r ${sample}.fastp.fastq.gz -o quant/${sample}_quant --validateMappings --rangeFactorizationBins 4 --gcBias --seqBias 

done





