#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie:
# Arguments:
# Auteur: elias.dehondt@outlook.com
# Copyright: 2014 GNU v3 elias.dehondt@outlook.com
# Versie: 0.1
# Requires: Standaard shell find commando
reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'
groen='\e[0;32m'
bestandsnaam="$1"
required_program="bc"
cpu_id=0


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function maxcpu() {
  ps xo cpuid,cmd | grep -Eo " [0-9] " | grep -Eo "[0-9]" >> "temp.txt"
  max=0
  while IFS= read -r lijn; do
    if [ "$lijn" -gt "$max" ]; then
      max=$lijn
    fi
  done < "temp.txt"
  (( max+=1 ))
  rm "temp.txt"
}

# Start van het script
if [ "$EUID" -eq 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Opstarten als root mag niet vb. $0"
fi

if [ ! -f "$bestandsnaam" ]; then # Functie: Controleren of een bestand bestaat
  error_exit "Bestand bestaat niet"
fi

if ! command -v $required_program &> /dev/null; then # Functie: Controleren of een programma is geïnstalleerd
  error_exit "Het programma '$required_program' is niet geïnstalleerd. Installeer dit programma om verder te gaan."
fi

echo -e "Dit is het script van ${blauw}De Hondt Elias${reset}."
maxcpu
echo -e "Deze computer heeft $max processoren"

while IFS= read -r lijn; do
  if [ ! "$lijn" = "" ]; then

    berekening_lijn=$(echo "$lijn" | grep -o "\\\".*\"" | sed -e "s/\\\"//;s/\"//")

    berekening=$(echo $berekening_lijn | bc -l "berekening_lijn")

    if [ "$cpu_id" = "$max" ]; then
       cpu_id=0
    else
      command=$(taskset --cpu-list "$cpu_id" sh "${berekening}")
      echo -e "COMMAND: $command"
      echo -e "ANSWER: on cpu ${groen}$cpu_id${reset}:"
      (( cpu_id+=1 ))
    fi
  fi
done < "$bestandsnaam"