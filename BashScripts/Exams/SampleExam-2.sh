#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: En script dat een file opent met daarin een lijst van namen en urls. 
# Het script moet de namen en urls uit de file halen en in een nieuwe file plaatsen.
reset='\e[0m'
rood='\e[0;31m'
filetemp="temp.txt"
l="--------------------------------------------------------"


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  error_exit "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
fi

if [ ! -f "$1" ]; then
  error_exit "Argument 1 is geen file"
fi

IFS=$'\n'

for lijn in `cat "$1"`; do
  urlRx=$(echo "$lijn" | grep -E -o "(http|https)://[A-Za-z0-9.]+")
  nameRx=$(echo "$lijn" | grep -E -o ">[A-Z].+</a>" | grep -E -o "[A-Z].+[a-z]<" | grep -E -o "[A-Z].+[a-z]")
  if [ -n "$nameRx" ] && [ -n "$urlRx" ]; then
    resultaat="$nameRx = $urlRx"
    echo "$resultaat" >> "$filetemp"
  fi
done

echo "$l"
cat $filetemp
echo "$l"
rm $filetemp