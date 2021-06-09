#!/bin/bash

clear

if test "$1" = ""
    then
        echo "Error! Input file not supplied!"
        exit
fi

filename=$1

#looping through the text file line by line (1 word in each)
while IFS= read -r line; do
{
   name="$line"

   length=${#name}
   ((length=length-4)) #reducing len by 4 (first 4 letters to be displayed)

   str1=`echo ${name:0:4}` #extracting substr
   echo -n $str1

   for ((i=0;i<$length;i++))
   do
   {
       echo -n '#'
   }
   done
   echo
}
done < "$filename"