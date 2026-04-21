# les boucles

## Les enjeux

Le chapitre sur les séquences explicite comment produire des répétitions de mesure à l'intérieur d'une piste. Ici nous allons utiliser un mécanisme qui permet de produire des répétitions
de plusieurs pistes à la fois.

En outre, si nous pourrions envisager de faire des copier coller des couplets et refrains, une modification d'une piste obligerait de faire des modifications dans toutes les séquences copiées.

Enfin cette présente documentation annnonçait un couplage possible avec le logiciel ChordV. 
Actuellement ChordV permet un export d'un couplet et refrain vers JJazzLab qui demande une
intervention humaine pour duppliquer les couplets refrains. 

Avec les boucles de MMA nous pouvons envisager un export sans retouche vers les fichiers MIDI

## Mise en place des répétition dans MMA

Une répétition de 5 couplets refrains  se fait au moyen de la séquence : 

~~~mma
Repeat 
 1 Am
 2 Cm
RepeatEnd  5
~~~

Cette séquence produira 10 lignes alternant les Am et les Cm

## Conventions 

- Si on ommet le nombre de copies, deux copies seront effectuées
- Avec un nombre de copies à 1 nous aurons une itération à savoir Am Cm
- Avec le nombre 0 nous aurons aucune sortie.


## Options RepatEnding 

RepeatEnding 2 par exemple indique que la répétition n'est effective que pour les 2 premières occurrences.

Cela pemet par exemple la structure suivante : 

~~~mma
Repeat
1 Am
2 C
RepeatEnding 2
3 D7
~~~

Le résultat produit sera 

~~~mma
Am 
C 
D7
Am
C
D7
Am
C
~~~

On peut imbriquer plusieurs Repeat et plusieurs RepeatEnd 

## Option NoWarn

Quand une répétition est vide ou sur certaines structures complexes ou une imbrication un
message de Warning est produit.

On peut le supprimer par l'ajout du mot NoWarn entre RepeatEnd et le compteur : 

~~~mma
RepeatEnd NoWarn  5
~~~







