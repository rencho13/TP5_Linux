#!/bin/bash

# Langstat : script Bash qui fournit des statistiques sur l'utilisation des lettres dans un fichier dictionnaire

# Fonction pour compter les lettres dans le fichier dico $1 -------------------------
statLettre()
	{
echo `touch stat` # Création d'un fichier temp stat

for L in {A..Z}; do # boucle sur toute les lettres de A à Z 
	echo "`grep -c $L $1` - $L " >> stat # grep sur le fichier avec L en paramètre
done
	}

# Message d'aide qui s'affiche dans le cas d'une erreur------------------------------
messageAide='USAGE : langstat [FILE] [OPTION]\n OPTION = vide , tri décroissant \n OPTION = -d , tri croissant'

# Début du Script -------------------------------------------------------------------
if [ $# = "0" ]; then # Test si il y a kkchose de saisi en paramètre
	echo "ERREUR : Il n'y pas de fichier en paramètre"
	echo -e $messageAide
	exit
elif [ ! -f $1 ]; then # Test si le fichier est un fichier 
	echo "ERREUR : Le fichier passé en paramètre n'est pas un fichier "
	echo -e $messageAide
	exit
elif [ ! -e $1 ]; then # Test si le fichier passé en paramètre existe
	echo "ERREUR : Le fichier n'existe pas "
	echo -e $messageAide
	exit
elif [ "$2" = "-d" ]; then # MISSION 2 : Test du 2nd paramètre pour trier de manière croissante
	statLettre $1 $2 # Appel de la fonction avec les 2 paramètres
	sort -n stat | less # affichage du fichier temporaire stat page par page
	rm -f stat 
else
	statLettre $1 $2 
    	sort -nr stat | less
	rm -f stat # On efface le fichier temp
fi
