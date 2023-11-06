#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Aanduiden geolocatie op kaart
reset='\e[0m'
rood='\e[0;31m'
mapWidth=2058; # Breedte geolocate.jpg
mapHeight=1746; # Hoogte geolocate.jpg
pi=3.14159265
locationtag=4


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

# Controleer of het script wordt uitgevoerd met een eerste argument
if [ ! -n "$1" ]; then
  error_exit "Opstarten moet met een eerste argument"
fi

# Voer het geoiplookup-commando uit met het opgegeven IP-adres of domeinnaam als argument
output=$(geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat "$1")

# Controleer of er gegevens zijn opgehaald
if [ -z "$output" ]; then
  error_exit "Geen gegevens gevonden voor het opgegeven IP-adres of domeinnaam"
fi

# Gebruik grep om de latitude en longitude uit de output te halen
latitude=$(echo "$output" | grep -oE '[-]?[0-9]+\.[0-9]+' | head -n1)
longitude=$(echo "$output" | grep -oE '[-]?[0-9]+\.[0-9]+' | tail -n1)

# Controleer of latitude en longitude geldige waarden hebben
if [ -z "$latitude" ] || [ -z "$longitude" ]; then
  error_exit "Ongeldige latitude of longitude waarden gevonden in de output"
fi

# Toon de resultaten
echo "Latitude: $latitude"
echo "Longitude: $longitude"

# Bereken mercator x coordinaat op de map
x=`echo "scale=4;($longitude+180)*($mapWidth/360)" | bc`

# Omzetting graden naar radialen
latRad=`echo "scale=4;$latitude*$pi/180"| bc;`

# Bereken mercator y coordinaat op de map
mercN=`echo "scale=4;l(s(($pi/4)+($latRad/2))/c(($pi/4)+($latRad/2)))" | bc -l`
y=`echo "scale=4;($mapHeight/2)-($mapWidth*$mercN/(2*$pi))"|bc`

ycircle=`echo "scale=4;$y+$locationtag" | bc`

convert -page ${mapWidth}x${mapHeight} geolocate.jpg -fill red -draw "circle ${x},${y} ${x},${ycircle}" -layers flatten geolocatenew.jpg