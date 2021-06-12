#!/bin/bash

clear

input="$1"
filename="$2"

#rm -rf Output.txt
#cat input_2.txt > input.txt

#deleting noise words:
while IFS= read -r line; do
{
   name="$line"
   sed -i "s/\b$name\b[[:punct:]]*//g" "$input"
}
done < "$filename"

while IFS= read -r line; do
{
   name="$line"
   
   length=`echo $name | wc -w`

   occurences=`echo $name | grep -ow $3 | wc -w`

   ans=`echo "($occurences/$length)" | bc -l`

   echo -n $name >> Output.txt
   echo -n " , " >> Output.txt
   echo $ans >> Output.txt
}
done < "input.txt"