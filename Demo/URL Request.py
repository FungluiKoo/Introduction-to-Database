#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 12 14:16:00 2019

@author: deena
"""
# Editing data by reading directly from the web
import urllib.request
def nasa_data2():
    url = 'http://i6.cims.nyu.edu/~de32/dbw_class/nasa.txt'
    lines_read,lines_written=0,0 
    try:
        response=urllib.request.urlopen(url)
    except Exception as e:
        print("Error - your online resource is not currently accessible." )
        print(e)
    else:  # the web page is accessible
        data=response.read().decode('utf-8')
        #print(data)
        # Next, open the target file
        target_file = 'nasa_out2.txt'
        try:
            out_file = open(target_file,'w')
        except:
            print("Target file could not be opened.")
        else:
            dataset = data.split("\n")
            for line in dataset:
                out_file.write(line+"\n")
                lines_written +=1
            out_file.close()
            print("Lines written: ",lines_written)
    
nasa_data2()
