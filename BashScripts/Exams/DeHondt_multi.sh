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
reset=$'\e[0m'
rood=$'\e[0;31m'
blauw=$'\e[0;34m'
groen=$'\e[0;32m'
bestandsnaam="$1"
required_program="bc"
cpu_id=0

function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function maxcpu() {
  max=0
  while IFS= read -r lijn; do
    if [ "$lijn" -gt "$max" ]; then
      max=$lijn
    fi
  done < <(ps xo cpuid,cmd | grep -Eo " [0-9] " | grep -Eo "[0-9]")
  (( max++ ))
}

# Start des Skripts
if [ "$EUID" -ne 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Opstarten als root mag niet vb. sudo $0"
fi

if [ ! -f "$bestandsnaam" ]; then # Functie: Controleren of een bestand bestaat
  error_exit "Bestand bestaat niet"
fi

if ! command -v $required_program &> /dev/null; then # Functie: Controleren of een programma is geïnstalleerd
  error_exit "Het programma '$required_program' is niet geïnstalleerd. Installeer dit programma om verder te gaan."
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then 
  echo "sudo $0 <bestandsnaam>"
  exit 0
fi

if [ "$1" = "--versie" ]; then
  echo "Versie: 0.1"
  exit 0
fi

echo -e "Dit is het script van ${blauw}De Hondt Elias${reset}."
maxcpu
echo -e "Deze computer heeft $max processoren"

while IFS= read -r lijn; do
  if [ -n "$lijn" ]; then
    berechnung=$(echo "$lijn" | grep -o '\".*\"' | sed -e 's/\"//g')
    ergebnis=$(echo "$berechnung" | bc -l -q)

    if [ "$cpu_id" -eq "$max" ]; then
      cpu_id=0
    fi

    command_to_execute="taskset --cpu-list $cpu_id sh <<< \"$ergebnis\""
    echo -e "COMMAND: $command_to_execute"
    echo -e "ANSWER: auf CPU ${groen}$cpu_id${reset}: $ergebnis"
    (( cpu_id++ ))
  fi
done < "$bestandsnaam"