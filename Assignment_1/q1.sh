#!/bin/bash

clear

filename=$1

while IFS= read -r line; do
{
   name="$line"

   length=${#name}
  # echo $length
   ((length=length-4))
   #echo $length

   str1=`echo ${name:0:4}`
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