#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie:
reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}


# Start van het script



echo -e "Dit is het script van ${blauw}De Hondt Elias${reset}."