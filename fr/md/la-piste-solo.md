# La piste Solo

## Présentation 

Une piste `Solo` est destinée à une improvisation ou à une ligne ponctuelle. 

Cette piste fait partie du fichier MMA et non pas du grouve comme la plupart des autres 
pistes que nous verrons dans la partie Concepion des grooves.

Pour inclure un Solo on devra définir l'instrument, cet instrument ne faisant pas 
nécessairement partie des instruments du Groove en cours : 

~~~mma
Solo Voice AltoSax
~~~


- Les réglages des pistes Solo ne sont pas sauvegardés ni récupérables via la commande 
   Groove. 
- Un certain nombre de réglages sont donc nécessaires pour les pistes Solo, 
   ces paramètres sont généralement définis en préambule de votre fichier MMA, ces paramètres
   étant utilisables pour l'intégralité du morceau.
  

## Durée des  notes

Les notes jouées dans un solo  doivent être définies accompagnées de leur durée :

| Notation | Description                |  Durée |
|:--------:|:--------------------------:|:------:|
|    1     |  Ronde                     | mesure |
|    2     |  Blanche                   | moitié |
|    4     |  Noire                     | quart  |
|    8     |  Croche                    | 8ème   | 
|   16     |  Double croche             | 16ème  |
|   32     |  Triple croche             | 32ème  |
|   64     |  Quadruple croche          | 16ème  |
|   81     |  1ère croche plus longue   | 8ème   |
|   82     |  3ème croche plus courte   | 8ème   |
|   3      |  Triolet de croches        | 3/8    |
|   43     |  Triolet de noires         | 3/4    |
|   23     |  Triolet de blanches       | 3/2    |
|   6      |  Triolet de double croches | 3/16   |
|   5      |  quintolet de croches      |        |
|   0      |  tick MIDI                 |        |
| ddT      |  dd nombre de ticks midi   |        |


## Les Notes 


- Les notes sont notées de A (La) à G (Sol) 
- Le silence est noté R
- Ces notes peuvent être en majuscule ou minuscule
- Les dièses sont notés **#** et les bémols **&** et les bécarres **n**
- Une fois l'octave choisi, on peut passer à une note de l'octave supérieur par a+ 
et a- pour l'octave inférieur sachant que l'octave de base est définit par octave 
suivi d'un numéro. 
- Une flûte jouera sur le 5 ème octave alors qu'une guitare saturée jouera sur l'octave 4
- La vélocité, c'est à dire le volume de base est donné par la variable Volume
- Le Symbole **~**renforce  la tenue de la note par exemple **C~**.

Il est également possible d'importer les notes d'un fichier MIDI par la syntaxe suivante : 

~~~mma
MidiFile solo.mid
~~~

**Remarques :**

- Lorsqu'on joue un accord en MMA, on peut spécifier  **b** ou **&** pour représenter un signe bémol.
- Par contre dans un solo on ne peut utiliser que le caractère **&**
- De plus, les doubles altérations dièzes et bémols ne sont pas prises en charge.

## Syntaxes du solo

Plusieurs notations sont disponibles : 

  - La notation entre les accords
  - La notation entre accolades
  - La notation avec Begin End
  

### La notation  entre les accords 


La notation se fera par une syntaxe du style :

~~~mma
Solo Riff 4c;2d;4f
F
Solo Riff 4.a;8g#;4a;4c+;
F 
~~~

Le solo est joué en même temps que l'accord suivant 


### La notation entre accolades

La notation précédente aurait pu être notée : 

