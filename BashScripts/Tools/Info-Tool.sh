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