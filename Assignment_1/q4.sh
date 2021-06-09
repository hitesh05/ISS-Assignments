#!/bin/bash

clear

filename="stopwords.txt"

#deleting noise words:
while IFS= read -r line; do
{
   name="$line"
   sed -i "s/\b$name\b//gI" input.txt
}
done < "$filename"

while IFS= read -r line; do
{
   name="$line"
   
   length=`echo $name | wc -w`

   occurences=`echo $name | grep -ow $1 | wc -w`

   ans=`echo "($occurences/$length)" | bc -l`

   echo -n $name >> Output.txt
   echo -n "," >> Output.txt
   echo $ans >> Output.txt
}
done < "input.txt"