#!/bin/bash

clear

if test "$1" = ""
    then
        echo "Error! Input file not supplied!"
        exit
fi

declare -r filename=$1

name=`cat $1 | awk '{$NF=""; print $0}'`
#echo $name

dob=`cat $1 | awk '{print $NF}'`
# echo $dob

d=`echo $dob | cut -c1-2`
m=`echo $dob | cut -c4-5`
y=`echo $dob | cut -c7-10`

yy=`date "+%Y"`
mm=`date "+%m"`
dd=`date "+%d"`

if [ $y -le $yy ]
then
yyy=`expr $yy - $y`
if [ $m -gt $mm ]
then
yyy=`expr $yyy - 1`
fi
fi
#echo "Your age : $yyy years"

touch "$name"$yyy".txt"

echo "$name"$yyy > "$name"$yyy".txt"
# echo -n $yyy >> $name" "$yyy".txt"

