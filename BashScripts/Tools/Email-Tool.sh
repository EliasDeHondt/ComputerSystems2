#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Email versturen met een bash script (mailutils)
reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'
groen='\e[0;32m'
line="##############"
logfile="/var/log/email-tool.log"
Option1="Send new email"
Option2="Read sended emails"
receiver_array=()
carbon_copy_array=()
blind_carbon_copy_array=()


function error_exit() { # Functie: Error afhandeling
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function validation_range {
  if [[ $1 -lt $2 || $1 -gt $3 ]]; then
    error_exit "Invalid input. Please enter a number between $2 and $3"
  fi
}

function validation_email() {
  if [[ ! $1 =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
    error_exit "This is not a valid email address: $1"
  fi
}

function main_menu() { # Functie: Hoofdmenu van het script
  echo -e "${blauw}$line\n# Email Tool #\n$line${reset}"
  echo "1) $Option1"
  echo "2) $Option2"
  read -p "What do you want to do (1-2): " menu_decision

  validation_range $menu_decision "1" "2"
}

function input_email_addresses() {
  i=0
  while [ $i -ne $1 ]; do
    read -p "Enter, one of the $3 email: " temp_email
    validation_email $temp_email
    eval "$2[$i]=$temp_email"
    let i+=1
  done
}

function basic_info() {
  read -p "[Receiver] To how many people do you want to send an e-mail (1-9): " receiver_amount
  validation_range $receiver_amount "1" "9"
  input_email_addresses $receiver_amount "receiver_array" "receiving"


  read -p "[Carbon copy] How many people are going to be in CC (0-9): " carbon_copy_amount
  validation_range $carbon_copy_amount "0" "9"
  input_email_addresses $carbon_copy_amount "carbon_copy_array" "carbon copy"


  read -p "[Blind carbon copy] How many people are going to be in BCC (0-9): " blind_carbon_copy_amount
  validation_range $blind_carbon_copy_amount "0" "9"
  input_email_addresses $blind_carbon_copy_amount "blind_carbon_copy_array" "blind carbon copy"

  read -p "[Subject] What should the subject be: " subject
  subject_length=${#subject}
  if [ $subject_length -ge 30 ]; then
    error_exit "The subject cannot be longer than 30 characters"
  fi

  read -p "[Message] Please enter your message: " message
}

function print_array() {
  local array_name="$1"  # Array-naam ontvangen als argument
  local -n array="$array_name"  # Toewijzen van de arraynaam aan een lokale verwijzing
  length=${#array[@]}  # Bepalen van de lengte van de lokale array

  i=0
  while [ $i -lt $length ]; do
    data_array=${array[$i]}
    echo -e "This is one of the ${groen}$2${reset} emails ${groen}$data_array${reset}"
    let i+=1
  done
}

function show_data_entries() {
  echo -e "\nShowing all data entries:"
  print_array "receiver_array" "receiving"
  print_array "carbon_copy_array" "carbon copy"
  print_array "blind_carbon_copy_array" "blind carbon copy"
  echo -e "This was the subject: ${groen}$subject${reset}"
  echo -e "This was the chosen message: ${groen}$message${reset}\n"
}

function make_log() { # Functie: Logboek aanmaken
  echo -e "Performed action $1 $(date +'%Y-%m-%d %H:%M:%S')" >> "$logfile"
}

if [ "$EUID" -ne 0 ]; then # Functie: Controleer of het script als root wordt uitgevoerd
  error_exit "Starting as root user: e.g. sudo ./`basename $0`"
fi

# Start van het script
main_menu

if [ $menu_decision -eq 1 ]; then
  basic_info
  show_data_entries
  echo "An attempt has been made to send the email"
  # Out of scope and not relevant -> (mailutils)...
  # For example -> https://www.digitalocean.com/community/tutorials/send-email-linux-command-line
  make_log "$Option1"
  exit 0
fi

if [ $menu_decision -eq 2 ]; then
  cat "$logfile"
  make_log "$Option2"
  exit 0
fi