#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Vinden welk proces een bepaalde poort gebruikt
error_geen_netcat="Het programma netcat is niet geïnstalleerd"


# Controleer of het programma x geïnstalleerd is
command -v netcat >/dev/null || (echo $error_geen_netcat >&2 && exit 1);

# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  echo -e "Your permissions are limited please hold:\n"
  counter=1024
  while [ $counter -lt 49151 ]; do
    lsof -nPi tcp:$counter | grep -i "listen"
    echo $counter
    let counter+=1 # Eentje bijtellen
  done
  echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
  exit 1
fi

counter=0
while [ $counter -lt 100 ]; do
  lsof -nPi tcp:$counter | grep -i "listen"
  # -n geen vertaling van ip adres/naar naam (domain lookup)
  # -P geen vertaling van poortnummer naar poortnaam
  # -i IP protocol
  let counter+=1 # Eentje bijtellen
done