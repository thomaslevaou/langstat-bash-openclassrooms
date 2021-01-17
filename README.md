# TP des statistiques sur une liste de mots, du cours en ligne OpenClassrooms

TP des statistiques sur une liste de mots, réalisé dans le cadre de la formation
sur Linux et le shell proposée par le site OpenClassrooms, à l'adresse suivante :
https://openclassrooms.com/fr/courses/43538-reprenez-le-controle-a-laide-de-linux

Ce projet consiste à réaliser des statistiques sur la liste de mots présente dans
le fichier dico.txt. L'exécution de ce programme permet notamment d'obtenir :
1. Pour chaque lettre, le nombre de mots du fichier .txt qui la contient, par ordre
décroissant du nombre de mots, comme sur le résultat ci-dessous (exécution par défaut):
```
278814 - E
229938 - A
219131 - I
210391 - R
...
```

2. Idem, mais par ordre croissant (via le paramètre `--tricroissant`):
```
529 - W
1595 - K
5743 - J
8262 - X
...
```

2. Idem, mais dans l'ordre alphabétique de chaque lettre (via le paramètre --triparlettres):
```
A - 229938
B - 43471
C - 98832
D - 72481
E - 278814
...
```

3. Le nombre moyen de mots du fichier dans lequel apparaît chaque lettre (via le paramètre --moyenne):
```
Chaque lettre apparaît en moyenne dans 94737 mots du fichier.
```

4. Le pourcentage des mots du dictionnaire dans lequel chaque lettre apparaît (via le paramètre --pourcentage):
```
86% - E
71% - A
67% - I
65% - R
64% - S
...
```

Une fois cloné, ce projet peut être exécuté en entrant les commandes suivantes à la racine:
```bash
chmod 700 langstat.sh
./langstat.sh dico.txt
./langstat.sh dico.txt --tricroissant
./langstat.sh dico.txt --triparlettres
./langstat.sh dico.txt --moyenne
./langstat.sh dico.txt --pourcentage
```
