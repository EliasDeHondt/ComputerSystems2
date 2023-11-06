#!/bin/bash
######################
# Van Elias De Hondt #
######################


if [[ $string =~ ^[0-9]+$ ]]; then
    echo "Dit is een getal."
fi

if [[ $string =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
    echo "Dit is een geldig e-mailadres."
fi

if [[ $string =~ ^(http|https)://[A-Za-z0-9.-/]+$ ]]; then
    echo "Dit is een geldige URL."
fi

if [[ $string =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Dit is een IP-adres."
fi

if [[ $string =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Dit is een geldige datum."
fi

if [[ $string =~ ^[A-Z][a-z]*$ ]]; then
    echo "Dit is een woord dat begint met een hoofdletter."
fi

if [[ $string =~ ^[1-9][0-9]{3}\s?[A-Z]{2}$ ]]; then
    echo "Dit is een Nederlandse postcode."
fi

if [[ $string =~ ^\([0-9]{3}\) [0-9]{3}-[0-9]{4}$ ]]; then
    echo "Dit is een Amerikaans telefoonnummer."
fi

if [[ $string =~ ^[0-9A-Fa-f]+$ ]]; then
    echo "Dit is een hexadecimaal getal."
fi

if [[ $string =~ ^.*ing$ ]]; then
    echo "Dit is een woord dat eindigt op 'ing'."
fi

if [[ $string =~ ^[Aa][Uu][Tt][Oo].* ]]; then
    echo "Dit woord begint met 'auto' (niet hoofdlettergevoelig)."
fi

if [[ $string =~ ^[A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][A-Z]{2}$ ]]; then
    echo "Dit is een Britse postcode."
fi

if [[ $string =~ ^[0-2][0-9]:[0-5][0-9]:[0-5][0-9]$ ]]; then
    echo "Dit is een geldige tijdstempel."
fi

if [[ $string =~ ^.*logy$ ]]; then
    echo "Dit is een woord dat eindigt op 'logy'."
fi

if [[ $string =~ ^[0-9]+(\.[0-9]{1,2})?$ ]]; then
    echo "Dit is een decimaal getal met optionele komma's."
fi

if [[ $string =~ ^[0-1][0-9]/[0-3][0-9]/[0-9]{4}$ ]]; then
    echo "Dit is een Amerikaanse datum in het formaat MM/DD/YYYY."
fi
