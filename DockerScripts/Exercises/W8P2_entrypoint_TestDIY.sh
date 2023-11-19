#!/bin/sh
######################
# Van Elias De Hondt #
######################


# Functie voor het weergeven van notities
show_notes() {
    echo "----- Your Notes -----"
    cat notes.txt
    echo "----------------------"
}

# Functie voor het toevoegen van een nieuwe notitie
add_note() {
    echo "$1" >> notes.txt
    echo "Note added: '$1'"
}

# Functie voor het wissen van alle notities
clear_notes() {
    > notes.txt
    echo "All notes cleared!"
}

# Uitvoeren van opgegeven commando's
case "$1" in
    show)
        show_notes
        ;;
    add)
        shift
        add_note "$*"
        ;;
    clear)
        clear_notes
        ;;
    *)
        echo "Usage: $0 {show|add|clear}"
        exit 1
esac

# Houd de container actief door een slaapopdracht uit te voeren
sleep infinity