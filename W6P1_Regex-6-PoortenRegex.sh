#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Tonen van luisterende tcp poorten + regex
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

echo "TCP poorten:"
sudo netstat -tulpn | grep -E "^tcp" | grep -E -o ":[0-9]{1,}\s" | grep -E -o "[0-9]{1,}"