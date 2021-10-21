#!/bin/bash

#sed -e "$(sed 's:.*:s/&//ig:' stopwords.txt)" input.txt > out.txt
#grep -ioFwvf stopwords.txt input.txt > out.txt
#cat out.txt > input.txt
#cat input.txt
#rm -rf out.txt

# for username in $(<"stopwords.txt")
# do
# {
#    sed -i '/\b$username\b/d' input.txt
# }
# done

# while read -r line; do
# {
#     #name=$line
#     sed -i '/\b$line\b/d' input.txt
# }
# done < "$filename"

# cat input.txt