#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 12 14:57:34 2019

@author: deena
"""
# pandas - opening the books table
import pandas as pd
def pandas1():
    file_name = "books.csv"
    df=pd.read_csv(file_name,sep=',',encoding='utf-8') 
    # What is the shape of the file?
    num_rows = df.shape[0]
    num_cols = df.shape[1]
    print("Number of rows:    "+str(num_rows))
    print("Number of columns: "+str(num_cols)) 

    print("\ndf.describe()")
    print(df.describe())

    print("\ndf.info()")
    print(df.info())
    
    print("\nTitles:")
    print(df["title"])
    print()
    print(df[["title","author"]])
    print(df[["author","title"]])
    print(df[["author","title","price"]])
    
    print("\nSorting the data:")
    sort_by_price_asc =df.sort_values("price")
    print(sort_by_price_asc[["title","price"]])
    print("\nThe three cheapest books:")
    print(sort_by_price_asc[["title","price"]].head(3))
    print("\nThe three most expensive books:")
    print(sort_by_price_asc[["title","price"]].tail(3))   
    
    print("\nSorting the data in descending order:")
    sort_by_price_desc = df.sort_values("price",ascending=False)    
    print(sort_by_price_desc[["title","price"]])
    
    print("SELECTIONS:")
    print("The title, author and price for books that cost over $15.")
    selection1 = df.loc[(df["price"]>15)]
    print(selection1[["title","author","price"]])
    print()
    print("The title author and price for books that cost over $15 or under $10 using 'OR'")
    selection2 = df.loc[(df["price"]>15) | (df["price"]<10)]
    print(selection2[["title","author","price"]])
    print()
    print("The title, author and price for books in the range of $10-$20 using 'AND'.")
    selection3 = df.loc[(df["price"]>10) & (df["price"]<20)]
    print(selection3[["title","author","price"]])
    print()
    print(" ... and here we sorted our results before printing.")
    selection3_sorted=df.loc[(df["price"]>10) & (df["price"]<20)].sort_values("price") 
    print(selection3_sorted[["title","price"]])
   
pandas1()