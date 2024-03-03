#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Streams redirection bekijken

# Beantwoord volgende vragen.
# Schrijf eerst het antwoord zonder het uit te voeren op een computer.
# Kijk vervolgens na of jouw interpretatie correct is.

echo "A" >&1
echo "B" >&2
echo "C" 2>&1
echo "D" 1>&2
echo "Hello World"

# a) Wat is de output bij gewoon uitvoeren van “stream.sh”?
# A, B, C, D, Hello World

# b) Wat is de output bij “streams.sh 1>tekst.txt”?
# B, D

# Wat staat er in tekst.txt?
# A, C, Hello World

# c) Wat is de output bij “streams.sh 2>tekst.txt”?
# A, C, Hello World

# Wat staat er in tekst.txt?
# B, D

# d) Eigenlijk heeft deze lijn: echo "C" 2>&1 geen zin. Weet je waarom?
# De regel "echo "C" 2>&1" is overbodig omdat hetzelfde effect al eerder is bereikt met de regel "echo "C" 2>&1",
# waardoor zowel stdout als stderr naar dezelfde bestemming (stdout) worden omgeleid.

# e) Voeg de lijn “command -V tralala” toe. Voer b & c opnieuw uit. Begrijp je wat er gebeurd?
# De uitvoer van "command -V tralala" wordt naar stderr gestuurd, maar de stdout-omleiding naar "tekst.txt" geldt alleen voor de opdrachten
# die na deze omleiding komen. Daarom worden de uitvoer van "command -V tralala" en de oorspronkelijke stderr-uitvoer (B en D) op het scherm weergegeven.

# f) Voeg een lijn “command -V bash” toe. Voer b & c opnieuw uit. Begrijp je wat er gebeurd?
# De uitvoer van "command -V tralala" wordt naar stderr gestuurd, maar de stderr-omleiding naar "tekst.txt" geldt alleen voor de opdrachten
# die na deze omleiding komen. Daarom wordt de uitvoer van "command -V tralala" op het scherm weergegeven,
# maar de oorspronkelijke stderr-uitvoer (B en D) wordt omgeleid naar "tekst.txt".
# De oorspronkelijke stdout-uitvoer (A, C, Hello World) wordt nog steeds op het scherm weergegeven.

# Samengevat, het toevoegen van "command -V tralala" zorgt ervoor dat de uitvoer van deze opdracht
# wordt omgeleid volgens de huidige omleidingsinstellingen, maar de oorspronkelijke omleidingen blijven gelden voor de opdrachten die daarna komen.