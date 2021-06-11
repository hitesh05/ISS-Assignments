#!/bin/bash

clear

y=$PWD

if test "$1" = ""
then
    x=$PWD
else
    x=$1
fi

cd $x

find . -type d | while read -r dir
do 
    printf "%s:\t" "$dir" >> temp.txt; 
    find "$dir" -type f | wc -l >> temp.txt; 
done

echo
echo "DIRECTORIES: "
awk '{ print $NF,$0 }' temp.txt | sort -k1,1 -nr | cut -f2- -d' '

rm -rf temp.txt

echo
echo "FILES: "
#listing all files in a directory based on size:
ls -lRS | grep '^[^d*]' | awk '{ print $9 " " $7 }' | sort -k 2nr

cd $y
