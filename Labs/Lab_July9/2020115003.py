import json
from wordcloud import WordCloud, STOPWORDS
import matplotlib.pyplot as plt
import pandas as pd
 

class RestaurantReviews:
    data=[]
    def __init__(self):
        self.data = json.loads(open("hyderabad_restaurant_reviews.json").read())
        self.printline(0)
        #print(type(self.data))

    def printline(self, num):
        if(num == 0):
            print("JSON has been loaded.")
        elif(num == 1):
            print("All reviews have been stored.")
        elif(num == 2):
            print("Bar plot has been generated.")
        elif(num == 3):
            print("Word cloud has been generated.")

    def avg_rating(self, name):
        total = 0
        count = 0
        flag = 0

        for i in self.data:
            if(i['name'] == name):
                flag = 1
                for t in i['reviews']:
                    total = total + t['rating']
                    count = count + 1
                break

        if(flag == 1):
            avg = total/count
            print("Rating: ",avg)
        else:
            print("Restaurant not found.")

    def reviews_to_file(self):
        f = open("all_reviews.txt", "w")
        for i in self.data:
            for t in i['reviews']:
                f.write((t['text']) + "\n")
                #f.write(str(t['rating']) + '\n')
        self.printline(1)
        f.close()

    def plot_bargraph(self,name):
        dicts = {}
        for dict in self.data:
            if(dict["name"] == name):
                for subdict in dict["reviews"]:
                    dicts.setdefault(subdict['rating'],0)
                    dicts[subdict['rating']] += 1
        ratings = dicts.keys()
        frequency = dicts.values()
        plt.bar(ratings,frequency)
        plt.xlabel("Ratings")
        plt.ylabel("Frequency")
        plt.savefig("plot.png")
        self.printline(2)

    def create_wordcloud(self):
        comment_words = ''
        stopwords = set(STOPWORDS)
        for val in self.data:
            for d in val["reviews"]:
                a=str(d["text"])
                
                tokens=a.split()
                for i in range(len(tokens)):
                    tokens[i]=tokens[i].lower()
                comment_words += " ".join(tokens)+" "
 
        wordcloud = WordCloud(width = 800, height = 800, background_color ='white', stopwords = stopwords,min_font_size = 10).generate(comment_words)
 
        # plot the WordCloud image                      
        plt.figure(figsize = (8, 8), facecolor = None)
        plt.imshow(wordcloud)
        plt.axis("off")
        plt.tight_layout(pad = 0)
 
        plt.savefig("cloud.png")


restaurants = RestaurantReviews()

while(1):
    command = input()
    command = command.split()
    if command[0]=="1":
        name = command[1]
        #print(name)
        restaurants.avg_rating(name)

    elif command[0] == "2":
        restaurants.reviews_to_file()

    elif command[0] == "3":
        name = command[1]
        #print(name)
        restaurants.plot_bargraph(name)

    elif command[0] == "4":
        #call word cloud
        restaurants.create_wordcloud()
        restaurants.printline(3)

    elif command[0] == "5":
        break


