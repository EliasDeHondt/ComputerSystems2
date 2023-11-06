#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Opstarten van een proces als regelmatig achtergrondproces
directory="/etc/cron.d/backupcron"


if [ "$1" = "--remove" ]; then
  sudo rm "$directory"
  exit 0
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  echo -e "bv. sudo ./`basename $0` [--remove]\n  --remove Remove cron file\n  --help of -h Display this help message"
  exit 0
fi

# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
  exit 1
fi

# Controleer of het script wordt uitgevoerd met een eerste argument
if [ ! -n "$1" ]; then
  echo "Opstarten moet met een eerste argument"
  exit 1
fi

# Het eerste argument moet een uitvoerbaar bestand zijn (r en x)
if [ ! -r "$0" ] || [ ! -x "$0" ]; then
  echo "$0 is niet uitvoerbaar"
  exit 1
fi

commando="$1"
content="# Minute Hour Day_of_Month Month Day of Week User Command\n# (0-59) (0-23) (1-31) (1-12) (0-6)\n* * * * * root ${commando}"
echo -e "$content" > "$directory"