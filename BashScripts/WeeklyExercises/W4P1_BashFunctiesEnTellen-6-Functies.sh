#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Gebruik van functies [Script schrijven dat automatisch met ssh verbindt met "expect"]
filedir="expect.sh"
host="127.0.0.1"
port="22"
reset='\e[0m'
rood='\e[0;31m'

function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

# Controleer of het script wordt uitgevoerd met 3 argumenten
if [ ! -n "$1" ] || [ ! -n "$2" ] || [ ! -n "$3" ]; then # Leeg?
  error_exit "Usage: ./autologin.sh hostname username password" # Roep de functie op
fi

function test_ssh_server() {
  if ! nc -w 1 $host $port 2>/dev/null >/dev/null ; then
    error_exit "Local SSH server not responding" # Roep de functie op
  fi
}

function check_ssh_installed() {
  # Controleer of het programma x geïnstalleerd is
  if ! command -v ssh >/dev/null; then
    error_exit "SSH niet geïnstalleerd" # Roep de functie op
  fi
}

function create_and_execute_expect_script() {
  # Schrijven van een expect script
  echo '#!/usr/bin/expect -f' >> $filedir
  echo 'set timeout 20' >> $filedir
  echo "spawn ssh -o \"StrictHostKeyChecking no\" $2@$1" >> $filedir
  echo 'expect "*assword:*"' >> $filedir
  echo "send $3\r">> $filedir
  echo "interact" >> $filedir
  echo "exit" >> $filedir
  chmod +x $filedir
  # Opstarten expect script
  ./$filedir
  # Verwijderen expect script
  rm $filedir
}

# Roep de functies op
check_ssh_installed
test_ssh_server
create_and_execute_expect_script "$1" "$2" "$3"