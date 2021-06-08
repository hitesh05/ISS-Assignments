#!/bin/bash

clear

#sed -e "$(sed 's:.*:s/&//ig:' stopwords.txt)" input.txt > out.txt
#grep -ioFwvf stopwords.txt input.txt > out.txt
#cat out.txt > input.txt
#cat input.txt
#rm -rf out.txt

# for username in $(<"stopwords.txt")
# do
# {
#    sed -i '/\b$username\b/d' input.txt
# }
# done

filename="stopwords.txt"
# while read -r line; do
# {
#     #name=$line
#     sed -i '/\b$line\b/d' input.txt
# }
# done < "$filename"

# cat input.txt

while IFS= read -r line; do
{
   name="$line"
   sed -i "/\b$name\b/d" input.txt
}
done < "$filename"


words=$(wc -w < input.txt)

lines=$(wc -l < input.txt)
((lines=lines+1))

d=`echo "($words/$lines)" | bc -l`

#echo $d

freq=`grep -o $1 input.txt | wc -l`
#echo $freq

ans=`echo "($freq/$d)" | bc -l`
#echo $ans

echo "sentence_withnostopwords," $ans > Output.txt