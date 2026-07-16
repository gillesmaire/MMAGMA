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
- Enfin une série de notes délimitées par un ;
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
être Start, . Mais ce nom n'est pas mensionné dans la notation

### Start

Si on met 1 on désigne le début de la mesure, si on met 2 le deuxième temps de la mesure, si on met 3 le troisième temps de la mesure et 4 le quatrième temps de la mesure 
(à condition qu'on soit sur une mesure à 4 temps). 

On peut utiliser autre chose que le temps : 
 
- 1.5 : c'est le "et" du premier temps quand on récite 1 et 2  et 3 et 4 
- 2.5 : c'est le "et" du deuxième temps quand on récite 1 et 2  et 3 et 4 
- 1.75 : c'est le "ahh" du premier temps quand on récite 1 et ahh 2 et ahh 3 

Si vous dépassez les limite par exemple 5 pour une mesure à 4 temps ou si vous utilisez une valeur négative vous verrez apparaître une erreur lors de la commande mma.

Enfin si vous utilisez des valeurs entre 0 et .999 la mesure précédente sera affectée et provoquera un warning à l'exécutiond de la commande mma.

