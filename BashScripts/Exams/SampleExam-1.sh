#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: En script dat een file met IP adressen inleest en het aantal IP adressen in klasse A, B en C telt.
reset='\e[0m'
rood='\e[0;31m'
cyaan='\e[0;36m'
ipA=0
ipB=0
ipC=0

function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function class_ip() {
  while IFS= read -r lijn; do
    eerste_octet=$(echo $lijn | grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | grep -E -o "^[0-9]+")

    if [ $eerste_octet -ge 0 ] && [ $eerste_octet -le 127 ]; then
      let ipA+=1
    elif [ $eerste_octet -ge 128 ] && [ $eerste_octet -le 191 ]; then
      let ipB+=1
    else
      let ipC+=1
    fi
  done < "$file"
}

if [ "$EUID" -ne 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Opstarten als root gebruiker: bv. sudo .0"
fi

if [ $# -ne 2 ]; then # Functie: Zorgen dat het script een bepaald aantal argumenten verwacht
  error_exit "Ongeldig aantal argumenten. Gebruik: $0 arg1 arg2"
fi

if [ ! -f "$2" ]; then # Functie: Controleren of een bestand bestaat
  error_exit "Bestand $2 bestaat niet"
  else
  file="$2"
fi

echo "Aantal IPs in klasse:"
class_ip

if [ "$1" = "A" ]; then
  echo -e "${cyaan}A:$ipA${reset}"
else
  echo "A:$ipA"
fi

if [ "$1" = "B" ]; then
  echo -e "${cyaan}B:$ipB${reset}"
else
  echo "B:$ipB"
fi

if [ "$1" = "C" ]; then
  echo -e "${cyaan}C:$ipC${reset}"
else
  echo "C:$ipC"
fi