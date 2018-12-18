#!/bin/bash

if [ -z $1 ]; then # Test la présence d'un paramètre
	echo "Erreur : il n'y a pas de fichier en paramètre"
	exit
fi

touch stat

for L in {A..Z}; do
	echo "`grep -c $L $1` - $L " >> stat  # nombre d'occurence de chaque lettre dans le fichier
done

sort -nr stat

rm -f stat
