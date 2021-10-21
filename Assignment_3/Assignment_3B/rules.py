import json 
import pandas as pd

# parsing the json file and storing in a dictionary:
with open("rules.json") as file:
    data = json.load(file)


# Reading the data.csv file using pandas and converting into a dataframe
df = pd.read_csv("data.csv")

# creating empty results tag, we will append the results for each email as we iterate in the dataframe
results = []

# flag to check whether staus is active or not (0 if inactive, 1 if active):
flag = 0

# iterating over the dataframe:
for ind in df.index:
    flag = 0
    # reading the dataframe row-wise and storing the different values in variables:
    profession = df['profession'][ind]
    travel = df['travel'][ind]
    symptomatic = df['symptomatic'][ind]
    chronic = df['chronic'][ind]
    
    # iterating over the dictionary created from rules json:
    for i in data:
        # matching the dataframe with rules given in dictionary:
        if i['fields']['profession'] == profession:
            if i['fields']['travel'] == travel:
                if i['fields']['symptomatic'] == symptomatic:
                    if i['fields']['chronic'] == chronic:
                        # appending the rule only if status is active:
                        if i['status'] == 'Active':
                            flag = 1
                            results.append(i['results'])
                            break
                            # if all rules match, and status is Active, we append the result to our list and break out of the loop:
    
    # if status is In Active or rule not found in JSON file
    if flag == 0:
        results.append('No Access')    

# writing results tag in an intermediate file:
textfile = open("intermediate.txt", "w")
textfile.write("results" + "\n")
for element in results:
    textfile.write(element + "\n")
textfile.close()

