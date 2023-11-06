#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Tonen van luisterende tcp poorten
reset='\e[0m'
rood='\e[0;31m'
groen='\e[0;32m'


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

# Controleer of het programma 'netstat' geïnstalleerd is
if ! command -v netstat >/dev/null; then
  echo -n "Wilt u netstat installeren (y/n): "
  read question
  if [ "$question" = "y" ]; then
    sudo apt install net-tools -y >/dev/null
  elif [ "$question" = "n" ]; then
    error_exit "Het programma 'netstat' moet geïnstalleerd zijn."
  else
    error_exit "Ongeldige invoer. Kies 'y' om te installeren of 'n' om te annuleren."
  fi
else
  echo -e "${groen}De nodige programma's zijn geïnstalleerd.${reset}"
fi

# Voer netstat -tulpn uit en sla de uitvoer op in temp.txt
netstat -tulpn >> temp.txt

# Filter en toon luisterende TCP-poorten
echo "TCP poorten:"
awk '$6 == "LISTEN" { split($4, a, ":"); print a[length(a)] }' temp.txt | sort -n | uniq

# awk wordt gebruikt om tekst te verwerken en te filteren.
# $6 == "LISTEN" controleert of het zesde veld in elke regel "LISTEN" is, wat aangeeft dat de poort luistert.
# { split($4, a, ":"); print a[length(a)] } splitst het vierde veld op basis van dubbele punten en drukt het laatste element af. Dit is de poort.
# sort -n wordt gebruikt om de uitvoer van awk te sorteren. De -n optie zorgt ervoor dat numerieke sortering wordt uitgevoerd, zodat de poorten op numerieke volgorde worden weergegeven.
# uniq wordt gebruikt om dubbele vermeldingen te verwijderen. Dit zorgt ervoor dat elke poort maar één keer wordt weergegeven in de uitvoer.

# Verwijder het tijdelijke bestand
rm temp.txt