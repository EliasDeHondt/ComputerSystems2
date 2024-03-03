#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Zoeken naar grote bestanden

# Check if $1 is --help
if [ $# -lt 1 -o "$1" = "--help" ]; then
  echo "Help Help :)"
  exit 1
fi

# Check if $1 is --version
if [ $1 = "--version" ]; then
  echo " $0 Version: 0.1"
  exit 1
fi

# Check if $1 is a directory
if [ ! -d "$1" ]; then
  path="\\"
else
  path=$1
fi

# Check if $2 is a number
if [ "$2" -eq "$2" ] 2>/dev/null; then
  size=$2
else
  size=10
fi

find $path -type f -size "+${size}M" -exec stat -c '%s %n' {} \;