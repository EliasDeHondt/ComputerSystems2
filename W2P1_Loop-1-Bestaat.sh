#!/bin/bash
######################
# Van Elias De Hondt #
######################
commando="/bin/df"


if [ -x "$commando" ]; then
 $commando -h
else
 echo "Het bestand $commando is niet uitvoerbaar" >&2
fi