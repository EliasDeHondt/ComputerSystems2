#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Dit script controleert of er een servernaam is ingesteld voor Apache.
configuratiebestand="/etc/apache2/apache2.conf"
command=$(cat $configuratiebestand | grep -E "ServerName")


# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
  exit 1
fi

if [ -z "$command" ]; then
  echo "No server name has been set for Apache"
  echo -n "Please enter the server name you want to configure for the Apache: "
  read serverName
  echo "ServerName $serverName" >> $configuratiebestand
else
  echo "This is the server name currently set: ($command)"
fi