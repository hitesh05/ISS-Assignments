import sqlite3

connection = sqlite3.connect('ipl.db')
cursor = connection.cursor()

class DBclass:
    def __init__(self, path):
        self.path = path
        self.db = sqlite3.connect(self.path)
        self.cur = self.db.cursor()

    def execute(self, query):
        self.cur.execute(query)
        return [i[0] for i in self.cur.description], self.cur.fetchall()

db = DBclass('ipl.db')

#question 1
query = '''
SELECT Umpire_Name
FROM Umpire
LIMIT 10
'''

cols1, res1 = db.execute(query)
print("Umpire names: ", end="")
for i in res1:
    print(i[0]+',', end="")
print()
print()

query = '''
SELECT DISTINCT Umpire_Country
FROM Umpire
'''

cols2, res2 = db.execute(query)
countries = 0

for i in res2: 
    countries+=1

print("The number of countries the umpires belong to are: ", countries)
print()

query = '''
SELECT Venue_Name
FROM Venue
ORDER BY Venue_Name ASC
'''

cols3, res3 = db.execute(query)
print("Venue names in alphabetical order: ", end="")
for i in res3:
    print(i[0]+',', end="")
print()
print()

query = '''
SELECT Player_Name
FROM Player
WHERE Country_Name == 5
'''

cols4, res4 = db.execute(query)
print("Australian players: ", end="")
for i in res4:
    print(i[0]+',', end="")
print()
print()

query = '''
SELECT Match_Winner
FROM  Match
WHERE Match_Winner = 2
'''

col5, res5 = db.execute(query)

rcb_wins = 0
for i in res5:
    rcb_wins+=1

query = '''
SELECT Match_Winner
FROM  Match
WHERE Match_Winner = 3
'''

col6,res6 = db.execute(query)
csk_wins= 0

for i in res6:
    csk_wins+=1

ans = csk_wins - rcb_wins

print("The number of matches CSK won more than RCB: ", ans)