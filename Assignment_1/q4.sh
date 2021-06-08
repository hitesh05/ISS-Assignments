#!/bin/bash

clear

filename="stopwords.txt"

while IFS= read -r line; do
{
   name="$line"
   sed -i "s/\b$name\b//gI" input.txt
}
done < "$filename"


words=$(wc -w < input.txt)
echo $words

lines=$(wc -l < input.txt)
#((lines=lines+1))
echo $lines

d=`echo "($words/$lines)" | bc -l`

echo $d

freq=`grep -o $1 input.txt | wc -l`
echo $freq

ans=`echo "($freq/$d)" | bc -l`
echo $ans

echo "sentence_withnostopwords," $ans > Output.txt