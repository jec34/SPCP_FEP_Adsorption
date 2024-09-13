import numpy as np
import sys
import os
import csv

def main():
    full_dir_list = os.listdir()
    dir_list = []
    data_dict = {}
    error_dict = {}

    for val in full_dir_list:
        if 'bipy_vol_47.49' in val and 'sh' not in val and '.py' not in val and 'txt' not in val:
            dir_list.append(val)

    for direc in dir_list:
        file_str = direc
        new_dir_list = os.listdir(direc)
        for new_dir in new_dir_list:
            if 'Output' in new_dir:
                file_str += '/' + new_dir
                file_str += '/' + os.listdir(file_str)[0]
                for RASPA_output in os.listdir(file_str):
                    with open(file_str + '/' + RASPA_output) as f:
                        lines = f.readlines()
                        for line in lines:
                            if 'Average loading absolute [molecules/unit cell]' in line:
                                data_dict[file_str + '/' + RASPA_output] = line.split()[5]
                                error_dict[file_str + '/' + RASPA_output] = line.split()[7]
    with open('RASPA_data.txt', 'w') as f:
        f.write('RASPA_output_file, Average_loading, Error\n')
        for key in data_dict.keys():
            f.write(key + ', ' + data_dict[key] + ', ' + error_dict[key] + '\n')

if __name__ == '__main__':
    main()
    print('Finished')
