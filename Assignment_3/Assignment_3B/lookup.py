import json 
import pandas as pd
import os

#reading data.csv into a dataframe
df = pd.read_csv("data.csv")

#reading intermediate file into a dataframe
df2 = pd.read_csv("intermediate.txt")
#print(df2)

#appending "results column" (df2) to df
del df['status']
df['results'] = df2
#print(df)

# writing the dataframe into results.csv:
df.to_csv('results.csv', index=False) 

#os.remove('intermediate.txt')
    