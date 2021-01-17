#!/bin/bash

#Programme qui, pour chaque lettre de l'alphabet, donne le nombre de mots du fichier envoyé en paramètre utilisant au moins une fois cette lettre de l'alphabet.
#Le programme dispose aussi de 4 options pour afficher les données différemment ou fournir de nouvelles statistiques.


#Les 4 paramètres disponibles sont les suivants:
#"--tricroissant" affiche les résultats de la lettre a moins utilisée à la plus utilisée (ordre inverse de la fonction par défaut)
#"--triparlettres" affiche les résultats dans l'ordre alphabétique (d'abord le nombre de mots où A apparaît au moins une fois dans le fichier  dictionnaire, puis le nombre de B, puis de C, etc)
#"--moyenne" affiche le nombre moyen d'apparitions au moins une fois dans un mot d'une lettre de l'alphabet dans le fichier dictionnaire
#"--pourcentage" affiche le pourcentage de mots où chaque lettre apparaît au moins une fois par rapport à tous les mots du fichier dictionnaire

#Exemple d'utilisation : ./langstat.sh dico.txt --tricroissant

#Etude du second paramètre : si un parametre est reconnu, on active à true le booleen
#correspondant, ce qui permet de modifier l'action exécutée lors de l'analyse du fichier dictionnaire
CROISSANT=false
TRIPARLETTRES=false
MOYENNE=false
POURCENTAGE=false
case "$2" in
	--tricroissant)
	       	CROISSANT=true;
		;;
	--triparlettres)
		TRIPARLETTRES=true;
		;;
	--moyenne)
		MOYENNE=true;
		;;
	--pourcentage)
		POURCENTAGE=true;
		;;
	*)
		if [ ! -z $2 ]
		then
			echo "Le second paramètre n'a pas été reconnu. Le programme va ignorer celui-ci."
		fi
		;;
esac

#Etude du premier paramètre
#Vérification de la présence d'un fichier en paramètre
if [ -z $1 ]
then
	echo "Veuillez renseigner un fichier à analyser"
elif [ ! -f $1 ]
then
	echo "Le paramètre ne correspond pas a un fichier"
else
#Après avoir vérifié qu'un fichier est présent en paramètre, on prend chaque lettre
# de l'alphabet et on calcule les statistiques souhaitees en fonction du second paramètre
	if [ "$CROISSANT" = true ]
	then
		for i in {A..Z};
		do
			printf "%6s - %s\n" "$(grep -c $i $1)" "${i}";
		done | sort -n
	elif [ "$TRIPARLETTRES" = true ]
	then
		for i in {A..Z};
		do
			printf "%s - %s\n" "${i}" "$(grep -c $i $1)";
		done
	elif [ "$POURCENTAGE" = true ]
	then
		for i in {A..Z};
		do
			let "nbLignes = $(awk 'END {print NR}' $1)"
			let "freqLettre = $(grep -c $i $1)"
			let "pourcentLettre = ($freqLettre*100 / $nbLignes)"
			echo "$pourcentLettre% - ${i} "
		done | sort -rn
	elif [ "$MOYENNE" = true ]
	then
		let "compteurFrequence = 0"
		let "compteurLettres = 0"

		for i in {A..Z};
		do
			let "compteurLettres += 1"
			let "compteurFrequence += $(grep -c $i $1)"
		done
		let "compteurFrequence /= compteurLettres"
		echo "Chaque lettre apparaît en moyenne dans $compteurFrequence mots du fichier."
	else #cas ou il n'y a pas de second paramètre, ou si celui-ci ne correspond pas à un des quatre attendus
		for i in {A..Z};
		do
			printf "%6s - %s\n" "$(grep -c $i $1)" "${i}";
		done | sort -rn
	fi
fi
