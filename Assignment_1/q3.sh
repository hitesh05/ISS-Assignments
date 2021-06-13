#!/bin/bash

clear

if test "$1" = ""
    then
        echo "Error! Input file not supplied!"
        exit
fi

file=$1

#cat $file

#words=$(wc -w < $file)

grep -ow '\bs[^a^ ]\w*\b' $file | tr '\n' ','
echo
echo

grep -ow '\bwh\w*\b' $file | tr '\n' ','
echo
echo

grep -ow '\bth\w*\b' $file | tr '\n' ','
echo
echo

grep -ow '\ba[^n^ ]\w*\b' $file | tr '\n' ','