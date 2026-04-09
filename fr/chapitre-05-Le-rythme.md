# Le rythme 


## Présentation 


Le rythme détermine quand les notes et les accords sont joués dans la mesure. Dans MMA, il dépend principalement de trois éléments:

- la signature rythmique (TIME)
- les positions dans la mesure (1, 2, 3, etc.)
- les Sequence qui indiquent quand les notes commencent et combien de temps elles durent.

## La mesure et TIME

La directive TIME fixe le nombre de temps par mesure.


Exemples  : 


- Mesure à 4 temps (4/4), la plus courante dans la quelle les temps sont  1,2,3 et 4

~~~mma
TIME 4
~~~

- Mesure à 3 temps (3/4), par exemple pour une valse dans la quelle les temps sont 1, 2 et 3


~~~mma
TIME 3
~~~

- Mesure à 6 temps (6/8 ou 6/4 selon le contexte) dans la quelle les temps sont 1,2,3,4,5 et 6


~~~mma
TIME 6
~~~



## Les positions dans la mesure 

Dans MMA, les positions sont numérotées à partir de 1.
Chord Sequence {
    1 1 100
    2 1 100
    3 1 100
    4 1 100
}

Cela signifie :

- jouer quelque chose au temps 1
- puis au temps 2
- puis au temps 3
- puis au temps 4

Chaque événement dure ici 1 temps.


## Durée des notes et des accords

Dans une Sequence, le deuxième nombre est la durée.

Par exemple1 1,2,120 signifie :
- on commence au temps 1 
- la durée de la note est de 2 temps
- la vélocité est de 120

Dans une mesure à 4 temps, cela correspond à deux temps.


## Blanche puis deux noires

Voici un rythme fréquent dans une mesure 4/4 :
- un accord pendant 2 temps
- puis deux accords d'un temps chacun


~~~mma
Define HalfThenTwoQuartersSequence {
    1 2 120;
    3 1 100;
    4 1 100;
}


Chord Sequence HalfThenTwoQuartersSequence
~~~

Avec les accords :

1 C
2 F
3 G

on obtient :


| Temps	| Accord |
|:-----:|:------:|
|1-3|C|
|3-4|F|
|4-5|G|

## Deux accords sur une demi-mesure

Lorsque l'on écrit :

~~~mma
2 D C
~~~

cela ne signifie pas que D et C sont joués en même temps.

Cela signifie que, à partir du temps 2, la séquence doit utiliser successivement les accords D puis C.

Par exemple, avec :

~~~mma
Chord Sequence {
    2 0.5 100
    2.5 0.5 100
}
~~~

et :

~~~mma
2 D C
~~~

on obtient :

Temps	Accord
2-2.5	D
2.5-3	C

Les deux accords occupent donc chacun une demi-noire dans la deuxième moitié du temps 2.

## Les croches

On peut utiliser des positions fractionnaires.

~~~mma
Chord Sequence {
    1   0.5 100
    1.5 0.5 100
    2   0.5 100
    2.5 0.5 100
}
~~~

Cela crée quatre croches.



|Début|Durée|
|:---:|:---:|
| 1   |	0.5 |
| 1.5 |	0.5 |
| 2	  | 0.5 |
| 2.5 |	0.5 |


## Exemple de rythme de valse

~~~mma
TIME 3


Chord Sequence {
    1 1 120
    2 1 90
    3 1 90
}
~~~

Ce rythme joue un accent au premier temps puis deux temps plus légers.

# Le rôle de la vélocité

Le troisième nombre dans une Sequence est la vélocité.

~~~mma
1 1 120
2 1 80
3 1 80
4 1 80
~~~

Le premier temps sera plus fort que les autres.

Cela permet de créer des accents rythmiques.

## Réutiliser une séquence


Une séquence définie avec Define peut être réutilisée plusieurs fois.

~~~mma
Define WaltzSequence {
    1 1 120;
    2 1 80;
    3 1 80
}


Chord Sequence WaltzSequence
Bass Sequence WaltzSequence

~~~

La même structure rythmique est utilisée pour les accords et la basse.

## Résumé

- TIME définit le nombre de temps dans la mesure.
- Sequence définit quand commence chaque événement et combien de temps il dure.
- Le premier nombre est la position dans la mesure.
- Le deuxième nombre est la durée.
- Le troisième nombre est la vélocité.
- Les positions peuvent être fractionnaires (1.5, 2.5, etc.).
- Une ligne comme 2 D C utilise successivement deux accords à partir du temps 2.
- Les séquences peuvent être nommées avec Define puis réutilisées.

