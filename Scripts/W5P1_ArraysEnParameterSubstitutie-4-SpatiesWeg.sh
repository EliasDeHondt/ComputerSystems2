#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Omzetten van bestandsnamen met spatie, naar bestandsnamen zonder spatie
reset='\e[0m'
rood='\e[0;31m'
groen='\e[0;32m'


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
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

# Loop door alle bestandsnamen in de directory en vervang spaties door underscores
for bestandsnaam in *; do
  if [ -f "$bestandsnaam" ]; then
    nieuwe_naam="${bestandsnaam// /_}"  # Vervang spaties door underscores
    if [ "$bestandsnaam" != "$nieuwe_naam" ]; then
      mv "$bestandsnaam" "$nieuwe_naam"
      echo -e "${groen}Bestandsnaam gewijzigd: $bestandsnaam -> $nieuwe_naam${reset}"
    fi
  fi
done

echo "Spaties in bestandsnamen zijn vervangen door underscores in directory: $1"