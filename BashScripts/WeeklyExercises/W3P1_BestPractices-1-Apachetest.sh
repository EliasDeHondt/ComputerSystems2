#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Benchmark test voor apache webserver oproepen
error_geen_ab="Het programma ab is nodig. Installeren kan met sudo apt-get install apache2-utils"
error_url="De url is niet bereikbaar"
url=""


# Controleer of het programma x geïnstalleerd is
command -v ab >/dev/null || (echo $error_geen_ab >&2 && exit 1);

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