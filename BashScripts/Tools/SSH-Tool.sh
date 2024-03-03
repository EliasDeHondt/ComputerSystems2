#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: SSH Tool om verbinding te maken met een remote server,
# een commando uit te voeren op een remote server of data te uploaden naar een remote server
reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'
line="############"
logfile="/var/log/ssh-tool.log"
Option1="Connection to remote server"
Option2="Execute command on remote server"
Option3="Upload data to remote server"
Option4="View log page"


function error_exit() { # Functie: Error afhandeling
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function main_menu() { # Functie: Hoofdmenu van het script
  echo -e "${blauw}$line\n# SSH Tool #\n$line${reset}"
  echo "1) $Option1"
  echo "2) $Option2"
  echo "3) $Option3"
  echo "4) $Option4"
  read -p "What do you want to do (1-4): " menu_decision

  if [[ ! $menu_decision =~ ^[1-4] ]]; then # Functie: Controleren of de input een getal is tussen 1 en 4
    error_exit "Invalid input. Please enter a number between 1 and 4"
  fi
}

function basic_info() { # Functie: Basis informatie vragen om verbinding te maken met een remote server
  read -p "What is the port of the ssh server (Default 22): " port
  if [[ $port == "" ]]; then
    port=22
  fi
  if [[ $port -le 0 || $port -ge 65353 ]]; then
    error_exit "The port number is not in the correct exclusive range 0-65353"
  fi

  read -p "What is the user name of the ssh server (Required): " username
  if [[ ! $username =~ ^[A-Za-z]+$ ]]; then
    error_exit "The username can only consist of one of the 26 characters from the alphabet"
  fi

  read -p "What is the IP of the ssh server (Required): " ip
  if [[ ! $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    error_exit "You did not enter a valid IP address (FQDN's are not allowed)"
  fi
}

function make_log() { # Functie: Logboek aanmaken
  echo -e "Performed action $1 $(date +'%Y-%m-%d %H:%M:%S')" >> "$logfile"
}

if [ "$EUID" -ne 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Starting as root user: e.g. sudo ./`basename $0`"
fi

# Start van het script
main_menu

if [ $menu_decision -eq 4 ]; then # Functie: Logboek tonen
  cat "$logfile"
  make_log "$Option4"
  exit 0
fi

basic_info

if [ $menu_decision -eq 1 ]; then # Functie: Verbinding maken met een remote server
  ssh -p $port $username@$ip
  make_log "$Option1"
fi

if [ $menu_decision -eq 2 ]; then # Functie: Commando uitvoeren op een remote server
  read -p "Which command do you want to use: " command
  ssh -p $port $username@$ip $command
  make_log "$Option2"
fi

if [ $menu_decision -eq 3 ]; then # Functie: Data uploaden naar een remote server
  read -p "Please enter the path of the file: " file
  if [ ! -f "$file" ]; then # Functie: Controleren of een bestand bestaat
    error_exit "File $file does not exist"
  fi

  read -p "In which directory should it be placed on the server: " directory
  if [ ! -d "$directory" ]; then # Functie: Controleren of een directory bestaat
    error_exit "Directory $directory does not exist"
  fi

  scp -P $port $file $username@$ip:$directory
  make_log "$Option3"
fi