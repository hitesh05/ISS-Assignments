#!/bin/bash

clear

file=$1

#cat $file

#words=$(wc -w < $file)

grep -ow '\bs[^a]\w*\b' $file
echo

grep -ow '\bwh\w*\b' $file
echo

grep -ow '\bth\w*\b' $file
echo

grep -ow '\ba[^n][a-zA-z]*\b' $file