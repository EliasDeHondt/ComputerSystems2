#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: JPG bestanden een watermerk geven
foto_naam="Logo_V.png"


function download_logo() {
  if [ ! -e "./$foto_naam" ]; then
    wget https://www.kdg.be/doc/huisstijl/Logo_V.png
  fi
}

function maak_watermerk() {
  originele_bestand="$1"
  bestandsnaam_zonder_extensie="${originele_bestand%.*}"
  new_bestandsnaam="${bestandsnaam_zonder_extensie}.png"

  # Verhoog de helderheid en het contrast van het logo met convert
  convert "${foto_naam}" -brightness-contrast 92x20 "${foto_naam}"

  composite -compose bumpmap -tile "${foto_naam}" "$originele_bestand" "$new_bestandsnaam"
}

# Download het logo
download_logo

# Loop door alle bestandsnamen in de directory met .jpg of .JPG
for bestandsnaam in *.jpg *.JPG; do
  if [ -f "$bestandsnaam" ]; then
    maak_watermerk "$bestandsnaam"
  fi
done