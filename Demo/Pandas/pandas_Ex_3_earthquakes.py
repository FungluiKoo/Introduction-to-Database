# -*- coding: utf-8 -*-
"""
Spyder Editor

"""
import pandas as pd
def pandas3():
    df = pd.read_csv('earthquakes.csv',sep=",",na_values=0,skiprows=None,encoding = 'utf8') 
    
    # How many rows and columns are there?
    num_rows = df.shape[0]
    num_cols = df.shape[1]
    print("number of rows   ",num_rows)
    print("number of columns",num_cols,"\n")
    
    print("df.describe()")
    print(df.describe().dropna())
    print("\ndf.mean()")
    print(df.mean())
    print("\ndf.count()")
    print(df.count())
    
    print("\nFirst three rows:")
    print(df.head(3))
    print("\nLast three rows: ")
    print(df.tail(3))
    
    print("Print only selected columns:" )
    print(df[["YEAR","COUNTRY","MEASURE"]].head(3))

    sort_by_strength = df.sort_values('MEASURE',ascending=False) 
    print("The five worst earthquakes:")
    print(sort_by_strength[["YEAR","COUNTRY","MEASURE"]].head(5))
    print()

    print("The five mildest earthquakes:")
    print(sort_by_strength[["YEAR","COUNTRY","MEASURE"]].tail(5))
    print()

    print("The average earthquake in North America in this time period ")
    print(format(df["MEASURE"].mean(),'.8f')) 
    print(" ... and without zero values: ")
    t = (df["MEASURE"].sum()) 
    n = (df['MEASURE']>0).sum()    # Note that 0 is false, 1 is true so this counts values over 0
    print("Sum of the measures: "+format(t,'.1f'))
    print("Number of events without a zero value: ",n)
    print("Average excluding zero values: "+format(t/n,'.8f'))
    print()
    
    # What are the average earthquake strength by country? 
    print("Average earthquake strength and number of events by country (includes zero values): ")
    quakes = df.groupby(['COUNTRY'])[["MEASURE"]].mean()
    print(quakes)
    print()

pandas3()

