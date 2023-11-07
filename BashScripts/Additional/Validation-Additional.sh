#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie: Additional info voor validation
reset='\e[0m'
rood='\e[0;31m'


# Functie: Error afhandeling.
function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

# Functie: Controleer of het script als root wordt uitgevoerd.
if [ "$EUID" -ne 0 ]; then
  error_exit "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
fi

# Zorgen dat het script een bepaald aantal argumenten verwacht
if [ $# -ne 3 ]; then
  error_exit "Ongeldig aantal argumenten. Gebruik: $0 arg1 arg2 arg3"
fi

# Controleren of een bestand bestaat
bestandsnaam="voorbeeld.txt"
if [ ! -f "$bestandsnaam" ]; then
  error_exit "Bestand $bestandsnaam bestaat niet"
fi

# Controleren of de gebruikersinvoer binnen een specifiek bereik ligt
read -p "Voer een getal in tussen 1 en 10: " gebruikersinvoer
if ! [[ $gebruikersinvoer =~ ^[1-9]$|^10$ ]]; then
  error_exit "Ongeldige invoer. Voer alstublieft een getal tussen 1 en 10 in"
fi

# Valideren van gebruikersbevestiging (J/N)
read -p "Weet u het zeker? (J/N): " bevestiging
bevestiging=${bevestiging^^} # Omzetten naar hoofdletters
if [ "$bevestiging" != "J" ]; then
  error_exit "Actie geannuleerd."
fi

# Controleren of een directory bestaat
map="voorbeeld_map"
if [ ! -d "$map" ]; then
  error_exit "Map $map bestaat niet"
fi

# Zorgen dat een bestand de juiste rechten heeft
bestand="voorbeeld_bestand.txt"
if [ ! -w "$bestand" ]; then
  error_exit "Bestand $bestand is niet beschrijfbaar"
fi

# Controleren op internetconnectiviteit
if ! ping -c 1 google.com &> /dev/null; then
  error_exit "Geen internetverbinding"
fi

# Controleren of een specifieke poort open is
poort=80
if ! nc -zv 127.0.0.1 $poort &> /dev/null; then
  error_exit "Poort $poort is niet open"
fi

# Controleren of een programma is geïnstalleerd
required_program="nano"
if ! command -v $required_program &> /dev/null; then
  error_exit "Het programma '$required_program' is niet geïnstalleerd. Installeer dit programma om verder te gaan."
fi

# Controleren of een omgevingsvariabele is ingesteld
if [ -z "$VAR_NAME" ]; then
  error_exit "De omgevingsvariabele VAR_NAME is niet ingesteld"
fi

# Controleren of de invoer een geldig getal is
read -p "Voer een getal in: " user_input
if ! [[ $user_input =~ ^[0-9]+$ ]]; then
  error_exit "Ongeldige invoer. Voer alstublieft een getal in"
fi

# Controleren op lege invoer
read -p "Voer iets in: " user_input
if [ -z "$user_input" ]; then
  error_exit "Er is niets ingevoerd"
fi

# Controleren of een gebruiker bestaat
username="example_user"
if ! id "$username" &>/dev/null; then
  error_exit "De gebruiker $username bestaat niet"
fi

# Controleren of een groep bestaat
groupname="example_group"
if ! getent group "$groupname" &>/dev/null; then
  error_exit "De groep $groupname bestaat niet"
fi

# Controleren of een map leeg is
directory="example_directory"
if [ -n "$(find "$directory" -maxdepth 0 -type d -empty)" ]; then
  error_exit "De map $directory is leeg"
fi

# Controleren van wachtwoordsterkte
read -s -p "Voer een nieuw wachtwoord in: " password
if [ ${#password} -lt 8 ]; then
  error_exit "Het wachtwoord moet minimaal 8 tekens lang zijn"
fi