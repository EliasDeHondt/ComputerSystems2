#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
file="/etc/passwd"

IFS=$'\n'

for lijn in `cat $file`; do

 gebruikers_id=$(echo $lijn | cut -d: -f3)
 gebruikers_naam=$(echo $lijn | cut -d: -f5)

 if [ $gebruikers_id -ge 1000 ] 2> /dev/null; then
  # echo $gebruikers_id
  echo $gebruikers_naam
 fi

done