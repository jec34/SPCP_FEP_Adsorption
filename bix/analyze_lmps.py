"""
Read LAMMPS out file
"""

import sys
import pandas as pd

def main():
    out_file = sys.argv[1]
    write_file = sys.argv[2]
    #skip_list = range(4054,4090)
    skip_list = range(58,200)

    try:
        lammps_data = pd.read_csv(out_file, sep=r'\s+', header=57, engine='python', skipfooter=29, skiprows=skip_list, skip_blank_lines=False)
        #print(lammps_data.keys())

        avg_press = lammps_data[lammps_data['Step'] > 4000000]['Press'].mean()
        vol = lammps_data['Volume'].mean()

        print(avg_press, vol)

        with open(write_file, 'a') as f:
            f.write(str(avg_press))
            f.write(' ')
            f.write(str(vol))
            f.write('\n')

    except ValueError:
        print('Error Reading File')

if __name__ == '__main__':
    main()
