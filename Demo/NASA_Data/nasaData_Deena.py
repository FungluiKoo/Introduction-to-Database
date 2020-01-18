#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep  5 14:32:20 2019
@author: deena
"""
# Scrubbing a data file - class exercise
# Source: https://data.giss.nasa.gov/gistemp/tabledata_v3/SH.Ts+dSST.txt
# Problems:
# 1. replace asterisks with a blank for missing values
# 2. remove the heading
# 3. eliminate the last column ("Year")
# 4. remove columns with averages
# 5. remove the multiple occurences of the header row
# 6. remove the blank lines
# 7. remove comments at the bottom

# Scrubbing the data file: programming steps:
# 1. set up a "try" block
# 2. open the source file in read mode
# 3. if step # 2 succeeds ... open up the output file
#     in write mode (
#    else exit the program
# 4. read the data in the source file .... line by line 
# 5.    - The header row should appear once.
# 6.    - check to see if the first 4 characters are integers
# 7.    - keep only 13 columns
# 8.    - check for asterisks
# 9. write each row to the target file
# 10. output file should be .csv
# 11. close both files

def file_cleanup():
    source_file = 'nasa.txt' # This file contains our original data before any changes.
    try:
        data_in = open(source_file,'r')
    except FileNotFoundError:
        print("File not found or could not be opened.")
    else:
        # file opened like a charm!!
        target_file = 'nasa_out.csv' # This file will contain our "scrubbed" data.
        data_out    = open(target_file,'w')
        lines_read,lines_printed = 0,0 # Keep count of the lines that we print to give the user a message at the end.
        printed_flag = False
        for line in data_in: # We are using a 'for' loop to read the data, one line at a time.
            lines_read +=1
            if line[:4].isnumeric() or (line[:4]=='Year' and printed_flag==False):
                if line[:4]=="Year":
                    printed_flag = True
                values=line.split()
                #print(values)
                values=values[0:13]
                for v in range(len(values)):
                    if "*" in values[v]:
                        values[v]=''
                output_line = ",".join(values)
                data_out.write(output_line+"\n")
                lines_printed+=1 # Counting the lines that are printed.
        # Be sure to close both files now that we are done:
        data_in.close()
        data_out.close()
        print("Lines read:   ",lines_read)
        print("Lines printed:",lines_printed)
file_cleanup()