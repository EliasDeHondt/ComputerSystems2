#!/bin/bash
######################
# Van Elias De Hondt #
######################
# Functie: Additional Additional :)


####################################################################################################
############################################### INFO ###############################################
####################################################################################################

# Possible comment -> (FYI: This part of the code doesn't work)
# Exit code 0: This indicates that the command or script was executed successfully without errors.
# Exit code 1-127: This indicates that problems occurred during execution.
# Exit code 128+: This indicates that the command or script has been terminated by a signal.
# For example, 130 is often used when a script is interrupted by Ctrl+C (SIGINT).

# echo "Exit code: $?" # This displays the exit code of the last command executed


# Here are some common options of the wc command:
# wc file.txt # This shows the number of lines (row), words and bytes in the file
# wc -l file.txt # This displays the number of lines (row) in the file
# wc -w file.txt # This displays the number of words in the file
# wc -c file.txt # This displays the number of bytes in the file
# wc -m file.txt # This displays the number of characters in the file
# wc -L file.txt # This returns the length of the longest line in the file
# wc /etc/passwd /var/log/ssh-tool.log /var/log/email-tool.log # This displays the number of lines (row), words and bytes in each file

####################################################################################################
######################################## Parameter expansion #######################################
####################################################################################################

name="John" # Toewijzing van een variabele
echo $name # Variabele weergeven
echo ${#name} # Lengte van de variabele


## Substring van een variabele
greeting="Good morning" # Substring van een variabele
echo ${greeting:5}   # Resultaat: morning
echo ${greeting:0:4} # Resultaat: Good

echo ${age:-30} # Als de variabele niet bestaat, gebruik dan de standaardwaarde

## Vervang een deel van de variabele
sentence="I love apples, I love oranges" 
echo ${sentence/love/like}  # Resultaat: I like apples, I love oranges
echo ${sentence//love/like} # Resultaat: I like apples, I like oranges


## Verwijder patroon van begin van variabele
filename="mydocument.pdf"
echo ${filename%.pdf}  # Resultaat: mydocument
# Of
echo ${filename%.*}   # Resultaat: mydocument

## Array van variabelen
my_array=(apple orange banana)

# Toegang tot individuele elementen
echo ${my_array[0]}  # Resultaat: apple
echo ${my_array[@]}  # Resultaat: apple orange banana

# Aantal elementen in de array
echo ${#my_array[@]}  # Resultaat: 3



echo $$ # Huidig proces-ID
echo $? # Laatst uitgevoerde commando's afsluitstatus
echo $# # Aantal argumenten dat aan het script is doorgegeven


# Indirecte verwijzing naar variabele
fruit="apple"
apple="sweet"
var="fruit"
echo ${!var}  # Resultaat: sweet

# Patroonvergelijking aan het begin van een string
string="stackoverflow"
echo ${string#stack}  # Resultaat: overflow

# Patroonvergelijking aan het einde van een string
echo ${string%flow}   # Resultaat: stackover

####################################################################################################
########## Examples of simple functions that can be used in other scripts (see below) ##############
####################################################################################################

read_file() { # Function: to read a file
    if [ -f "$1" ]; then
        cat "$1"
    else
        echo "File does not exist."
    fi
}
# read_file "/var/log/ssh-tool.log"


sort_file() { # Function: to sort a file
    if [ -f "$1" ]; then
        sort "$1"
    else
        echo "File does not exist."
    fi
}
# sort_file "/var/log/ssh-tool.log"


search_text() { # Function: to search for a specific text in a file
    if [ -f "$1" ]; then
        egrep -o "$2" "$1"
    else
        echo "File does not exist."
    fi
}
# search_text "/etc/passwd" "Elias De Hondt"


show_lines() { # Function: to show a specific number of lines from a file
    if [ -f "$1" ]; then
        head -n "$2" "$1"
    else
        echo "File does not exist."
    fi
}
# show_lines "/etc/passwd" 10


file_info() { # Function: to show information about a file
    if [ -f "$1" ]; then
        file "$1"
    else
        echo "File does not exist."
    fi
}
# file_info "/etc/passwd"

calculate_file_size() { # Function: to calculate the size of a file
    if [ -e "$1" ]; then
        du -sh "$1"
    else
        echo "File/directory does not exist."
    fi
}
# calculate_file_size "/etc/passwd"


backup_file() { # Function: to make a back-up of a file
    if [ -f "$1" ]; then
        cp "$1" "$1.backup"
        echo "Back-up gemaakt als $1.backup"
    else
        echo "Bestand bestaat niet."
    fi
}
# backup_file "/etc/passwd"


fetch_website_data() { # Function: to fetch data from a website
    if [ -n "$1" ]; then
        curl -s "$1"
    else
        echo "Geef een geldige URL op."
    fi
}
# fetch_website_data "https://eliasdh.com"

####################################################################################################
###################### Examples of more complex functions (see below) ##############################
####################################################################################################

function extract_specific_row() { # Function: to copy a specific row from a file
    file="$1"
    row_number="$2"

    if [ -f "$file" ]; then # Verify that the specified file exists

        # Get the row corresponding to the specified row number
        row_content=$(sed -n "${row_number}p" "$file")

        if [ -n "$row_content" ]; then
            echo "Row ${row_number} from $file -> $row_content"
        else
            echo "Invalid row number provided."
        fi
    else
        echo "File does not exist."
    fi
}
# filename="/var/log/ssh-tool.log"
# row=3
# extract_specific_row "$filename" "$row"


function extract_specific_column() { # Function: to copy a specific column from a file
    file="$1"
    column_number="$2"

    if [ -f "$file" ]; then # Check if the specified file exists

        # Get the column corresponding to the specified column number
        column_content=$(awk -v col="$column_number" '{print $col}' "$file")

        if [ -n "$column_content" ]; then
            echo -e "Column ${column_number} from $file -> \n$column_content"
        else
            echo "Invalid column number provided."
        fi
    else
        echo "File does not exist."
    fi
}
# Columns separated by spaces or tabs!!!
# filename="/var/log/ssh-tool.log"
# column=7
# extract_specific_column "$filename" "$column"


function extract_substring_between_delimiters() { # Function: to retrieve a substring between two delimiters
    file="$1"
    left="$2"
    right="$3"

    if [ -f "$file" ]; then # Check if the specified file exists

        # Retrieve substring between the specified delimiters for each row in the file
        while IFS= read -r row; do
            # Use grep and sed to extract the substring between the delimiters
            substring=$(echo "$row" | grep -o "\\$left.*$right" | sed -e "s/\\$left//;s/$right//")

            if [ -n "$substring" ]; then
                echo "Substring between $left and $right -> $substring"
            fi
        done < "$file"
    else
        echo "File does not exist."
    fi
}

# filename="/etc/passwd"
# left=":"
# right=":"
# extract_substring_between_delimiters "$filename" "$left" "$right"


function extract_specific_column_and_row() { # Function: to copy a specific column from a specific row in a file
    file="$1"
    start="$2"
    end="$3"
    column_number="$4"
    row_number="$5"

    if [ -f "$file" ]; then # Check if the specified file exists

        # Get the specific column between the specified start and end positions for the specified row
        row_content=$(sed -n "${row_number}p" "$file")

        if [ -n "$row_content" ]; then
            # If the row content is not empty, use awk to retrieve the specific column
            column_content=$(echo "$row_content" | awk -v start="$start" -v end="$end" -v col="$column_number" -F "$start" -v OFS="$end" '{print $col}')

            if [ -n "$column_content" ]; then
                echo "Column ${column_number} from row ${row_number} in $file starting from $start and ending at $end -> $column_content"
            else
                echo "Invalid column number provided."
            fi
        else
            echo "Invalid row number provided."
        fi
    else
        echo "File does not exist."
    fi
}

# file_name="/etc/passwd"
# start_delimiter=":"
# end_delimiter=":"
# column=5
# row=45
# extract_specific_column_and_row "$file_name" "$start_delimiter" "$end_delimiter" "$column" "$row"

function extract_specific_line() { # Function: to copy a specific line from a file
    file="$1"
    line_number="$2"

    if [ -f "$file" ]; then # Check if the specified file exists

        # Get the line corresponding to the specified line number
        line_content=$(sed -n "${line_number}p" "$file")

        if [ -n "$line_content" ]; then
            echo "Line ${line_number} from $file -> $line_content"
        else
            echo "Invalid line number provided."
        fi
    else
        echo "File does not exist."
    fi
}
# extract_specific_line "/etc/passwd" 3

####################################################################################################
############################################# EXAMPLES #############################################
####################################################################################################

# Example 1: Switch case in bash in a function

function switch_case() { # Function: to show the use of a switch case in bash
    case "$1" in
        "1")
            echo "You chose option 1"
            ;;
        "2")
            echo "You chose option 2"
            ;;
        "3")
            echo "You chose option 3"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
}
# switch_case 1

# Example 2: For loop in bash in a function
function for_loop() { # Function: to show the use of a for loop in bash
    for i in {1..10}; do # Loop from 1 to 10
        echo "$i"
    done
}
# for_loop

# Example 3: For loop in bash in a function (arguments)
for_loop() {
    for ((i = $1; i <= $2; i++)); do
        echo "$i"
    done
}
# for_loop 1 10

# Example 4: While loop in bash in a function
function while_loop() { # Function: to show the use of a while loop in bash
    i=1
    while [ $i -le 10 ]; do # Loop from 1 to 10
        echo "$i"
        ((i++))
    done
}
# while_loop

# Example 5: While loop in bash in a function (arguments)
while_loop() {
    i=$1
    while [ $i -le $2 ]; do
        echo "$i"
        ((i++))
    done
}
# while_loop 1 10

# Example 6: Until loop in bash in a function
function until_loop() { # Function: to show the use of an until loop in bash
    i=1
    until [ $i -gt 10 ]; do # Loop from 1 to 10
        echo "$i"
        ((i++))
    done
}
# until_loop

# Example 7: Until loop in bash in a function (arguments)
until_loop() {
    i=$1
    until [ $i -gt $2 ]; do
        echo "$i"
        ((i++))
    done
}
# until_loop 1 10

# Example 8: If statement in bash in a function
function if_statement() { # Function: to show the use of an if statement in bash
    if [ "$1" -gt "$2" ]; then
        echo "$1 is greater than $2"
    elif [ "$1" -lt "$2" ]; then
        echo "$1 is less than $2"
    else
        echo "$1 is equal to $2"
    fi
}
# if_statement 1 2


# Example 9: If statement in bash in a function (arguments) (alternative)
function if_statement() {
    if (( $1 > $2 )); then
        echo "$1 is greater than $2"
    elif (( $1 < $2 )); then
        echo "$1 is less than $2"
    else
        echo "$1 is equal to $2"
    fi
}
# if_statement 1 2