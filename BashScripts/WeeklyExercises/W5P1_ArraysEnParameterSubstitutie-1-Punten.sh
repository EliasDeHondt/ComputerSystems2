#!/bin/bash
############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Punten inlezen en hierop acties uitvoeren
reset='\e[0m'
rood='\e[0;31m'


function error_exit() {
  echo -e "Error: ${rood}$1${reset}"
  exit 1
}

declare -A student_scores  # Associatieve array om scores op te slaan
max_score=0
min_score=20

while true; do
  read -p "Naam Student (of 'x' om te stoppen): " naamStudent

  if [ "$naamStudent" == "x" ]; then
    break
  fi

  if [ -z "$naamStudent" ]; then
    error_exit "Naam Student is NULL"
  fi

  read -p "Score voor $naamStudent (tussen 0 en 20): " score

  if ! [[ "$score" =~ ^[0-9]+$ ]]; then
    error_exit "Ongeldige score: $score is geen getal."
  fi

  if ((score < 0 || score > 20)); then
    error_exit "Ongeldige score: $score moet tussen 0 en 20 liggen."
  fi

  # Voeg de score toe aan de associatieve array
  student_scores["$naamStudent"]=$score

    # Controleer of het de hoogste of laagste score is
  if ((score > max_score)); then
    max_score=$score
    max_student=$naamStudent
  fi

  if ((score < min_score)); then
    min_score=$score
    min_student=$naamStudent
  fi
done

# Bereken het gemiddelde van alle scores
total_score=0
num_students=0

for student in "${!student_scores[@]}"; do
  score="${student_scores[$student]}"
  total_score=$((total_score + score))
  num_students=$((num_students + 1))
done

if ((num_students > 0)); then
  average_score=$(bc -l <<< "scale=1; $total_score / $num_students")
else
  average_score=0
fi

# Toon resultaten
echo "Gemiddelde score van alle studenten: $average_score"
echo "Hoogste score: $max_student met score $max_score"
echo "Laagste score: $min_student met score $min_score"