#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
commando="/bin/df"


if [ -x "$commando" ]; then
 $commando -h
else
 echo "Het bestand $commando is niet uitvoerbaar" >&2
fi