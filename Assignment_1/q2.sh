#!/bin/bash

clear

if test "$1" = ""
    then
        echo "Error! Input file not supplied!"
        exit
fi

declare -r filename=$1

#extracting name
name=`cat $1 | awk '{print $1}'`

#extracting dob
dob=`cat $1 | awk '{print $2}'`

d=`echo $dob | cut -c1-2`
m=`echo $dob | cut -c4-5`
y=`echo $dob | cut -c7-10`

yy=`date "+%Y"`
mm=`date "+%m"`
dd=`date "+%d"`

#finding age:
if [ $y -le $yy ]
then
yyy=`expr $yy - $y`
if [ $m -gt $mm ]
then
yyy=`expr $yyy - 1`
fi
fi
#echo "Your age : $yyy years"

touch $name" "$yyy".txt"

echo $name" "$yyy > $name" "$yyy".txt"

