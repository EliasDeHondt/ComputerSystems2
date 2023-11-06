#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Schrijven van een backup script
errorlog="/var/log/error_$(basename $0).log"
backuplog="/var/log/backup_$(basename $0).log"
backupdir="$HOME"
backupregex="*.sh"


# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
  exit 1
fi

if [ -n "$1" ]; then # Niet leeg?
  if [ -d "$1" ]; then # Is directory?
    backupdir="$1"
  else
    echo "Opstarten met een directory als eerste argument: bv. sudo ./`basename $0` /home"
    exit 1
  fi
fi

backupfile="${backupdir}/Backup_$(date +'%Y_%m_%d_%H_%M_%S'.tar)"


find ${backupdir} -mtime -5 -iname "${backupregex}" -exec tar -rPvf ${backupfile} {} \; >> ${backuplog} 2>> ${errorlog}
gzip ${backupfile}