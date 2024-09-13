

conda activate raspa_env


for variable in 1e3 2e3 4e3 7e3 1e4 2e4 4e4 7e4 1e5 2e5 4e5 5e5 6e5 7e5 9e5 1e6 1.5e6 2e6 3e6 5e6 7e6 9e6 1e7 2e7 3e7 4e7 5e7 6e7 7e7
do 
	mkdir Dabco_vol_40.97_$variable 
	cd Dabco_vol_40.97_$variable 
	cp /scratch365/jvegadia/RASPA/Dabco_cifs/simulation.input_40.97  ./simulation.input
	cp /scratch365/jvegadia/RASPA/Dabco_cifs/Raspa_template .
	sed -i "s/Dabco_vol_pressureID/Dabco_vol_pressure_$variable/g" /scratch365/jvegadia/RASPA/Dabco_cifs/Dabco_vol_40.97_$variable/Raspa_template
	sed -i "s/ExternalPressure 999/ExternalPressure $variable/g" /scratch365/jvegadia/RASPA/Dabco_cifs/Dabco_vol_40.97_$variable/simulation.input
	qsub Raspa_template
	sleep 10s
	cd /scratch365/jvegadia/RASPA/Dabco_cifs/ 
done









