############################
# @author Elias De Hondt   #
# @see https://eliasdh.com #
# @since 01/03/2024        #
############################
# FUNCTIE: Wachten aangenamer maken


function text_beamer() {
  local input_text="$1"
  local repetitions="$2"

  for ((i = 0; i < repetitions; i++)); do
    for ((j = 1; j <= ${#input_text}; j++)); do
      echo -ne "${input_text:0:j}" | tr '[:upper:]' '[:lower:]'
      sleep 0.1
      echo -ne "\r"
    done

    for ((j = ${#input_text}; j >= 1; j--)); do
      echo -ne "${input_text:0:j}" | tr '[:lower:]' '[:upper:]'
      sleep 0.1
      echo -ne "\r"
    done
  done
  echo -e "\n"
}

# Controleer of er voldoende argumenten zijn meegegeven
if [ "$#" -lt 2 ]; then
  echo "Gebruik: $0 'TEKST' HERHALINGEN"
  exit 1
fi

input_text="$1"
repetitions="$2"

text_beamer "$input_text" "$repetitions"