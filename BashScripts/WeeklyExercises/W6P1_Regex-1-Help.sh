#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Schrijven van een backup script + regex
errorlog="/var/log/error_$(basename $0).log"
backuplog="/var/log/backup_$(basename $0).log"
backupdir="$HOME"
backupregex="*.sh"
#regex="^[-]{1,2}h(elp)?$"
regex="^(--help|-h)$"
args=("$@")


# Loop door de array en pas het regex-patroon toe op elk element
for arg in "${args[@]}"; do
  if [[ $arg =~ $regex ]]; then
    echo "Je wou hier de helpfunctie gebruiken, Maar ik ben te lui om er een te maken"
    exit 0
  fi
done

# Controleer of het script wordt uitgevoerd als root
if [ "$EUID" -ne 0 ]; then
  echo "Opstarten als root gebruiker: bv. sudo .0"
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
