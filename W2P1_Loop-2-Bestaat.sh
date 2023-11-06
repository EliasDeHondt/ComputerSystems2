#!/bin/bash
######################
# Van Elias De Hondt #
######################
commando="/bin/df"


# Controleer of het bestand /bin/df bestaat
if [ ! -e "$commando" ]; then
 echo "$commando bestaat niet"
 exit 1
fi

# Controleer of /bin/df leesbaar en uitvoerbaar is (r en x)
if [ ! -r "$commando" ] || [ ! -x "$commando" ]; then
 echo "$commando is niet uitvoerbaar"
 exit 2
fi

# Voer /bin/df -h uit
$commando -h