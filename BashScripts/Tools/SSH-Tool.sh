#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE:
reset='\e[0m'
rood='\e[0;31m'



function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}


read -p "Wat is de poort van de ssh server: " poort

read -p "Wat is de user name van de ssh server: " username

read -p "Wat is het ip van de ssh server: " ip