

conda activate raspa_env

for variable in 1e3 2e3 4e3 7e3 1e4 2e4 4e4 7e4 1e5 2e5 4e5 5e5 6e5 7e5 9e5 1e6 1.5e6 2e6 3e6 5e6 7e6 9e6 1e7 2e7 3e7 4e7 5e7 6e7 7e7
do 
	mkdir bipy_vol_46.49_$variable 
	cd bipy_vol_46.49_$variable 
	cp /scratch365/jvegadia/RASPA/bipy_cifs/simulation.input_46.49  ./simulation.input
	cp /scratch365/jvegadia/RASPA/bipy_cifs/Raspa_template .
	sed -i "s/bipy_vol_pressureID/bipy_vol_pressure_$variable/g" /scratch365/jvegadia/RASPA/bipy_cifs/bipy_vol_46.49_$variable/Raspa_template
	sed -i "s/ExternalPressure 999/ExternalPressure $variable/g" /scratch365/jvegadia/RASPA/bipy_cifs/bipy_vol_46.49_$variable/simulation.input
	qsub Raspa_template
	sleep 10s
	cd /scratch365/jvegadia/RASPA/bipy_cifs/ 
done









