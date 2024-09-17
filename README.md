# SPCP_FEP_Adsorption

Files to run molecular dynamics simulations for obtaining free energy profiles are present in Dabco, bibPh, bipy, and bix folders for their respective linkers.

Initial files are of the format data.[details], these are used alongside in.contract and in.expand to obtain files for the relevant range of unit cell volumes using LAMMPS. Using these files, then run the shell script volume_sweep.sh to begin LAMMPS NVT simulations for each data file. Once those simulations have run, use get_avg_pressures.sh to get average pressures for calculating free energy profiles using the analyze_lmps.py Python script. 

To obtain free energy profiles, use jupyter notebooks and pressure data files.

Basic files for RASPA runs are in the RASPA_files folder, these can be used as a structure for calculating isotherms using RASPA.
