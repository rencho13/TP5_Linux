#!/bin/bash

statLettre() 
{
echo `touch stat`

for L in {A..Z}; do
	echo "`grep -c $L $1` - $L " >> stat
done
}

# Message d'aide qui s'affiche dans le cas d'une erreur
messageAide='USAGE : langstat [FILE] [OPTION]\n OPTION = vide , tri décroissant \n OPTION = -d , tri croissant'

if [ $# = "0" ]; then # Test si il y a kkchose de saisi en paramètre
	echo "ERREUR : Il n'y pas de fichier en paramètre"
	echo -e $messageAide
	exit
elif [ $2 != "-d" ]; then # Test si le second paramètre passé en valide 
	echo "ERREUR : Le second paramètre n'est pas bon "
	echo -e $messageAide
	exit
elif [ ! -f $1 ]; then # Test si le fichier passé en paramètre existe
	echo "ERREUR : Le fichier n'existe pas "
	echo -e $messageAide
	exit
elif [ "$2" = "-d" ]; then
	statLettre $1 $2
	sort -n stat | less
	rm -f stat
else
	statLettre $1 $2 
    	sort -nr stat | less
	rm -f stat
fi
