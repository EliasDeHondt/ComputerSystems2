#!/bin/sh
######################
# Van Elias De Hondt #
######################


# 
show_notes() {
    echo "----- Your Notes -----"
    cat notes.txt
    echo "----------------------"
}

# 
add_note() {
    echo "$1" >> notes.txt
    echo "Note added: '$1'"
}

# 
clear_notes() {
    > notes.txt
    echo "All notes cleared!"
}

# 
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

# 
sleep infinity