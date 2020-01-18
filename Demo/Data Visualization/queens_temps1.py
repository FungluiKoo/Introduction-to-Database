#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  3 14:45:34 2019
1. import matplotlib 
2. try / open the data file 
3. identify each year and the values
   and place into a dictionary
4. prompt the user for a year 1964-2004
5. If the data are n/a, tell the user; prompt again.
6. Otherwise graph the monthly temperatures 
"""
import matplotlib.pyplot as plt
def visualize(y,t):
    plt.clf()
    months="Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
    plt.title("Temperatures in Queens in "+y)
    n = list(range(1,13))
    m = months.split()
    plt.xticks(n,m)
    plt.ylabel("Temperatures in Celsius")
    plt.xlabel("Months")
    #plt.plot(n,t,color="green",marker='^',label=y)
    plt.bar(n,t,color="green",label=y)
    plt.legend(loc="upper right")
    plt.show()

def visualize_two(y1,t1,y2,t2):
    plt.clf()
    months="Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
    plt.title("Temperatures in Queens in "+y1+" and "+y2)
    n = list(range(1,13))
    m = months.split()
    plt.xticks(n,m)
    plt.ylabel("Temperatures in Celsius")
    plt.xlabel("Months")
    plt.plot(n,t1,color="green",marker='^',label=y1)
    plt.plot(n,t2,color='blue',marker='o',label=y2)
    plt.legend(loc="upper right")
    plt.show()

file_name = 'weather_Queens.txt'
temperatures = {}
try:
    file_in = open(file_name,'r') 
except:
    print("File not found.")
else:
    print("File opened successfully.")
    contents = file_in.read().split("\n")
    #print(contents)
    for r in contents:
        if '999.9' not in r and r[:3].isdigit():
            values = r.split()
            key = values[0]
            temps = values[1:13]            
            for i in range(len(temps)):
                temps[i]=float(temps[i])
            temperatures[key] = temps
    #print(temperatures)
    print("Data are available for 1964-65, 1975-77,1981-1995, and other years." )
    user_year = input("Enter the year you wish to graph or QUIT to exit. ")
    while user_year.upper() !='QUIT' and user_year not in temperatures:
        print("Enter a year for which data are available.")
        print("For example,1964-65, 1975-77,1981-1995, etc." )
        user_year = input("Enter the year you wish to graph or QUIT to exit. ")
        
    if user_year.upper() == 'QUIT':
        print("Good-bye!")
    else:
        print("Data are available for 1964-65, 1975-77,1981-1995, and other years." )
        user_year2 = input("Enter the other year you wish to graph or blank for one line on the graph. ")
        while len(user_year2)>0 and user_year2 not in temperatures:
            print("Enter a year for which data are available.")
            print("For example,1964-65, 1975-77,1981-1995, etc." )
            user_year2 = input("Enter the year you wish to graph or QUIT to exit. ")
 
        
        print("Preparing the graph!")
        # call the function to run a bar chart for one year
        # or a line chart for two years.
        if len(user_year2) == 0:
            visualize(user_year,temperatures[user_year])
        else:
            visualize_two(user_year,temperatures[user_year],user_year2,temperatures[user_year2])
        file_in.close()
        
        
    
    
    