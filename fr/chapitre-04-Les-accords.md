# Les accords

## Notation des accords dans MMA


Un accord est un ensemble de notes jouées simultanément.  

C’est l’élément de base pour construire l’harmonie d’un morceau. Chaque accord peut être utilisé dans une piste ou assigné à un instrument spécifique.

Pour la majorité des morceaux, vous utiliserez les **accords prédéfinis** fournis par MMA, comme `C:maj`, `A:min`, `G7`, ou `F:maj7`.  
Ces accords peuvent être joués sur n’importe quelle piste ou instrument.

Si on ne précise pas le qualificateur maj min ou 7 eme l'accord est majeur.  Nous verrons que dans certain cas il faudrai préciser le qualificateur :maj pour ne pas faire jouer une note mais bien un accord. Nous reviendrons sur ce point.




## Écrire les accords dans un fichier MMA

Les accords sont inscrits dans le fichier MMA par ligne et par piste.  Chaque ligne correspond à une position rythmique dans la mesure, mais pas directement directement à la durée d’un accord comme dans une partition classique.


~~~mma
1 C
2 D C
3 G7
~~~

- La première colonne (1,2,3) correspond au numéro de mesure dans la piste ou séquence.
- Les colonnes suivantes correspondent aux accords à jouer dans cette mesure.
- Si plusieurs accords apparaissent sur la même ligne (2 D C), ils sont placés sur la même pulsation, mais leur durée réelle dans la mesure dépend du pattern et du groove associé dans MMA.
- Pour préciser des durées rythmiques exactes (comme une blanche ou deux noires), il faut définir un pattern qui indique le  point de départ et la durée de chaque accord dans la mesure.


Ainsi, 1 C joue l’accord C au début de la mesure, et 2 D C place D et C au deuxième temps, mais la durée exacte de chaque accord est déterminée par le pattern.


##  Utiliser les accords sur plusieurs pistes

Chaque piste ou instrument peut utiliser des accords différents

Exemple :

~~~mma
track Piano
1 C
2 F G
3 C

track Guitar
1 C
2 D C
3 G7
~~~


Chaque piste lit la même notation, mais le son produit dépend de l’instrument. Les accords sur différentes pistes peuvent être synchrone ou décalés selon les patterns et la position dans la mesure


##  Exemples rythmiques concrets


### Principe de base

Dans MMA :

- TIME définit la subdivision de la mesure (combien de temps musical par barre).\ 
    - Par exemple TIME 4 signifie 4 temps (classique 4/4).
- Une sequence décrit pour une mesure :
    - le start point (position de début),
    - la durée en valeurs fractionnaires (noires, croches…),
    - et éventuellement des accents/voicings.
- Ces définitions de séquence se font dans les fichiers de groove
- La ligne d’accord (1, 2, etc.) n’a pas de durée — elle fixe simplement quelle harmonie doit être utilisée au moment donné, mais c’est le pattern qui décide de la durée rythmique effective.


### Exemple 1 : une blanche

Pour jouer un accord sur une blanche (2 temps sur une mesure 4/4), on peut utiliser un pattern qui occupe la moitié de la mesure.

Supposons que la mesure est TIME 4 (4 noires).

~~~mma
 simpleHalf Sequence
0     2     120
~~~

Interprétation :

- 0 : le départ du pattern (début de la mesure).
- 2 :  durée de 2 (2 noires = 1 blanche).
- 120 : interprétation interne (volume/ vélocité, etc.).


Utilisation avec les accords

~~~mma

TIME 4

track Piano
1 C
~~~

MMA utilisera le pattern simpleHalf pour que l’accord C soit joué pendant 2 temps (une blanche) à partir du début de la mesure.

### Exemple 2 : deux noires

Pour jouer deux accords de deux noires chacun dans une mesure 4/4 :

~~~mma
twoQuarters Sequence
0     1     100
1     1     100
~~~

Pour que MMA associe ces segments avec les accords, on pourra écrire :

~~~mma
TIME 4

track Piano
1 C
2 G
~~~~

Dans ce cas MMA joue :

- À pulsation 1 (ligne 1), l’accord C pendant une noire (1 temps)

- À pulsation 2 (ligne 2), l’accord G pendant une noire (1 temps)

Et comme la mesure est en 4/4, on peut compléter la mesure par d’autres accords ou silence.


### Exemple 3 : une blanche + deux noires

Supposons que dans une même mesure on veut :

- un accord sur la blanche (2 temps),

- puis deux accords de noire chacun (1 temps chacun)
    
Pattern MMA

~~~mma
halfThenTwoQuarters Sequence
0     2     120
2     1     100
3     1     100
~~~

Interprétation :

- 0 2 → l’accord à la ligne 1 commence au début et dure 2 (blanche)
- 2 1 → l’accord à la ligne suivante commence au 3e temps (qui est 2 en index) et dure 1 (une noire)
- 3 1 → l’accord à la ligne suivante commence au 4e temps et dure 1 (une noire)


Utilisation avec accords

~~~mma
TIME 4

track Piano
1 C
2 F
3 G
~~~


Signification :

- à la ligne 1 → accord C, joué pendant 2 temps
- à la ligne 2 → accord F, joué 1 temps
- à la ligne 3 → accord G, joué 1 temps

Ce pattern (et cette notation) donne dans une mesure 4/4 :

- temps musical	son joué
- temps 0–2	C (blanche)
- temps 2–3	F (noire)
- temps 3–4	G (noire)


## Rappel sur les lignes et les patterns

Dans MMA :

- Les lignes (1, 2, 3, etc.) ne sont pas des durées mais des points de repère dans la mesure.
- C’est le pattern qui détermine réellement quand et pendant combien de temps un accord sera joué.
- Le même pattern peut être réutilisé sur plusieurs mesures.
- Un pattern peut comporter plusieurs segments pour gérer des rythmes complexes.

Synthèse

|But musical | MMA notation possible |
|:----------:|:---------------------:|
|Une blanche	|pattern avec durée 2|
|Deux noires	|pattern avec deux segments de 1|
|Une blanche + deux noires	|pattern structuré (0–2, 2–3, 3–4) |

    
