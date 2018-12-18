#!/bin/bash

messageAide='USAGE : langstat [FILE] [OPTION]\n OPTION = vide , tri décroissant \n OPTION = -d , tri croissant \n OPTION [A-Z] Stat sur une lettre'

if [ $# = "0" ]; then 
	echo "fichier manquant en paramètre"
	echo -e $messageAide
	exit
elif [ -z $1 ]; then
	echo "Paramtre manquant "
	echo -e $messageAide
	exit
elif [ ! -f $1 ]; then
	echo "Le fichier n'existe pas"
	echo -e $messageAide
	exit
fi

statLettre() 
{
echo `touch stat`

for L in {A..Z}; do
	echo "`grep -c $L $1` - $L " >> stat
done
}


if [ "$2" = "-d" ]; then
	statLettre $1 $2
	sort -n stat | less
	rm -f stat
else
	statLettre $1 $2
    	sort -nr stat | less
	rm -f stat
fi
