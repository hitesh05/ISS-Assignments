#!/bin/bash

clear

case "$1" in
-insert)
    shift
    while getopts 'f:l:n:o:' flag; do
    {
        case "${flag}" in
            f) first=${OPTARG} ;;
            l) last=${OPTARG} ;;
            n) number=${OPTARG} ;;
            o) company=${OPTARG} ;;
        esac
    }
    done

    echo -e "$first\t""$last\t""$number\t""$company" >> "contacts.csv"
    ;;

-edit)
    shift
    while getopts 'k:f:l:n:o:' flag; do
    {
        case "${flag}" in
            k) modified=${OPTARG} ;;
            f) first=${OPTARG} ;;
            l) last=${OPTARG} ;;
            n) number=${OPTARG} ;;
            o) company=${OPTARG} ;;
        esac
    }
    done

    awk '{print $1}' contacts.csv | sed -i "/\b$modified\b/d" contacts.csv
    echo -e "$first\t""$last\t""$number\t""$company" >> "contacts.csv"
    ;;

-display)
    shift
    case "$1" in 
        -a) sort "contacts.csv" ;;
        -d) sort -r "contacts.csv" ;;
    esac
    ;;

-search)
    shift
    while getopts 'c:v:' flag; do
    {
        case "${flag}" in
            c) column=${OPTARG} ;;
            v) value=${OPTARG} ;;
        esac
    }
    done

    data=$(awk -v col=$column -v term="$value" 'toupper($col)==toupper(term)' contacts.csv)
    echo $data
    ;;

-delete)
    shift
    while getopts 'c:v:' flag; do
    {
        case "${flag}" in
            c) column=${OPTARG} ;;
            v) value=${OPTARG} ;;
        esac
    }
    done

    data=$(awk -v col=$column -v term="$value" 'toupper($col)==toupper(term)' contacts.csv)
    #echo $data
    #sed -i "s/$data//g" contacts.csv
    grep -v "$data" contacts.csv > temp.csv; mv temp.csv contacts.csv
    ;;    

esac