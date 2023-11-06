#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Weergeven programma's die vanuit sbin zijn opgestart.
# De gegevens van alle programma's staan in de directory /proc/PID/cmdline.
# (met PID= nummer van het proces)


# Overloop alle cmdline bestanden op het systeem
for cmdline_file in /proc/*/cmdline; do
    # Kijk na of het bestand bestaat
    if [ -e "$cmdline_file" ]; then
        # Lees de inhoud van het bestand en verwijder null-terminators
        cmdline=$(cat "$cmdline_file" | tr -d '\0')

        # Kijk na of de inhoud niet leeg is
        if [ -n "$cmdline" ]; then
            # Kijk na of de inhoud "sbin" bevat
            if [[ "$cmdline" == *"/sbin"* ]]; then
                echo "$cmdline_file: $cmdline"
            fi
        fi
    fi
done