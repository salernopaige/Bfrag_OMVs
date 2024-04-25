#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=72:00:00

## Hybrid Unicycler Assembly:
#echo BF 86-5443-2-2
#unicycler -1 Illumina_Reads/BF_86_5443_2_2/BF_86_5443_2_2_R1_fastp.fastq.gz \
#-2 Illumina_Reads/BF_86_5443_2_2/BF_86_5443_2_2_R2_fastp.fastq.gz \
#-l Nanopore_Reads/BF_86_5443_2_2_nanopore.fastq.gz \
#-o Unicycler_assemblies/BF_86_5443_2_2/ \
#--mode bold --threads 16

date

echo BF Korea 419
fastp --in1 Illumina_Reads/BF_Korea_419/BF_Korea_419_S127_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_Korea_419/BF_Korea_419_S127_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_Korea_419/BF_Korea_419_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_Korea_419/BF_Korea_419_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_Korea_419/BF_Korea_419_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_Korea_419/BF_Korea_419_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_Korea_419/BF_Korea_419_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_Korea_419/BF_Korea_419_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_Korea_419_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_Korea_419/ \
--mode bold --threads 16

date

echo BF BB19E13_C8
fastp --in1 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_S133_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_S133_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_BB19E13_C8/BF_BB19E13_C8_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_BB19E13_C8_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_BB19E13_C8/ \
--mode bold --threads 16

date

echo BF 23BBlood13-D12
fastp --in1 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_S134_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_S134_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_23BBlood13_D12/BF_23BBlood13_D12_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_23BBlood13_D12_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_23BBlood13_D12/ \
--mode bold --threads 16

date

echo BF ATCC 4385
fastp --in1 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_S130_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_S130_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_ATCC_4385/BF_ATCC_4385_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_ATCC_4385_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_ATCC_4385/ \
--mode bold --threads 16

date

echo BF DS-71
fastp --in1 Illumina_Reads/BF_DS_71/BF_DS_71_S129_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_DS_71/BF_DS_71_S129_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_DS_71/BF_DS_71_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_DS_71/BF_DS_71_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_DS_71/BF_DS_71_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_DS_71/BF_DS_71_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_DS_71/BF_DS_71_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_DS_71/BF_DS_71_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_DS_71_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_DS_71/ \
--mode bold --threads 16

date

echo BF DS-208
fastp --in1 Illumina_Reads/BF_DS_208/BF_DS_208_S131_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_DS_208/BF_DS_208_S131_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_DS_208/BF_DS_208_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_DS_208/BF_DS_208_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_DS_208/BF_DS_208_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_DS_208/BF_DS_208_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_DS_208/BF_DS_208_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_DS_208/BF_DS_208_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_DS_208_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_DS_208/ \
--mode bold --threads 16

date

echo BF J38-1
fastp --in1 Illumina_Reads/BF_J38_1/BF_J38_1_S128_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_J38_1/BF_J38_1_S128_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_J38_1/BF_J38_1_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_J38_1/BF_J38_1_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_J38_1/BF_J38_1_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_J38_1/BF_J38_1_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_J38_1/BF_J38_1_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_J38_1/BF_J38_1_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_J38_1_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_J38_1/ \
--mode bold --threads 16

date

echo BF TB9
fastp --in1 Illumina_Reads/BF_TB9/BF_TB9_S132_R1_001.fastq.gz \
--in2 Illumina_Reads/BF_TB9/BF_TB9_S132_R2_001.fastq.gz \
--out1 Illumina_Reads/BF_TB9/BF_TB9_R1_fastp.fastq.gz \
--out2 Illumina_Reads/BF_TB9/BF_TB9_R2_fastp.fastq.gz \
--unpaired1 Illumina_Reads/BF_TB9/BF_TB9_unpaired_fastp.fastq.gz \
--unpaired2 Illumina_Reads/BF_TB9/BF_TB9_unpaired_fastp.fastq.gz

unicycler -1 Illumina_Reads/BF_TB9/BF_TB9_R1_fastp.fastq.gz \
-2 Illumina_Reads/BF_TB9/BF_TB9_R2_fastp.fastq.gz \
-l Nanopore_Reads/BF_TB9_nanopore.fastq.gz \
-o Unicycler_assemblies/BF_TB9/ \
--mode bold --threads 16

