#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Afteller
top=60
bottom=0
iteratie=1


# Een while loop die de afteller laat lopen van 60 tot 0
while [ $top -ge $bottom ]; do
    # \r = carriage return (cursor terug naar begin van de lijn)
    echo -ne "\r$top"
    # $(( )) = rekenkundige bewerking
    let "top=$top-$iteratie"
    # sleep 1 = 1 seconde wachten
    sleep 1
done

echo -ne "\r"
echo "Tijd is verstreken!"