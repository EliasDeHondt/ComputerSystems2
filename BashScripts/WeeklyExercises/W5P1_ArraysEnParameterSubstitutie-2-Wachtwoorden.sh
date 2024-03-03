#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Users en UserID alfabetisch tonen
file="/etc/passwd"
array_naam=()
array_id=()
index=0

IFS=$'\n'

for lijn in `cat $file`; do
  gebruikers_naam=$(echo $lijn | cut -d: -f1)
  gebruikers_id=$(echo $lijn | cut -d: -f3)

  array_naam[$index]=$gebruikers_naam
  array_id[$index]=$gebruikers_id

  index=$(($index + 1))
done

# Sorteer de arrays alfabetisch (gebruik Bubblesort)
aantal=${#array_naam[@]}

for ((i = 0; i < $aantal - 1; i++)); do
  for ((j = 0; j < $aantal - i - 1; j++)); do
    if [[ "${array_naam[$j]}" > "${array_naam[$j + 1]}" ]]; then
      # Wissel gebruikersnamen uit
      temp="${array_naam[$j]}"
      array_naam[$j]="${array_naam[$j + 1]}"
      array_naam[$j + 1]="$temp"

      # Wissel gebruikers-ID's uit
      temp="${array_id[$j]}"
      array_id[$j]="${array_id[$j + 1]}"
      array_id[$j + 1]="$temp"
    fi
  done
done

# Toon de gesorteerde arrays
for ((i=0; i<${#array_naam[@]}; i++)); do
  echo "${array_naam[$i]} = ${array_id[$i]}"
done