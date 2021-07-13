import csv

data = [
    {
        'email' : 'hitesh.goel@research.iiit.ac.in' ,
        'profession' : 'Healthcare',
        'travel' : 'No',
        'symptomatic' : 'No',
        # 'chronic' : 'No'
    },
    {
        'email' : 'goel_naveen@rediffmail.com' ,
        'profession' : 'IT',
        'travel' : 'Yes',
        'symptomatic' : 'No',
        # 'chronic' : 'No'
    }
]

fields = ['email' , 'profession' , 'travel' , 'symptomatic']
filename = "data.csv"

# writing to csv file
with open(filename, 'w') as csvfile:
    # creating a csv dict writer object
    writer = csv.DictWriter(csvfile, fieldnames = fields)
      
    # writing headers (field names)
    writer.writeheader()
      
    # writing data rows
    writer.writerows(data)