#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Zoeken naar bepaalde woorden in syslog en deze weergeven
file="/var/log/syslog"
filetemp="temp.txt"


IFS=$'\n'

for lijn in `cat $file`; do
 temp1=$(echo "$lijn" | grep -E -o "[^ ]{1,}\[[0-9]{4}\]" | grep -E -o "[Aa-Zz\-]+")
 temp2=$(echo "$lijn" | grep -E -o ": .{1,}" | grep -E -o "\s.{1,}")
 resultaat="$temp1 $temp2"
 echo "$resultaat" >> "$filetemp"
done

if [ -s "$filetemp" ]; then
 cat "$filetemp"
 rm "$filetemp"
else
 echo "Geen overeenkomsten gevonden."
fi