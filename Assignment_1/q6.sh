#!/bin/bash

clear

words=0

FILE="contacts.csv"
if test -f "$FILE"
then
    words=`cat contacts.csv | wc -w`
fi



if test $words = 0
then
    echo "fname, ""lname, ""mobile, ""Office " >> contacts.csv
fi
#echo >> "contacts.csv"

while getopts 'C:f:l:n:o:k:a:d:c:v:' flag; do
{
    case "${flag}" in
        C) command=${OPTARG} ;;
        f) first=${OPTARG} ;;
        l) last=${OPTARG} ;;
        n) number=${OPTARG} ;;
        o) company=${OPTARG} ;;
        k) modified=${OPTARG} ;;
        a) sort "contacts.csv"; exit 0 ;;
        d) 
        head -n 1 contacts.csv
        lines=`cat contacts.csv | wc -l`
        ((lines=lines-1))
        tail -n $lines contacts.csv | sort -r
        exit 0
        ;;
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
            column=3
        fi

        if test $input = "Office"
        then
            column=4
        fi
        ;;
        v) value=${OPTARG} ;;
    esac

}
done

#echo $command

if test "$command" = "insert"
then
{
    echo "$first"", ""$last"", ""$number"", ""$company" >> "contacts.csv"
}

elif test "$command" = "edit"
then
{
    modified+=","
    #awk '{print $1}' contacts.csv | sed -i "/\b$modified\b/d" contacts.csv
    data=$(awk -v term="$modified" 'toupper($1)==toupper(term)' contacts.csv)
    grep -v "$data" contacts.csv > temp.csv; mv temp.csv contacts.csv
    echo "$first"", ""$last"", ""$number"", ""$company" >> "contacts.csv"
}

# elif test "$command" = "display"
# then
# {
#     if test "$sort_order" = "ascending"
#     then
#         sort "contacts.csv"
    
#     else
#         sort -r "contacts.csv"
#     fi
# }

elif test "$command" = "search"
then
{
    if test $column = "4"
    then 
        value=value
    else
        value+=","
    fi
    data=$(awk -v col=$column -v term="$value" 'toupper($col)==toupper(term)' contacts.csv)
    echo $data
}

else
{
    if test $column = "4"
    then 
        value=$value
    else
        value+=","
    fi

    #echo $value
    data=$(awk -v col=$column -v term="$value" 'toupper($col)==toupper(term)' contacts.csv)
    #echo $data
    grep -v "$data" contacts.csv > temp.csv; mv temp.csv contacts.csv
}

fi