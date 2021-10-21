#!/bin/bash

clear

find . -type d | while read -r dir
do 
    printf "%s:\t" "$dir" >> temp.txt; 
    find "$dir" -type f | wc -l >> temp.txt; 
done

#awk '{print $(NF)}' temp.txt | sort -nr

echo "DIRECTORIES: "
awk '{ print $NF,$0 }' temp.txt | sort -k1,1 -nr | cut -f2- -d' '
#awk '{print $(NF)}' temp.txt | sort -k 2nr

#cat temp.txt | awk '{FS="\\" ; $0=$0 ; print $NF"|"$0}' | sort -n | cut -d"|" -f2

#cat temp.txt

rm -rf temp.txt


#list all directories and subdirectories:
#find /path/ -type d -print

#counting number of files in a directory:
#tree | awk '{ print $3 }' | tail -n 1

#printing all directories and subdir:
#ls -lR | grep '^[d*]' | awk '{ print $9 }'

echo
echo "FILES: "
#listing all files in a directory based on size:
ls -lRS | grep '^[^d*]' | awk '{ print $9 " " $7 }' | sort -k 2nr
