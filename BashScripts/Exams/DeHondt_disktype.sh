#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie: Zoek de minimale disk size voor een bepaalde disktype en zone
reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'
groen='\e[0;32m'
file="disktypes.txt"
i=0


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function filter() {
  while IFS= read -r lijn; do
    local lijn_disktype=$(echo "$lijn" | grep -Eo "(pd|local|hyperdisk)\-[a-z]+" | grep -Eo "\-[a-z]+" | grep -Eo "[a-z]+")
    local lijn_zone=$(echo "$lijn" | grep -Eo " [a-z]+" | grep -Eo "[a-z]+")

    if [ "$disktype" = "$lijn_disktype" ] && [ "$country" = "$lijn_zone" ]; then

      local valid_disk_sizes=$(echo "$lijn" | grep -Eo "[0-9]{1,}GB\-[0-9]{1,}GB")
      local min_sizes=$(echo "$valid_disk_sizes" | grep -Eo "^[0-9]+GB")
      local zone=$(echo "$lijn" | grep -Eo "[a-z]+[0-9]+\-[a-z]")
      echo -e "${groen}FOUND  $zone min $min_sizes${reset}"
      (( i+=1 ))
    fi

  done < "$file"
}

# Start van het script
if [ "$EUID" -eq 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Opstarten als root mag niet vb. $0"
fi

if [ $# -ne 2 ]; then # Functie: Zorgen dat het script een bepaald aantal argumenten verwacht
  error_exit "Ongeldig aantal argumenten. Gebruik: $0 arg1 arg2"
fi

if [ "$1" = "ssd" ] || [ "$1" = "balanced" ]; then
  disktype="$1"
  country="$2"
else
  error_exit "Ongeldige invoer. Voer alstublieft een geldige disktype in (ssd of balanced)"
fi

echo -e "Dit is het script van ${blauw}De Hondt Elias${reset}."
filter "$disktype" "$country"

if [ $i -eq 0 ]; then
  error_exit "FOUND Nothing"
fi