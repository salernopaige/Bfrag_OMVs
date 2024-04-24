#!/bin/bash -l  
#PBS -N tmhmm_bfrag
#PBS -l nodes=1:ppn=16  
#PBS -l walltime=2:00:00  
#PBS -m ea  
#PBS -M paige.salerno.gr@dartmouth.edu
   
cd $PBS_O_WORKDIR  

tmhmm -f ETBF_GCF_001699885.1_ASM169988v1_protein.faa

tmhmm -f NCTC9343_GCF_000025985.1_ASM2598v1_protein.faa