#!/bin/bash

clear

if test "$1" = ""
    then
        echo "Error! Input file not supplied!"
        exit
fi

file=$1

grep -ow '\bs[^a]\w*\b' $file
echo

grep -ow '\bwh\w*\b' $file
echo

grep -ow '\bth\w*\b' $file
echo

grep -ow '\ba[^n][a-zA-z]*\b' $file
