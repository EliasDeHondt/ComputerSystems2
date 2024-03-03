#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Kleuren van output commando ps


# Schakel extglob in voor het herkennen van regex-patronen
shopt -q -s extglob

# Functie om tekst in rood te kleuren
function red() {
  echo -e "\e[31m$1\e[0m"
}

# Functie om tekst in blauw te kleuren
function blue() {
  echo -e "\e[34m$1\e[0m"
}

# Voer het ps-commando uit en lees de output met een for-lus
while read -r line; do
  # Gebruik parametervervanging en regex om de eerste kolom rood te maken
  red_column="${line%% *}"
  rest_of_line="${line#* }"

  # Gebruik parametervervanging en regex om de tweede kolom blauw te maken
  blue_column="${rest_of_line%% *}"
  rest_of_line="${rest_of_line#* }"

  # Geef de aangepaste output weer
  echo -e "$(red "$red_column") $(blue "$blue_column") $rest_of_line"
done < <(ps -eo pid,args)

# Schakel extglob terug uit
shopt -q -u extglob