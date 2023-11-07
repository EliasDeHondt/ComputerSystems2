#!/bin/bash
######################
# Van Elias De Hondt #
######################
# FUNCTIE: Omzetten van ip adressen naar namen
inputfile="ips.txt"


echo "1.1.1.1" > $inputfile
echo "109.74.196.225" >> $inputfile
echo "91.189.90.40" >> $inputfile
echo "173.194.34.168" >> $inputfile

IFS=$'\n'

function fun_nslookup() {
  nslookup $1 >> temp.txt

  result=$(awk -F '= ' '/name =/ {print $2}' temp.txt)
}

for lijn in `cat $inputfile`; do
  fun_nslookup $lijn

  echo "$lijn = $result"
  rm temp.txt
done

rm ips.txt