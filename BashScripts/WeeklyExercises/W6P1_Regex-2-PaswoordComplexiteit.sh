#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: De gebruiker een paswoord laten ingeven dat voldoet aan volgende criteria ->
regex="^[A-Z]{1}.{7,}[0-9]{2,}"


echo -e " -Beginnen met een hoofdletter\n -Minimum 8 karakters lang zijn\n -Eindigen met minstens twee getallen\n"
echo -n "Geef een wachtwoord in dat voldoet aan bovenstaande criteria: "
read paswoord

if [[ $paswoord =~ $regex ]]; then
  echo "Paswoord geldig"
else
  echo "Paswoord ongeldig"
fi