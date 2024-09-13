#!/bin/bash
#$ -M jcarpen3@nd.edu
#$ -m e
#$ -q hpc@@colon

array=(
)

for index in $(seq 30.0 0.4 59.4)
do
string=${index}
lmps_file=bix_vol_${string}.lmps
in_file=bix_vol_${string}
job_file=bix_vol_${string}.job

cp obtain_pressure_template.in ${in_file}.in
sed -i "s/VARIABLE/${lmps_file}/g" ${in_file}.in

cp obtain_pressure_template.job ${job_file}
sed -i "s/VARIABLE/${in_file}/g" ${job_file}

qsub ${job_file}

echo "Submitted analysis for x_len=${string}"

done
