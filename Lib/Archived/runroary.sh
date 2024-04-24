#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=24:00:00

roary -f ./roary_results -r -v -e -n -p 16 *.gff
