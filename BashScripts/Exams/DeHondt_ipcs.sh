#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# Functie:
reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'
temp_data="temp.txt"
blanks_nr=18

function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function pid2name() {
  name_pid=$(ps -q "$1" -o comm=)
  if [ "$name_pid" = "" ]; then
    name_pid="$1"
  fi
}

function blanks() {
  blank=""
  (( sum=$2-${#1} ))

  for ((i=1; i<sum; i++)); do
    blank+=" "
  done
}

# Start van het script
if [ "$EUID" -eq 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Opstarten als root mag niet vb. $0"
fi

echo -e "Dit is het script van ${blauw}De Hondt Elias${reset}."

ipcs -p | awk 'NR>=7' >> "$temp_data"

while IFS= read -r lijn; do
  if [ ! "$lijn" = "" ]; then

    lijn_shmid=$(echo "$lijn" | awk '{print $1}' | grep -Eo "[0-9]{1,6}")
    lijn_owner=$(echo "$lijn" | awk '{print $2}' | grep -Eo "[a-z]{1,}")
    lijn_cpid=$(echo "$lijn" | awk '{print $3}' | grep -Eo "[0-9]{1,6}")
    lijn_lpid=$(echo "$lijn" | awk '{print $4}' | grep -Eo "[0-9]{1,6}")

    blanks "$lijn_shmid" "$blanks_nr"
    blank_shmid="$blank"

    pid2name "$lijn_cpid"
    name_cpid="$name_pid"
    blanks "$name_cpid" "$blanks_nr"
    blank_cpid="$blank"

    pid2name "$lijn_lpid"
    name_lpid="$name_pid"
    blanks "$name_lpid" "$blanks_nr"
    blank_lpid="$blank"

    echo -e "$lijn_shmid $blank_shmid $lijn_owner $blank_cpid $name_cpid $blank_lpid $name_lpid"
  fi
done < "$temp_data"

rm "$temp_data"