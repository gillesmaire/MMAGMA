# Le rythme 


## Présentation 


Le rythme détermine quand les notes et les accords sont joués dans la mesure. Dans MMA, il dépend principalement de trois éléments :

- la signature rythmique (TIME)
- les positions dans la mesure (1, 2, 3, etc.)
- les Sequence qui indiquent quand les notes commencent et combien de temps elles durent.

## La mesure et TIME

La directive TIME fixe le nombre de temps par mesure.


Exemples  : 


- Mesure à 4 temps (4/4), la plus courante dans la quelle les temps sont  1,2,3 et4

~~~mma
TIME 4
~~~

- Mesure à 3 temps (3/4), par exemple pour une valse dans la quelle les temps sont 1, 2 et 3


~~~mma
TIME 3
~~~

- Mesure à 6 temps (6/8 ou 6/4 selon le contexte) dans la quelle les temps sont 1,2,3,4,5,6


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

    jouer quelque chose au temps 1

    puis au temps 2

    puis au temps 3

    puis au temps 4

Chaque événement dure ici 1 temps.


## Durée des notes et des accords

