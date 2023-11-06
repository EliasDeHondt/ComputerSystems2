#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Aanpassen separator
bestand="users.csv"


# IFS instellen op een komma om CSV-lijnen te splitsen
IFS=','

echo "jcelis,Jan Celis" > $bestand
echo "pboedt,Piet Boedt" >> $bestand

# Lees het bestand lijn per lijn en toon elk veld
while read -r gebruikersnaam volledige_naam; do
  echo "Gebruikersnaam: $gebruikersnaam"
  echo "Volledige naam: $volledige_naam"
  echo
done < "$bestand"