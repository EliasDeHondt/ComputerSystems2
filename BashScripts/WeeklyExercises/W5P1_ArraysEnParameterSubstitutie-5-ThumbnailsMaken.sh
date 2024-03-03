#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Omzetten van jpg bestanden naar thumbnail png bestanden
reset='\e[0m'
rood='\e[0;31m'
groen='\e[0;32m'


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function maak_thumbnail() {
  originele_bestand="$1"
  bestandsnaam_zonder_extensie="${originele_bestand%.*}"
  thumbnail_naam="thumbnail_${bestandsnaam_zonder_extensie}.png"
  convert -thumbnail 50x50 -extent 50x50 -gravity center "$originele_bestand" "$thumbnail_naam"

  exit_code=$?
  if [ $exit_code -eq 0 ]; then
    echo -e "Bestand $originele_bestand omgezet naar $thumbnail_naam ${groen}(Succes)${reset}"
  else
    echo -e "Fout bij het omzetten van $originele_bestand naar $thumbnail_naam ${rood}(Fout)${reset}"
  fi
}

# Controleer of het eerste argument is ingevoerd
if [ -z "$1" ]; then
 error_exit "Argument 1 is niet opgegeven"
fi

# Check if $1 is a directory
if [ ! -d "$1" ]; then
  error_exit "Argument 1 is geen directory"
fi

cd "$1" || exit_error "Kan niet naar de opgegeven directory gaan"

# Loop door alle bestandsnamen in de directory met .jpg of .JPG
for bestandsnaam in *.jpg *.JPG; do
  if [ -f "$bestandsnaam" ]; then
    maak_thumbnail "$bestandsnaam"
  fi
done