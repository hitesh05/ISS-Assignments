# Q1
s=["hyderabad", "mumbai", "bengal"]
mydict = [(key, len(key)) for key in s]
print(mydict)


# Q2
l1=[1,2,3]
l2=[4,5,6]
l = [i*j for i in l1 for j in l2]
print(l)



# Q3
ans = list({i for i in range(50) for j in range(5,7) if i%j==0})
print(ans)



# Q4
l1=[5, 10, 15]
l2=[-5, -10, -15]

l = [i+j for (i,j) in zip(l1,l2)]
print(l)

