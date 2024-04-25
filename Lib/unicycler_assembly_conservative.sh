#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=24:00:00

unicycler -1 Illumina_Reads/BF_86_5443_2_2/BF_86_5443_2_2_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_86_5443_2_2/BF_86_5443_2_2_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_86_5443_2_2_nanopore.fastq.gz \
-o Unicycler_assemblies_conservative/BF_86_5443_2_2 \
--mode conservative --threads 16
