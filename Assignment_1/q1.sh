#!/bin/bash

clear

if test "$1" = ""
    then
        echo "Error! Input file not supplied!"
        exit
fi

filename=$1

while IFS= read -r line; do
{
   name="$line"

   length=${#name}
   ((length=length-4))

   str1=`echo ${name:0:4}`
   echo -n $str1 >> "q1_output.txt"

   for ((i=0;i<$length;i++))
   do
   {
       echo -n '#' >> "q1_output.txt"
   }
   done
   echo
}
done < "$filename"