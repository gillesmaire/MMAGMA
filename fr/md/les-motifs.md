# Les motifs ou Pattern

Il existe deux mécanismes qui permettent de prendre la main sur les rythmes joués dans la mesure courante.

- les Motifs que nous allons expliciter dans ce chapitre
- les Séquences  que nous explitons dans le chapitre sur les [sequences](les-sequences)

## Définir un motifs

Voici quelques exemples de motifs

~~~mam
Drum Define S1 1 0 50 
Bass Define Broken8 1 8 1 90; 2 8 5 80; 3 8 3 90; 4 8 1+ 80
Chord Define Dups 1 8 90 0 90 0; 3 8 90 0 90 0
~~~


Nous allons expliciter la syntaxe et le rendu des différents motifs que l'on peut mettre en oeuvre, mais déjà il faut retenir que : 

- les formats peuvent varier pour chaque type de piste mais restent relativement similaires
- ces formats décrivent des rythmes à jouer durant la mesure courante.

Comme nous pouvons le voir dans les trois exemples donnés ci dessus une définition de modèle 
se décompose en trois parties : 

- Une étiquette permettant d'identifier le modèle. Cette étiquette est insensible à la casse et ne doit pas commencer par le caractère souligné (_). Elle ne peut pas avoir comme nom z, Z ou _.
- Suit le mot réservé Define
- Enfin une série de nombre délimitées par un ;
- Le retour  à la ligne sert à clore le motifs

On peut également définir la séquence sur plusieurs lignes séparées par un \  comme par exemple : 

~~~num
Bass Define Broken8 1 8 1 90;\
                    2 8 5 80;\
                    3 8 3 90;\
                    4 8 1+ 80
~~~

Détaillons maintenant la signification des suites de mots par exemple 
1 8 1 90 que nous voyons en première ligne de l'exemple donné ci-dessus.

Ces quatres mots ont chacune une signification différente et un nom qui peut 
être **Position**, **Durée**, **Offset** et **Volume** . Mais ces noms ne sont pas mensionnés dans la notation, ils servent juste à expliciter les différentes positions des chiffres. 

### Position

