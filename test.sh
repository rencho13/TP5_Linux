#!/bin/bash

if [ -z $1 ]; then
	echo "Paramtre manquant ( tapez --help )"
	exit
fi

if [ ! -f $1 ]; then
	echo "Le fichier n'existe pas"
	exit
fi

if [ $1 = "--help" ];then
	echo "USAGE: langstat [FILE]..[OPTION]"
	echo " OPTION =  "
	exit 
fi

echo "le nom du fichier est $1 "

