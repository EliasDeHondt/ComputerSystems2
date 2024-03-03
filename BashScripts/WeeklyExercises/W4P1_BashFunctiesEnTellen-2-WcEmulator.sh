#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Script maken dat het aantal lijnen telt
som=0
iteratie=1


# Check if $1 is a file
if [ ! -f "$1" ]; then
  echo "Geef een file op als argument!"
  exit 1
fi

IFS=$'\n'

for lijn in `cat $1`; do
  som=$(($som+$iteratie))
done

echo "$som $1"