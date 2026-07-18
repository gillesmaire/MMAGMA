# Les motifs ou Pattern

Il existe deux mécanismes qui permettent de prendre la main sur les rythmes joués dans la mesure courante.

- les Motifs que nous allons expliciter dans ce chapitre
- les Séquences  que nous expliterons dans le chapitre sur les [sequences](les-sequences)

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
être **Début**, **Durée**, **Volume** . Mais ces noms ne sont pas mensionnés dans la notation, ils servent juste à expliciter les différentes positions des chiffres. 

### Début

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



### Volume 

Les vélocités MIDI sont limitées à la plage de 0 à 127. Cependant, MMA ne vérifie pas les volumes spécifiés dans un motif pour les valider.

Dans la plupart des cas, les vitesses comprises entre 50 et 100 sont utilisées.


