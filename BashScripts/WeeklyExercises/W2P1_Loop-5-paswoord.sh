#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
paswoord="supersecret"


read -s -p "Paswoord: " mogelijkpaswoord
echo ""

if [ $paswoord = $mogelijkpaswoord ] 2> /dev/null; then
 echo "Toegelaten"
else echo "VERBODEN!"