#!/bin/bash

clear

words=`cat contacts.csv | wc -w`

if test $words = 0
then
    echo "fname, ""lname, ""mobile, ""Office, " >> contacts.csv
fi

case "$2" in
insert)
    shift
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

    echo -e "$first"", ""$last"", ""$number"", ""$company" >> "contacts.csv"
    ;;

edit)
    shift
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

    modified+=","
    #awk '{print $1}' contacts.csv | sed -i "/\b$modified\b/d" contacts.csv
    data=$(awk -v term="$modified" 'toupper($1)==toupper(term)' contacts.csv)
    grep -v "$data" contacts.csv > temp.csv; mv temp.csv contacts.csv
    echo -e "$first"", ""$last"", ""$number"", ""$company" >> "contacts.csv"
    ;;

display)
    shift
    shift
    case "$1" in 
        -a) sort "contacts.csv" ;;
        -d) sort -r "contacts.csv" ;;
    esac
    ;;

search)
    shift
    shift

    while getopts 'c:v:' flag; do
    {
        case "${flag}" in
            c) input=${OPTARG} 
            if test $input = "fname";
            then
                column=1
            fi

            if test $input = "lname";
            then
                column=2
            fi

            if test $input = "mobile";
            then
                column=4

            fi
            ;;
            v) value=${OPTARG} ;;
        esac
    }
    done

   value+=","

    data=$(awk -v col=$column -v term="$value" 'toupper($col)==toupper(term)' contacts.csv)
    echo $data
    ;;

delete)
    shift
    shift
    while getopts 'c:v:' flag; do
    {
        case "${flag}" in
            c) input=${OPTARG} 
            if test $input = "fname";
            then
                column=1
            fi

            if test $input = "lname";
            then
                column=2
            fi

            if test $input = "mobile";
            then
                column=4

            fi
            ;;
            v) value=${OPTARG} ;;
        esac
    }
    done

    value+=","

    data=$(awk -v col=$column -v term="$value" 'toupper($col)==toupper(term)' contacts.csv)
    grep -v "$data" contacts.csv > temp.csv; mv temp.csv contacts.csv
    ;; 

*)
    echo Error! Flag not recognised!
    exit 0
    ;;

esac