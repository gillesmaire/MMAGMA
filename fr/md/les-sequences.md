# Les séquences

## Présentation 

Les pattern alignés les uns à coté des autres est une solution assez lourde qui peut être 
optimisée par l'emploi de Sequence. Une séquence est une suite de motifs décrivant une séquence musicale sur plusieurs mesures.

On note la séquence par une syntaxe du style :

~~~mmma
Track Sequence Pattern1 Pattern2 ...
~~~

- Track peut être n'importe quel nom de piste valide : Chord, Walk, Arpegio-88
- Sequence est un mot clé qui indique que les pattern qui suivent vont être joués successivement
- Les pattern peuvent : 
    - être défini avant l'utilisation 
    - ou directement dans la séquence encadré par {} elles sont ainsi définies à la volée

    
    
Exemple 

~~~mma 
Bass Sequence  Bass1 Bass1 Bass2 Bass1
Arpeggio Sequence { 1 1 100 * 8 } { 1 1 100 * 8 }
~~~


## Répétitions 

La notation 

~~~mma 
Bass Sequence  Bass1 Bass1 Bass2 Bass1
~~~ 

présente une répétition du Pattern Bass1 que l'on peut laisser tel quel ou simplifié en utiliant 
le symbole / ce qui donne

~~~mma 
Bass Sequence  Bass1 / Bass2 Bass1
~~~ 

La deuxième notation est basée sur un modèle appelé en ligne avec des accolades

~~~mma
Arpeggio Sequence { 1 1 100 * 8 } { 1 1 100 * 8 }
~~~

Cette commande définit une séquence de deux mesures pour la piste Arpeggio.

- Chaque bloc entre { } contient : 
    - 1 Le premier temps
    - 1 La note 1 de l'accord
    - volume 100
- Les blocs sont répétés 8 fois
- Cette deuxième notation peut varier en fonction des instruments et est explicité au cas par cas dans le chapitre [Les pistes](les-pistes.md)

## Les silences


On peut insérer dans la séquence un silence en remplaçant  le pattern par la lettre z ou par - et ce silence durera une mesure

~~~mma 
Bass Sequence  Bass1 - Bass2 Bass1
~~~

On peut bien sûr répéter les silences par l'utilisation du /

~~~
Walk Sequence z / / Walk4-4
~~~

## Modification d'une séquence existante

On peut vouloir jouer une séquence en  la modifiant. 

Supposons qu'elle était définie comme suit 

~~~mma
Bass Sequence  Bass1 Bass1 Bass2 Bass1
~~~

On peut utiliser la notation suivante 

~~~mma
Chord Sequence * * * { 1 2 90 }
~~~

cela aura pour effet de jouer les tris première mesure de Bass puis on jouera la 
mesure définie par { 1 2 90 }. 

Par contre Bass restera inchangé pour les utilisations futures mais la séquence modifiée sera jouée 

## Suppression des séquences

- La commande **SeqClear** efface toutes les séquences définies sauf la séquence SOLO et STICKY
~~~mma
Drum SeqClear
~~~
- La commande **SeqClear** utilisée sur Drum par la syntaxe suivante effacera les séquence Drum mais 
également Drum1 Drum2 si elles existaient
- Par contre **SeqClear** utilisée sur Drum1 n'efface pas Drum ni Drum2 ce qui peut d'ailleurs être également effectué par 

~~~mma
Drum1 Sequence -
~~~


## Séquences aléatoires


Par défaut les séquences sont jouées comme définies mais on peut activer un ordre des notes aléatoire
pour chacune des exécutions.

Pour actiber l'ordre aléatoire sur la piste Chord : 

~~~mma
SeqRnd  Chord On
~~~

Pour activer l'ordre aléatoire sur chaque piste : 

~~~mma
SeqRnd  On
~~~

Pour activer l'ordre aléatoire sur les trois pistes Drum-Snare Chord-2 Chord-3

~~~mma
SeqRnd Drum-Snare Chord-2 Chord-3  On
~~~

Pour désactiver l'ordre aléatoire 


~~~mma
SeqRnd  On
Drum SeqRdn Off
~~~

Quand l'ordre aléatoire est activé pour une séquence il est même possible de modifier les fréquences
d'apparition des séquence en donnant un facteur pour chacune d'elles par une commande du style : 

~~~mma
Bass Sequence  Bass1 Bass1 Bass2 Bass1
Chord SeqRndWeight 2 2 1 1 
~~~

- pour la valeur 2 : probabilité de 2 sur 6
- pour la valeur 1 : probabilité de 1 sur 6 
- 6 étant la somme de 2 + 2 + 1 + 1
- La valeur 0 : permet de ne pas jour la séquence correspondante



## SeqSize

Le nombre de mesures dans une séquence est donné par SeqSize. Par exemmple  SeqSize est 6 pour : 

~~~mma
Bass Sequence  Bass1 Bass1 Bass2 Bass1 / / 
~~~


SeqSize permet d'utiliser l'option From sous la forme From avec les index des valeurs à  positionner : 

~~~mma
Seqsize 10
SeqRndWeight From=1,4,9
~~~

Dans cet exemple SeqRndWeight prendra la valeur 1 0 0 1 0 0 0 0 1 0 


From dispose d'une deuxième syntaxe qui consiste à répéter un ou plusieurs champs pour en augmenter la probabilité 

~~~mma
Seqsize 10
SeqRndWeight From=1,4,4,4,9
~~~

Ici le 1 sera joué parfois, ainsi que le 9 mais le 4 sera joué trois fois plus souvent
