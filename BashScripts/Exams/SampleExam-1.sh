#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: ?
reset='\e[0m'
rood='\e[0;31m'
paars='\e[0;35m'
filetemp="temp.txt"
ipaI=0
ipbI=0
ipcI=0


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

function ip_filter() {
  octet=$(echo "$1" | cut -d. -f1)
  if [ $octet -le 127 ] && [ $octet -ge 0 ]; then
    ipaI=$(($ipaI+1))
  fi
  if [ $octet -le 191 ] && [ $octet -ge 128 ]; then
    ipbI=$(($ipbI+1))
  fi
  if [ $octet -le 255 ] && [ $octet -ge 192 ]; then
    ipcI=$(($ipcI+1))
  fi
}

# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  error_exit "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
fi

if [ "$1" != "A" ] && [ "$1" != "B" ] && [ "$1" != "C" ]; then
  error_exit "Argument 1 moet A, B of C"
fi

if [ ! -f "$2" ]; then
  error_exit "Argument 2 is geen file"
fi

for lijn in `cat "$2"`; do
  grepRx=$(echo "$lijn" | grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}")
  if [ -n "$grepRx" ]; then
    resultaat="$grepRx"
    echo "$resultaat" >> "$filetemp"
  fi
done

for lijn in `cat "$filetemp"`; do
  ip_filter "$lijn"
done

echo "Aantal IPs in klasse:"

if [ "$1" = "A" ]; then
  echo -e "${paars}A:$ipaI${reset}"
else
  echo "A:$ipaI"
fi

if [ "$1" = "B" ]; then
  echo -e "${paars}B:$ipbI${reset}"
else
  echo "B:$ipbI"
fi

if [ "$1" = "C" ]; then
  echo -e "${paars}C:$ipcI${reset}"
else
  echo "C:$ipcI"
fi

rm "$filetemp"