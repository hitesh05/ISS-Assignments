#!/bin/bash

#counting number of files in a directory:
#tree | awk '{ print $3 }' | tail -n 1

#printing all directories and subdir:
#ls -lR | grep '^[d*]' | awk '{ print $9 }'

#listing all files in a directory based on size:
ls -lRS | grep '^[^d*]' | awk '{ print $9 " " $7 }' | sort -k 2nr
