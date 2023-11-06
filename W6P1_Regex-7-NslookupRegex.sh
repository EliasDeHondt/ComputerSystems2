#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Omzetten van ip adressen naar namen + regex
inputfile="ips.txt"


echo "1.1.1.1" > $inputfile
echo "109.74.196.225" >> $inputfile
echo "91.189.90.40" >> $inputfile
echo "173.194.34.168" >> $inputfile

IFS=$'\n'

function fun_nslookup() {
  result=$(nslookup $1 | grep -E -o "=\s.{1,}" | grep -E -o "\s.{1,}")
}

for lijn in `cat $inputfile`; do
  fun_nslookup $lijn

  echo "$lijn =$result"
done

rm ips.txt