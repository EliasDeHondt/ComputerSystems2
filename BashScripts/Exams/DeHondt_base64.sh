#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie:
# Arguments:
# Auteur: elias.dehondt@outlook.com
# Copyright: 2014 GNU v3 elias.dehondt@outlook.com
# Versie: 0.1
# Requires: Standaard shell find commando
reset=$'\e[0m'
blauw=$'\e[0;34m'
l="----"
string="$1"
le_string="${#string}"
j=1


# Start van het script
echo -e "Dit is het script van ${blauw}De Hondt Elias${reset}."

for ((i = 0; i < $le_string; i++)); do
  echo "${string:$i:$j}"
  (( j+=1 ))
done


echo "Binair: "
echo "Splitsen in $le_string stukken:"

echo "$l"
echo "BIN: "
echo "DEC: "
echo "CHAR: "