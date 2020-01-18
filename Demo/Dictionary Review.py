#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 16 14:39:26 2019

@author: deena
"""

# CSCI-UA.60-1 Dictionary Review
# Note: This program is not complete because the header row
# now appears at the bottom of the output file.
# How would you fix that if this were your project?
def dictionary_review():
    source_file = 'weather_Queens.txt'
    lines_written = 0
    try:
        file_in = open(source_file,'r')
    except:
        print("File not found or could not be opened.")
    else:
        target_file = 'weather_Queens_out.csv'
        file_out    = open(target_file,'w')
        d = {} # create a dictionary in which the year is key
               # and the value is a list containting the temperatures 
        for line in file_in:
            v=line.split()
            year = v[0]
            temperatures = v[1:13]
            d[year]=temperatures
        keys =list(d.keys())
        keys.sort()
        # In class we discussed another option which would be to 
        # find the lowest year and the highest year and then 
        # iterate through the dictionary one year at a time
        # without the need for a list to do so.
        for k in keys:
            file_out.write(k+","+",".join(d[k])+"\n")
            lines_written+=1
        file_in.close()
        file_out.close()
        print("Lines written: "+str(lines_written))
dictionary_review()
