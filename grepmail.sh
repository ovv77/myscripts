#!/bin/bash
# Script for searching mail letters 
# with defined pattern  mail file
# by Varfolomeev Oleg 2020-07-17


# Pattern of starting letter
FROM="From"

# If input pattern match - whole letter body whill be printed
# don't forget to use '' for pattern with blank
PATTERN=$1
FILE=$2

echo 'Filename: '$FILE

awk -v PATTERN="$PATTERN" -v FROM="$FROM" 'BEGIN {
    letters=0
    }

($0~FROM){start=1; buf=""} 
start{
   if ($0~PATTERN)
        {is_match=1;start=0;buf1=buf;letters++}
   elss
       buf = buf $0 ORS
     }
is_match{
    if ($0~FROM)
        {printf "%s", buf1; is_match=0; buf1=""}
    else
        buf1 = buf1 $0 ORS
     }
END {
    print "found  " letters "  letters"
}' "$FILE" 

