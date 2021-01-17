# TP des statistiques sur une liste de mots, du cours en ligne OpenClassrooms

TP des statistiques sur une liste de mots, réalisé dans le cadre de la formation
sur Linux et le shell proposée par le site OpenClassrooms, à l'adresse suivante :
https://openclassrooms.com/fr/courses/43538-reprenez-le-controle-a-laide-de-linux

Ce projet consiste à réaliser des statistiques sur la liste de mots présente dans
le fichier dico.txt. P

Une fois cloné, ce projet peut être exécuté en entrant les commandes suivantes à la racine
```bash
chmod 700 langstat.sh
./langstat.sh dico.txt # Exécution par défaut, qui pour chaque lettre donne le nombre de mots la contenant, par ordre décroissant du nombre de mots
./langstat.sh dico.txt --tricroissant # Idem que la commande précédente, mais retourne les résultat par ordre croissant du nombre de mots
./langstat.sh dico.txt --moyenne # Indique le nombre moyen de mots du fichier dans lequel apparaît chaque lettre.
./langstat.sh dico.txt --pourcentage # Donne pour chaque lettre le pourcentage des mots du dictionnaire dans lequel elle apparaît
```
