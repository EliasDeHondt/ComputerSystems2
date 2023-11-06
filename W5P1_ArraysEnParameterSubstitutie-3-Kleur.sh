#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Array doorgeven aan functie
reset='\e[0m'


function seed() {
  index=0
  random_kleuren=()
  while [ $index -lt 900 ]; do
    # Genereer een willekeurig getal tussen 0 en 5
    random_num=$((RANDOM % 6))

    # Voeg 41 toe aan het willekeurige getal om het bereik te verschuiven naar 41-46
    result=$((random_num + 41))

    random_kleuren[$index]=$result

    let index+=1
  done
}

function show() {
  index=0

  for ((i = 0; i < $rijen; i++)); do
    for ((j = 0; j < $kolommen; j++)); do
      kleur='\e[0;'${random_kleuren[$index]}'m'
      echo -e -n "${kleur}  ${reset}"
      let index+=1
    done
    echo ""
  done
}

while true; do
  read -p "Geef het aantal kolommen: " kolommen
  read -p "Geef het aantal rijen: " rijen

  seed
  show

  read -p "Wil je nogmaals random kleuren (Y/n): " loop
  if [[ $loop == "n" || $loop == "N" ]]; then
    break
  fi
done