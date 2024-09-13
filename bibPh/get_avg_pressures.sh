#!/bin/bash
#$ -M jcarpen3@nd.edu
#$ -m e
#$ -q hpc@@colon

module load python

rm pressures.txt
echo "avg_press    volume" >> pressures.txt

for index in $(seq 24.18 0.2 60.98)
do
string=${index}
lmps_file=bibPh_vol_${string}.lmps
in_file=bibPh_vol_${string}

#python3 -W ignore analyze_lmps.py ${in_file}.out pressures.txt
python3 analyze_lmps.py ${in_file}.out pressures.txt

done