~~~mma
F {4c;2d;4f;}
F {4.a;8g#;4a;4c+;} 
~~~

### La notation avec Begin End

~~~mma SOLO RIFF
BEGIN
 4c;2d;4f;
 4.a;8g#;4a;4c+ 
END
F 
F 
~~~

##  Armure


### Principe 

Pour que le des pistes Solo fonctionnent correctement, on devra définir l'armure c'est à dire les dièses et les bémols de début de portées qui s'appliquent à la partition ou plus simplement la tonalité
du morceau.

En général, la tonalité d'un morceau est donnée par le dernier accord joué qui fait office de conclusion musicale.

Ceci se définit par le mot clé **KeySig**.

Le tableau suivant donne les Keysig de base représentant les tonalités de chacunes des tonalités majeures et mineures.

| Keysig | Tonalité majeure | Tonalité mineure |
|:-------|:----------------:|:----------------:|
|    0   |  Do              |  Lam             |
|    1#  |  Sol             |  Mim             |
|    2#  |  Ré              |  Sim             |
|    3#  |  La              |  Fa#m            |
|    4#  |  Mi              |  Do#m            |
|    5#  |  Si              |  Sol#m           |
|    6#  |  Fa#             |  Ré#m            |
|    7#  |  Do#             |  La#m            |
|    1b  |  Fa              |  Rém             |
|    2b  |  Sib             |  Solm            |
|    3b  |  Mib             |  Dom             |
|    4b  |  Lab             |  Fam             |
|    5b  |  Reb             |  Sibm            |
|    6b  |  Solb            |  Mibm            |
|    7b  |  Dob             |  Labm            |


### Utilité 


Une fois l'armure définie par KeySig les notes du solo suivront la gamme avec les éventuels bémols ou dièses qui la définissent. Cela permet d'éviter de noter ces alitérations.


On peut très bien ne pas définir l'armure mais dans ce cas les dièses et les bémols seront
à ajouter au solo : 
  - Le bémol est noté b
  - Le dièse quant à lui est noté #.


### Notation 

Pou définir l'armure on  peut utiliser la notation 1b ou Fa et on précise :

   - Maj, Major ou rien pour le mode majeur
   - Min ou Minor pour le mode mineur

On peut utiliser indifférement la notation 

   - 1# 
   - G 

Bien sûr on peut également utiliser des armures différentes pour produire des mélodies qui sortent des tonalités. 


Voici quelques exemples de KeySig équivalents  : 

~~~mma
KeySig 2#
KeySig 2# Major
KeySig 2# Maj
KeySig D 
KeySig D Maj
KeySig D Major
~~~~


### Exemple intéressant

## La vélocité 

La vélocité MIDI qui est l'intensité de la note et par  défaut est positionnée à 90, peut être changée en spécifiant une valeur entre 0 (pas de son) et 127 (très fort) après le symbole /

Par exemple 

~~~
F {4c; 2d; 4f/120;}
~~~

## Dépacement de mesure 


Le caractère tilde, ~, peut apparaître comme le premier ou le dernier élément d'une séquence de notes.

- Si les notes sont jouées en même temps 

## Les format des données 



- Les notes d'une piste SOLO ou MELODY sont spécifiées comme une série d'accord, chacun 
de ces accords pouvant être une note ou plusieurs notes chacune ayant la même durée
- Chaque accord, note  ou silence ainsi utilisé doit être délimité par un point-virgule
- S'il manque des accords des notes ou des silences pour finir une mesure, la dernière note est répétée



## Réglages plus fins



Pour éviter un rendu trop mécanique : 

~~~mma
Melody RTime -10,10 
Melody RVolume -5,5
~~~

## Exemples : 


~~~mma
Tempo 120
Groove Swing

C Am F G

Begin Melody
   Voice AltoSax
   Octave 5
End

Melody c d e g r g e d















- Le signe + élève d'un octave
- Le signe - descend d'un octave
- Les signes b et # sont les alitérations dièse et bémol
- le signe ~ effectue une liaison
- La durée est exprimée par
    - 1 pour la ronde
    - 2 pour la blanche
    - 4 pour la noire
    - 8 pour la croche
- Les accords s'exécutent entre { } : {c e g}


```mma
Solo Voice AltoSax

Solo
1 G
2 A
3 C+
4 D+
```

Elle peut être utilisée seulement dans certaines parties du morceau.

## Exemples 


