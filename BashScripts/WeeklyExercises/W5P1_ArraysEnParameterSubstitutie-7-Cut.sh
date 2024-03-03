#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Knippen van output


# Controleer of er minstens één argument is opgegeven
if [ $# -lt 1 ]; then
  echo "Gebruik: $0 [-c CHARACTERS] [BESTAND]"
  exit 1
fi

# Standaardwaarden
characters=""

# Verwerkt argumenten
while getopts "c:" opt; do
  case $opt in
    c)
      characters="$OPTARG"
      ;;
    \?)
      echo "Ongeldige optie: -$OPTARG"
      exit 1
      ;;
  esac
done

# Shift om de verwerkte opties over te slaan
shift $((OPTIND - 1))

# Controleer of er een bestand is opgegeven als argument
if [ $# -lt 1 ]; then
  echo "Geef een bestand op als argument."
  exit 1
fi

bestand="$1"

# Lees input van stdin en gebruik parameter substitutie om te knippen
while IFS= read -r regel; do
  echo "$regel" | cut -c $characters
done < "$bestand"