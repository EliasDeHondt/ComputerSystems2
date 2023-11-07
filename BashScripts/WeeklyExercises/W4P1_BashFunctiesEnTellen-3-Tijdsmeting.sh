#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Gebruik van de functie date als timer


# Starttijd met nanoseconden
start=$(date +'%s%N')

# Voer het gewenste commando uit
zenity --warning --title "Hallo" --text "$(date)"
echo

# Eindtijd met nanoseconden
end=$(date +'%s%N')

# Bereken het verschil in nanoseconden
nanosec_diff=$((end - start))

# Bereken milliseconden en seconden
millisec_diff=$((nanosec_diff / 1000000))
sec_diff=$((nanosec_diff / 1000000000))

# Toon de resultaten
echo "Tijd in nanoseconden: $nanosec_diff ns"
echo "Tijd in milliseconden: $millisec_diff ms"
echo "Tijd in seconden: $sec_diff s"

# uren > Minuten > Seconden > Milliseconden > Nanoseconden