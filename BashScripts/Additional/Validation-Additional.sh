#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie: Additional info voor validation
reset='\e[0m'
rood='\e[0;31m'


function error_exit() { # Functie: Error afhandeling
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

if [ "$EUID" -ne 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
fi

if [ $# -ne 3 ]; then # Functie: Zorgen dat het script een bepaald aantal argumenten verwacht
  error_exit "Ongeldig aantal argumenten. Gebruik: $0 arg1 arg2 arg3"
fi

bestandsnaam="voorbeeld.txt"
if [ ! -f "$bestandsnaam" ]; then # Functie: Controleren of een bestand bestaat
  error_exit "Bestand $bestandsnaam bestaat niet"
fi

read -p "Voer een getal in tussen 1 en 10: " gebruikersinvoer
if ! [[ $gebruikersinvoer =~ ^[1-9]$|^10$ ]]; then # Functie: Controleren of de gebruikersinvoer binnen een specifiek bereik ligt
  error_exit "Ongeldige invoer. Voer alstublieft een getal tussen 1 en 10 in"
fi

read -p "Weet u het zeker? (J/N): " bevestiging
bevestiging=${bevestiging^^} # Omzetten naar hoofdletters
if [ "$bevestiging" != "J" ]; then # Functie: Valideren van gebruikersbevestiging (J/N)
  error_exit "Actie geannuleerd."
fi

map="voorbeeld_map"
if [ ! -d "$map" ]; then # Functie: Controleren of een directory bestaat
  error_exit "Map $map bestaat niet"
fi

bestand="voorbeeld_bestand.txt"
if [ ! -w "$bestand" ]; then # Functie: Zorgen dat een bestand de juiste rechten heeft
  error_exit "Bestand $bestand is niet beschrijfbaar"
fi

if ! ping -c 1 google.com &> /dev/null; then # Functie: Controleren op internetconnectiviteit
  error_exit "Geen internetverbinding"
fi

poort=80
if ! nc -zv 127.0.0.1 $poort &> /dev/null; then # Functie: Controleren of een specifieke poort open is
  error_exit "Poort $poort is niet open"
fi

required_program="nano"
if ! command -v $required_program &> /dev/null; then # Functie: Controleren of een programma is geïnstalleerd
  error_exit "Het programma '$required_program' is niet geïnstalleerd. Installeer dit programma om verder te gaan."
fi

if [ -z "$VAR_NAME" ]; then # Functie: Controleren of een omgevingsvariabele is ingesteld
  error_exit "De omgevingsvariabele VAR_NAME is niet ingesteld"
fi

read -p "Voer een getal in: " user_input
if ! [[ $user_input =~ ^[0-9]+$ ]]; then # Functie: Controleren of de invoer een geldig getal is
  error_exit "Ongeldige invoer. Voer alstublieft een getal in"
fi

read -p "Voer iets in: " user_input
if [ -z "$user_input" ]; then # Functie: Controleren op lege invoer
  error_exit "Er is niets ingevoerd"
fi

username="example_user"
if ! id "$username" &>/dev/null; then # Functie: Controleren of een gebruiker bestaat
  error_exit "De gebruiker $username bestaat niet"
fi

groupname="example_group"
if ! getent group "$groupname" &>/dev/null; then # Functie: Controleren of een groep bestaat
  error_exit "De groep $groupname bestaat niet"
fi

directory="example_directory"
if [ -n "$(find "$directory" -maxdepth 0 -type d -empty)" ]; then # Functie: Controleren of een map leeg is
  error_exit "De map $directory is leeg"
fi

read -s -p "Voer een nieuw wachtwoord in: " password
if [ ${#password} -lt 8 ]; then # Functie: Controleren van wachtwoordsterkte
  error_exit "Het wachtwoord moet minimaal 8 tekens lang zijn"
fi