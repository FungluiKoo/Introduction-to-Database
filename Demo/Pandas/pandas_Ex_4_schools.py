# -*- coding: utf-8 -*-
"""
Spyder Editor

"""
import pandas as pd
import numpy  as np

def pandas4():
    #read a CSV file into a DataFrame structure
    # In this example, we read the complete file (10,892 rows)
    # and run some statistics on the data.
    # How does this compare to an SQL environment?
    # Which do you prefer and why?
    df = pd.read_csv('sd.txt', sep="\t",skiprows=None, encoding = 'utf8') 
    
    # How many rows and columns are there?
    num_rows = df.shape[0]
    num_cols = df.shape[1]
    print("number of rows   ",num_rows)
    print("number of columns",num_cols)
    print()
    
# What are the 5 school districts with the highest and lowest populations?
    sort_by_pop = df.sort_values('sd_pop_2010',ascending=False) 
    print("The five school districts with the highest populations:")
    print(sort_by_pop[["sd_state","sd_name","sd_hu_2010"]].head(5))
    print()
    print("The five school districts with the lowest populations:")
    print(sort_by_pop[["sd_state","sd_name","sd_hu_2010"]].tail(5))
    print()
    
# What are the total populations by state? 
    print("Total populations by state: ")
    states = df.groupby(['sd_state'])[["sd_pop_2010"]].sum()
    print(states)
    print()

## What are the total populations and housing units by state? 
    print("Total populations and housing units by state")
    states = df.groupby(['sd_state'])[["sd_pop_2010","sd_hu_2010"]].sum()
    print(states)
    print()
    
## What is the total and average population per state
    print("Total and average population per state")
    states2 = df.groupby(['sd_state']).agg({"sd_pop_2010":[np.sum,np.mean]})
    print(states2)
    print()

## What is the total housing units and number of districts per state?
    print("Total housing units and number of districts per state")
    states3 = df.groupby(['sd_state']).agg({"sd_pop_2010":np.sum,"sd_name":np.count_nonzero})
    print(states3)
    print()
    
## What were the total populations and housing units in 2010? 
    print("\nTotal population:    ",df["sd_pop_2010"].sum())
    print(  "Total housing units: ",df["sd_hu_2010"].sum())
    print(  "Total districts:     ",df["sd_name"].count())
    print()

pandas4()

