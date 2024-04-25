#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
echo running fastp
ls *.fastq.gz | while read x; do

  # save the file name
  sample=`echo "$x"`
  # get everything in file name before "/" (to remove '../smRNA-Seq_201201/')
  sample=`echo "$sample" | cut -d"/" -f8`
  # get everything in file name before "_" e.g. "ETBF_" or "NCTC-9343_"
  sample=`echo "$sample" | cut -d"." -f1`
  echo processing "$sample"
  
  fastp -i ${sample}.fastq.gz -o ${sample}.fastp.fastq.gz -U --umi_loc=index1 -h ${sample}.html -j ${sample}.json

done
