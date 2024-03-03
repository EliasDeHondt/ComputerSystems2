#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Script schrijven dat automatisch met ssh verbindt met "expect"
filedir="expect.sh"
host="127.0.0.1"
port="22"


# Controleer of het script wordt uitgevoerd met 3 argumenten
if [ ! -n "$1" ] || [ ! -n "$2" ] || [ ! -n "$3" ]; then # Leeg?
  echo "Usage: ./autologin.sh hostname username password"
  exit 1
fi

# Controleer of het programma x geïnstalleerd is
if ! command -v ssh >/dev/null; then
  echo "SSH niet geïnstalleerd"
  exit 1
fi

if ! nc -w 1 $host $port 2>/dev/null >/dev/null ; then
  echo "Local SSH server not responding"
  exit 1
fi

# Schrijven van een expect script
echo '#!/usr/bin/expect -f' >> $filedir
echo 'set timeout 20' >> $filedir
echo "spawn ssh -o \"StrictHostKeyChecking no\" $2@$1" >> $filedir
echo 'expect "*assword:*"' >> $filedir
echo "send $3\r">> $filedir
echo "interact" >> $filedir
echo "exit" >> $filedir
chmod +x $filedir

# Opstarten expect script en daarna verwijderen
./$filedir
rm $filedir