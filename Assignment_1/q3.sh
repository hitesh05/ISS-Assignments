#!/bin/bash

clear

file=$1

#cat $file

#words=$(wc -w < $file)

grep -owi '\bs[^a]\w*\b' $file
echo

grep -owi '\bwh\w*\b' $file
echo

grep -owi '\bth\w*\b' $file
echo

grep -owi '\ba[^n][a-zA-z]*\b' $file