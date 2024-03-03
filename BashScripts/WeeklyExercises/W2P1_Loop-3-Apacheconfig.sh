#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
adir="/etc/apache2"
confs="$adir/apache2.conf $adir/ports.conf"


# Controleer of het eerste argument is ingevoerd
if [ -z "$1" ]; then
 echo "Geen argument ingevoerd"
 exit 1
fi

for conf_file in $confs; do
 if [ -e "$conf_file" ]; then
  grep -iHn "$1" "$conf_file"
 else
  echo "$conf_file bestaat niet"
  exit 1
 fi
done