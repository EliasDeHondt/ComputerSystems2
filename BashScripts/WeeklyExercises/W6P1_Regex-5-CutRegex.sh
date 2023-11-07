#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Knippen van output + regex


# Controleer of er minstens één argument is opgegeven
if [ $# -lt 1 ]; then
  echo "Gebruik: $0 REGEX [BESTAND]"
  exit 1
fi

# Controleer of de reguliere expressie is opgegeven als argument
if [ -z "$1" ]; then
  echo "Geef een reguliere expressie op als het eerste argument."
  exit 1
fi

regex="$1"
bestand=""

# Controleer of een bestand is opgegeven als tweede argument
if [ $# -ge 2 ]; then
  bestand="$2"
fi

# Functie om regex-groepen uit een tekst te halen
function get_regex_groups() {
  local text="$1"
  local regex="$2"

  if [[ $text =~ $regex ]]; then
    for ((i = 1; i <= ${#BASH_REMATCH[@]}; i++)); do
      echo "Groep $i: ${BASH_REMATCH[i]}"
    done
  fi
}

# Lees input van stdin of bestand en pas de reguliere expressie toe
if [ -z "$bestand" ]; then
  while IFS= read -r regel; do
    get_regex_groups "$regel" "$regex"
  done
else
  while IFS= read -r regel; do
    get_regex_groups "$regel" "$regex"
  done < "$bestand"
fi