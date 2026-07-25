# La piste Riff

## Présentaiton 

La piste Riff est explicité dans le chapitre [Riff](#Riff)

## La piste Walk

Le  Modèle  `Walk` pour Walking Bass est définie comme suit :


Exemple :
~~~mma
Walk Define Nom Position Duration Volume ; ...
~~~

Les pistes de basse d'une Walk sont jouées de haut en bas sur la première
partie d'une gamme, en accordant une attention particulière à la «couleur»
de l'accord.
Les lignes de Walking bass sont très courantes dans le jazz et la musique
swing. Elles apparaissent assez souvent comme une mesure «d'emphase» dans
les marches.

Chaque groupe comprend un décalage de temps, la durée de la note et le volume
de la note.

MMA sélectionne le "pitch" (la hauteur) de la note courante pour la jouer en
fonction de l'accord actuel et on  ne peut pas changer ce comportement.

Exemple de piste Walk :

~~~mma
Walk Define Walk4 1 4 100; \
    				2 4 90; \
    				3 4 90
~~~

Cet exemple joue une note basse sur les temps 1, 2 et 3 d'une mesure en 3/4 temps.


## Exemples 


