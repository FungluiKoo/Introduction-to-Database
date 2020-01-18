#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
def pie2():
    # make a figure
    # https://matplotlib.org/3.1.1/api/_as_gen/matplotlib.pyplot.figure.html
    plt.clf() # clears the figure, leaves the window open
    plt.figure(1,figsize=(6,6))# figure number; and size in inches - height and width
    plt.axis('equal') # To make this a circle!
    
    # set up the slices
    labels = ['CS','Math','Biology','Chem','English']
    sizes = [35,18,20,14,19] # these are the data
    explode = [0,0,0,0,0.1]
    
    plt.pie(sizes, explode=explode, labels=labels,autopct='%1.1f%%')
    plt.title("Comparison of Majors")
    plt.show()

pie2()




