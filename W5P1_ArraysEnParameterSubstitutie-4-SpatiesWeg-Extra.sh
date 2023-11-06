#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Random testbestanden aanmaakt


# Aantal testbestanden dat moet worden aangemaakt
aantal_bestanden=10

# Loop om testbestanden aan te maken
for ((i = 1; i <= $aantal_bestanden; i++)); do
  # Genereer een willekeurige bestandsnaam met behulp van $RANDOM
  bestandsnaam="testbestand_$RANDOM.txt"

  # Maak het bestand aan (bijvoorbeeld, hier wordt een leeg bestand aangemaakt)
  touch "$bestandsnaam"

  echo "Aangemaakt: $bestandsnaam"
done