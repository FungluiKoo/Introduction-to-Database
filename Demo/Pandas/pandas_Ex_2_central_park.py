# -*- coding: utf-8 -*-
"""
Spyder Editor

"""
import pandas as pd
def pandas2():
    #read a CSV file into a DataFrame structure
    # This file contains missing values designated by an imaginary
    # temperature of 999.9. We used pandas to account for these during
    # the data import.
    df = pd.read_csv('Central_Park_temperatures_out.csv',sep=",",na_values="999.9",skiprows=None,encoding = 'utf8') 
    
    # How many rows and columns are there?
    num_rows = df.shape[0]
    num_cols = df.shape[1]
    print("number of rows   ",num_rows)
    print("number of columns",num_cols,"\n")
    
    print("\nFirst three rows:")
    print(df.head(3))
    print("\nLast three rows: ")
    print(df.tail(3))
    
    print("\nPrint only selected columns:" )
    # to get one series:    
    print(df[["YEAR","JAN","FEB","MAR"]].tail(3))

    print("\nMonthly mean:")
    print(df.mean())
    print("\nMonthly mean for selected columns in order to omit the year:")
    print(df[["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]].mean())

    print("\nAfter dropping rows with n/a values: ")
    print("Monthly mean:")
    print(df[["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"]].dropna().mean())

    df.to_csv('out1.csv')
    df.to_html('out2.html')
    df.to_json('out3.json')
    
pandas2()

