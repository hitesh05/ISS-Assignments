import json 
import pandas as pd

# loading the rules json files as a dictionary named data:
with open("rules.json") as file:
    data = json.load(file)

#print(data)

# Reading the data.csv file using pandas and converting into a dataframe
df = pd.read_csv("data.csv")
# print(df)

# creating empty results tag, we will append the results for each email as we iterate in the dataframe
results = []

# iterating over the dataframe:
for ind in df.index:
    # storing the different values in variables:
    profession = df['profession'][ind]
    travel = df['travel'][ind]
    symptomatic = df['symptomatic'][ind]

    # iterating over the dictionary created from rules json:
    for i in data:
        # matching the dataframe with rules given in dictionary:
        if i['fields']['profession'] == profession:
            if i['fields']['travel'] == travel:
                if i['fields']['symptomatic'] == symptomatic:
                    # if all rules match, we append the result to our list and break out of the loop:
                    results.append(i['results'])
                    break

# adding the results tag to the dataframe:
df['results'] = results
#print(df)

# writing the dataframe into results.csv:
df.to_csv('results.csv', index=False)   
    