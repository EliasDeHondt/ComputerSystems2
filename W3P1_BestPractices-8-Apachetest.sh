#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Benchmark test voor apache webserver oproepen (Variant vraag 1 apachetest)
error_geen_ab="Het programma ab is nodig. Installeren kan met sudo apt-get install apache2-utils"
error_url="De url is niet bereikbaar"
url=""


# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
  exit 1
fi

# Controleer of het programma x geïnstalleerd is
command -v ab >/dev/null || (echo $error_geen_ab >&2 && exit 1);

# Controleer of het programma 'ap' geïnstalleerd is
if ! command -v ab >/dev/null; then
  echo -n "Vraag je om apache2-utils te installeren (y/n): "
  read question
  if [ "$question" = "y" ]; then
    sudo apt-get install apache2-utils -y >/dev/null
  elif [ "$question" = "n" ]; then
    echo "Het programma 'ab' moet geïnstalleerd zijn."
    exit 1
  else
    echo "Ongeldige invoer. Kies 'y' om te installeren of 'n' om te annuleren."
    exit 1
  fi
fi

if ! command -v ab >/dev/null; then
  echo "Installatie apache2-utils mislukt"
  exit 3
fi

# Controleer of $1 een URL is (bijvoorbeeld https://www.example.com/)
if [[ $1 =~ ^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/ ]]; then
  url=$1
else
  url="127.0.0.1/"
fi

curl -o /dev/null --silent --head --connect-timeout 1 $url

if [ $? -ne 0 ]; then
  echo $error_url && exit 2
fi

ab -n 100 -kc 10 $url