#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: En script dat een file opent met daarin een lijst van namen en urls.
# Het script moet de namen en urls uit de file halen en in een nieuwe file plaatsen.
reset='\e[0m'
rood='\e[0;31m'
l="--------------------------------------------------------"
IFS=$'\n'


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

if [ "$EUID" -ne 0 ]; then # Controleer of het script wordt uitgevoerd als root
  error_exit "Opstarten als root gebruiker: bv. sudo $0"
fi

if [ $# -ne 1 ]; then # Functie: Zorgen dat het script een bepaald aantal argumenten verwacht
  error_exit "Ongeldig aantal argumenten. Gebruik: $0 arg1"
fi

if [ ! -f "$1" ]; then # Functie: Controleren of een bestand bestaat
  error_exit "Bestand $1 bestaat niet"
else
  filename="$1"
fi

echo "$l"
echo "Hier zijn de gevonden links:"

while IFS= read -r lijn; do
  url=$(echo "$lijn" | grep -E -o "(http|https)://[A-Za-z0-9.]+")
  name=$(echo "$lijn" | grep -E -o ">[A-Z].+</a>" | grep -E -o "[A-Z].+[a-z]<" | grep -E -o "[A-Z].+[a-z]")
  if [ ! "$name" = "" ]; then
    name=${name//&amp;/&}
    echo "$name = $url"
    
  fi
done < "$filename"

echo "$l"

