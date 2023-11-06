#!/bin/bash
######################
# Van Elias De Hondt #
######################
paswoord="supersecret"


read -s -p "Paswoord: " mogelijkpaswoord
echo ""

if [ $paswoord = $mogelijkpaswoord ] 2> /dev/null; then
 echo "Toegelaten"
else echo "VERBODEN!"