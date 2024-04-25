#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=48:00:00
#echo Running 86-5443-2-2
#unicycler -1 Illumina_Reads/BF_86_5443_2_2/BF_86_5443_2_2_S126_R1_001.fastq.gz -2 Illumina_Reads/BF_86_5443_2_2/BF_86_5443_2_2_S126_R2_001.fastq.gz -l Nanopore_Reads/BF_86_5443_2_2_nanopore.fastq.gz -o Assemblies_201107/BF_86_5443_2_2_Output --mode bold

#date
#echo Running Korea 419

#unicycler -1 Illumina_Reads/BF_Korea_419/BF_Korea_419_S127_R1_001.fastq.gz -2 Illumina_Reads/BF_Korea_419/BF_Korea_419_S127_R2_001.fastq.gz -l Nanopore_Reads/BF_Korea_419_nanopore.fastq.gz -o Assemblies_201107/BF_Korea_419_Output --mode bold

#date
#echo Running 19BBE13_C8

#unicycler -1 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_S133_R1_001.fastq.gz -2 Illumina_Reads/BF_BB19E13_C8/BF_19BBE13_C8_S133_R2_001.fastq.gz -l Nanopore_Reads/BF_19BBE13_C8_nanopore.fastq.gz -o Assemblies_201107/BF_19BBE13_C8_Output --mode bold

#date
#echo Running 23BBlood13_D12

#unicycler -1 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_S134_R1_001.fastq.gz -2 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_S134_R2_001.fastq.gz -l Nanopore_Reads/BF_23BBlood13_D12_nanopore.fastq.gz -o Assemblies_201107/BF_23BBlood13_D12_Output --mode bold

#date
#echo Running ATCC_4385

#unicycler -1 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_S130_R1_001.fastq.gz -2 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_S130_R2_001.fastq.gz -l Nanopore_Reads/BF_ATCC_4385_nanopore.fastq.gz -o Assemblies_201107/BF_ATCC_4385_Output --mode bold

#date
#echo Running DS_71

#unicycler -1 Illumina_Reads/BF_DS_71/BF_DS_71_S129_R1_001.fastq.gz -2 Illumina_Reads/BF_DS_71/BF_DS_71_S129_R2_001.fastq.gz -l Nanopore_Reads/BF_DS_71_nanopore.fastq.gz -o Assemblies_201107/BF_DS_71_Output --mode bold

#date
echo Running DS_208

unicycler -1 Illumina_Reads/BF_DS_208/BF_DS_208_S131_R1_001.fastq.gz -2 Illumina_Reads/BF_DS_208/BF_DS_208_S131_R2_001.fastq.gz -l Nanopore_Reads/BF_DS_208_nanopore.fastq.gz -o Assemblies_201107/BF_DS_208_Output --mode bold

date
echo Running J38-1

unicycler -1 Illumina_Reads/BF_J38_1/BF_J38_1_S128_R1_001.fastq.gz -2 Illumina_Reads/BF_J38_1/BF_J38_1_S128_R2_001.fastq.gz -l Nanopore_Reads/BF_J38_1_nanopore.fastq.gz -o Assemblies_201107/BF_J38_1_Output --mode bold

date
echo Running TB9

unicycler -1 Illumina_Reads/BF_TB9/BF_TB9_S132_R1_001.fastq.gz -2 Illumina_Reads/BF_TB9/BF_TB9_S132_R2_001.fastq.gz -l Nanopore_Reads/BF_TB9_nanopore.fastq.gz -o Assemblies_201107/BF_TB9_Output --mode bold