Si on met 1 on désigne le début de la mesure, si on met 2 le deuxième temps de la mesure, si on met 3 le troisième temps de la mesure et 4 le quatrième temps de la mesure 
(à condition qu'on soit sur une mesure à 4 temps). 

On peut utiliser autre chose que le temps : 
 
- 1.5 : c'est le "et" du premier temps quand on récite 1 et 2  et 3 et 4 
- 2.5 : c'est le "et" du deuxième temps quand on récite 1 et 2  et 3 et 4 
- 1.75 : c'est le "ahh" du premier temps quand on récite 1 et ahh 2 et ahh 3 

Si vous dépassez les limite par exemple 5 pour une mesure à 4 temps ou si vous utilisez une valeur négative vous verrez apparaître une erreur lors de la commande mma.

Enfin si vous utilisez des valeurs entre 0 et .999 la mesure précédente sera affectée et provoquera un message d'attention Warning à l'exécution de la commande mma.

On peut utiliser une autre notation qui utilise le +. Par exemple la notation 1+8 signifie 1 ajouté au huitième de la durée de la note. C'est équivalent à 1.5 puisque 0.5 et un huitème du temps car 1 est un quart de la note. On peut ainsi faire les décalages swing suivants : 1+81.

Enfin on peut également utiliser le - pour signifier qu'on veut jouer la note avant avec la syntaxe 1-81. Mais cela ne rend pas très lisible l'instruction.

En résumé le premier nombre indique le numéro de la mesure et peut être décalé en fonction du style voulu.


### Durée

Le deuxième emplacement est la durée et non plus le point de départ.

Voici un tableau qui donne les durées acceptées 

|Durée| Description                                        |
|:---:|:--------------------------------------------------:|
|  1  |Une ronde (4 temps)                                 |
|  2  |Une blanche (2 temps)                               |
|  4  |Une noire   (1 temps)                               |
|  8  |Le huitième (1 croche)                              |
| 81  |Début de la paire 8ème swing                        |
| 82  |Seconde de la paire 8ème swing                      |
| 16  |La seizième ( double croche)                        |
| 32  |La trentedeuxième (tripe croche)                    |
| 64  |La soixantequatrième (quadruple croche)             |
|  3  |La huitème d'un triolet (triolet de croches)        |
| 43  |Le quart d'un triolet   (triolet de noires)         |
| 23  |La moitié d'un triolet  (triolet de blanches)       |
|  6  |La sixième d'un triolet (triplet de double croches) | 
|  5  |La cinquiième d'un quituplet (quituplet de croches) |
|  0  |Un tick MIDI                                        |
| ddt | dd ticks MIDI  (ex: 12t                            |

Les valeurs 81 et 82 peuvent varier en fonction deu réglage SWINGLIDE SKEW.

La valeur 0 est une valeur spéciale utilisée uniquement dans les pistes batterie ou la longueur 
réelle est donnée par le synthétiseur MIDI et non pas par le programme.

Toutes ces longeurs de notes peuvent être es par ajout d'un point ou d'un double point.

- **2.** ajoute la valeur d'une noire à une blanche
- **4..** ajoute la valeur d'une croche et d'une double croche à une noire

Le signe + peut être utilisé :

- **8+16** pour une croche pointée
- **2+4** : pour  une blanche pointée 
- **3+4** : pour triolet de croches 

Le signe - peut également être utilisé 

- **1-4** : équivalent à 2+4

Ce signe de soustraction peut utiliser la notation : 

- **1-0** qui génèrera une note à peine plus courte que la note entière pour générer une mini pause

Enfin on peut combiner les . les + et les -. Ainsi 2.+4 est une blanche plus une noire plus une noire ce qui revient à une ronde.

En plus des valeurs données dans le tableau précédent on peut créer des valeurs spéciales de multiplets
basées sur  **compteur** suivie d'un *:** d'un **blanc** et d'une **base** : 

- **compteur** : est le nombre de divisions 
- **base** : est une durée de note comme la colonne 1 de la table précédente.

Ainsi un triolet de croche peut se noter 3: 4 et une ronde divisée en 5 peut être notée 5: 1

La valeur base ne peut pas être un tick d'horloge MIDI ou une note pointée.

La commande  ARTICULATE peut forcer des durées réelles. 

Enfin il est même possible de définir la longeur d'une note en unité d'horloge MIDI, ainsi une noire 
peut être notée avec un 4 ou avec la valeur 192t. Si on utilise la notation en unité d'horloge midi les 
symboles + - et . ne sont plus utilisables.

### Offset

Un autre champ peut intervenir sur certains modèles comme : 

- les Bass

### Volume 

Les vélocités MIDI sont limitées à la plage de 0 à 127. Cependant, MMA ne vérifie pas les volumes spécifiés dans un motif pour les valider.

Dans la plupart des cas, les vitesses comprises entre 50 et 100 sont utilisées.

### Utilisation des modèles CETTE PARTIE DOIT ETRE SUPPRIMEE ET INTEGREE AUX PISTES

Les modèles précédents peuvent être définis pour les pistes : 

- BASS
- WALK 
- CHORD 
- ARPEGGIO
- DRUM


En outre, tous ces modèles sont partagés par les pistes de même type. Ainsi Chord-Sus et Chord-Piano partagent les motifs de Chord.

Au début de ce chapitre,  la définition suivante avait été donnée  : 

~~~mma
Drum Define S1 1 0 50
~~~

Si on définit une sous piste comme suit on générera un résultat identique 

~~~mma
Drum-Woof Define S1 1 0 50
~~~


## Motif Bass


Le motif BASS est défini avec : 

~~~mma
Bass Define NomBasse Position Duration Offset Volume;
~~~

On remarque l'apparition du champ Offset, ici cet offset ou décalage de note peut être un chiffre de 1 à 7 chacun représentant une note de la gamme d'accords. Ainsi pour jouer la fondamentale et la quinte de l'accord on utilisera :


**Exemple :**

~~~mma
Bass Define MaBAsse 1 8 1 90; 2 8 5 80; 3 8 3 90; 4 8 1 80
~~~

Notons qu'on parle bien de note dans la gamme c'est à dire de tierce ou de quinte c'est à dire de notes relative par rapport à la tonalité en cours et non pas de la note elle même.

Ici encore on peut ajouter à l'offset un certain nombre de qualificateurs : 

- un ou plusieurs **+** : chaque + augmente la note d'un octave. 
- un ou plusieurs **-** : chaque - descend la note d'un octave. 
- **#** augmente la note d'un demi-ton
- **S** augmente la note d'un demi-ton
- **s** augmente la note d'un demi-ton
- **&** diminue la note d'un demi-ton
- **B** diminue la note d'un demi-ton
- **b** diminue la note d'un demi-ton

Pour les augmentations ou les diminutions d'un demi ton on peut : 

- utiliser plusieurs symboles consécutifs
- utiliser la notation 6b pour 7 bémols

Un point important : si on utilise dans la chaine de caractères de l'offset un caractère + ou - au milieu des dièses ou des bémols, ce caractère - ou # sera automatiquement déplacé en interne à la fin de la note.


## Motif Chord

Le motif CHORD est défini avec : 

~~~mma
Chord Define NomChord Position Duration Volume1 Volume2 ...; ...
~~~

Chaque groupe séparé par un point virgule comprend un décalage de temps pour le point de départ suivis les volumes pour chaque note de l'accord.

**Exemple :** 

~~~mma
Chord Define NomInstrument Straight4+3 1 4 100 ; \
    2 4 90 ; \
    3 4 100 ; \
    4 3 90 ; \
    4.3 3 80 ; \
    4.6 3 80 
~~~

## Motif Arpeggio

Le motif ARPEGGIO est défini comme suit : 

~~~mma
Arpeggio Define Position Duration Volume ; ...
~~~

Les pistes d'arpèges jouent des notes d'un accord une par une. Ceci est très différent des accords où les notes sont jouées ensemble.

Chaque groupe comprend un décalage de temps, la durée de la note et le volume de la note. Vous n'avez pas le choix des notes jouées de l'accords (cependant, elles sont jouées en alternance ascendante / descendante.)

Le volume est appliqué à la note spécifiée dans le motif.


**Exemple :**


~~~mma
Arpeggio Define 4s 1 4 100; \
    					2 4 90; \
    					3 4 100; \
    					4 4 100
~~~

## Modèle Walk

Le motif Walk est défini comme suit : 

~~~mma
 Walk Define NomInstrument Position Durée Volume ; ...
~~~

Les pistes Walking basse sont jouées de haut en bas sur la première partie d'une gamme, en accordant une attention particulière à la «couleur» de l'accord. 
Dans une Marche  les lignes de basse sont très courantes dans le jazz et la musique swing. Elles apparaissent assez souvent comme une mesure «d'emphase» dans les marches.

Chaque groupe comprend un décalage de temps, la durée de la note et le volume de la note. 

MMA sélectionne le pitch (la hauteur) de la note courante pour la jouer en fonction de l'accord actuel et vous ne pouvez pas changer ce comportement.

**Exemple :**

~~~mma
Walk Define Walk4 1 4 100 ; \
    2 4 90; \
    3 4 90 
~~~

Cet exemple joue une note basse sur les temps 1, 2 et 3 d'une mesure en 3/4 temps.

## Modèle Scale


Un motif SCALE se  définit comme suit :

~~~mma
Scale Define Nom Position Duration Volume ; ...
~~~

Chaque groupe consiste en un décalage de temps pour le point de départ, la durée de la note et le volume.

~~~mma
 scale Define S1 1 1 90
 Scale Define S4 S1 * 4
 Scale Define S8 S1 * 8
~~~

Cet exemple définit trois modèles de gamme: 

- S1 est juste une  note qui n'est pas utile en soit mais qui sert dans la définition de S4 et S8.
- S4 est de 4 noires 
- S8 de 8 croches. 

Tous les volumes sont réglés sur une vélocité MIDI de 90.
Les modèles de gammes sont très utiles dans les fins de morceau. 
Plus d'options pour les gammes sont détaillées dans la SCALE DIRECTION  et SCALE TYPE.


## Modèle Aria

Un motif ARIA est défini comme suit : 

~~~mma
Aria Define Position Durée Volume;
~~~

- Aria ne prend pas de paramètre de durée 

## Modèle Plectrum

## Modèle Drum

## Modèle Drum Tone
