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
    dirname=${dir##*/}
    printf "%s " "$dirname," >> temp.txt; 
    data=$(find "$dir" -type f | wc -l); 
    #data+=" file(s)"
    echo $data >> temp.txt
done

echo
echo "Directories: "
(awk '{ print $NF,$0 }' temp.txt | sort -k1,1 -nr | cut -f2- -d' ')

rm -rf temp.txt
#rm -rf temp2.txt

echo
echo "Files: "
# #listing all files in a directory based on size:
# #ls -lRS | grep '^[^d*]' | awk '{ print $9 }' | sort -k 2nr
find . -type f -printf "%s %f\n" | sort -rn | awk '{print $2}'


cd $y
