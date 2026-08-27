# Les pistes solo et mélodie


## Présentation 

Nous avons énuméré la liste des pistes nous allons voir comment ajouter des lignes
mélodiques. Ces mélodies **solo** et **mélody** sont à compléter avec les **harmonies** que nous verrons dans le chapitre correspondant.

   - Il est possible d'ajouter des mélodies et des harmonies via des instruments MIDI via l'ordre MidiInc mais on dispose également de pistes réservées aux mélodies : 
   - Nous verrons que l'on peut également ajouter des Harmonies dans un des chapitres suivants.
   - Des pistes **solo** qui permettent improvisations, des contrechants, riffs ou interventions ponctuelles d’un instrument peuvent être utilisées. 
      - Ces pistes sont initialisées une seule fois au démarrage du morceau. 
      - La commavousnde SEQCLEAR est ignorée pour les pistes solo.
      - Les réglages des pistes SOLO ne sont pas sauvegardés ni récupérables via la commande 
   Groove. 
      - Un certain nombre de réglages sont donc nécessaires pour les pistes Solo, ces paramètres sont généralement
   définis une préambule de votre fichier, ces paramètres étant utilisables pour la chanson entière.
   - Les pistes **mélody** reprenant l'air du morceau utilisent les instruments du Groove qui est en cours. Elles sont généralement créées dans les Groove eux même.
   
## Déclaration d'une piste SOLO

On déclare les pistes Solo  de la façon suivante : 

~~~mma
temp 120 
Solo Voice Piano
Solo Riff 4c; 2d; 4f;
F
Solo Riff 4a; 8g #; 4a; 4c +;
F
~~~



On déclare les pistes Melody de la façon suivante : 

~~~mma
Melody Voice TenorSax
   Groves Blues
   Octave 5
   Melody  c d e f g
   Volume 90
End
~~~

Dans le deuxième exemple l'instrument ne sera pas TenorSax mais celui défini par le Groove Blues.


### Armure et KeySig



Pour chacune des pistes Solo ou Mélodie, on devra définir l'armure c'est à dire les dièses et les bémols  de début de portées qui s'appliquent à la partition ou plus simplement la tonalité du morceau.

En général la tonalité d'un morceau est donnée par le dernier accord joué si celle la fait office de conclusion musicale.


Ceci se définit par le mot clé **KeySig**.

Le tableau suivant donne les Keysig de base de chacunes des tonalités majeures et mineures.

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



Bien sûr on peut également utiliser des armures différentes pour produire des mélodies qui sortent des tonalités. 

Enfin les mots clé Major Minor ou leur raccourci Maj Min peuvent être ajoutés.






### Format des  notes

Les notes jouées dans un solo ou une mélodie doivent être définies accompagnées de leur durée :

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



**Exemples : **

- Bass C 1 1 : la basse joue un Do pendant une ronde 
- Bass C 4 4 4 4 : la basse pour 4 noires 
- Bass C 81 82 81 82 : la base joue quatre noire façon swing
- Bass C 96T : joue 96 ticks MIDI



Une flûte jouera sur le 5 ème octave alors qu'une guitare saturée jouera sur l'octave 4.

- Les notes sont notées de A (La) à G (Sol) le silence est noté R
- Ces notes peuvent être en majuscule ou minuscule
- Les dièses sont notés **#** et les bémols **&** et les bécarres **n**
- Une fois l'octave choisi, on peut passer à une note de l'octave supérieur par a+ et a- pour l'octave inférieur
sachant que l'octave de base est définit par octave suivi d'un numéro
- La vélocité, c'est à dire le volume de base est donné par Volume
- Le Symbole ~ renforce  la tenue de la note par exemple C~ 
- Il est également possible d'importer les notes d'un fichier MIDI par la syntaxe suivante : 

~~~mma
MidiFile solo.mid
~~~

**Note :**

Lorsqu'on un accord en MMA, on peut spécifier  **b** ou **&** pour représenter un signe bémol.
Par contre dans un solo on ne peut utiliser que le caractère **&**
De plus, les doubles altérations dièzes et bémols ne sont pas prises en charge.


### Définition des Riff

On peut écrire les mesures de deux façons :

- par une série de RIFF
- par une série d'accords accompagnés des RIFF
- par des sections BEGIN END

#### Par une série de RIFF 


~~~mma
Solo Riff 4c; 2d; 4f;
F
Solo Riff 4a; 8g#; 4a; 4c+;
F
~~~

### Par ia série d'accords accompagnés des RIFF

~~~mma
F {4c; 2d; 4f;}
F {4.a; 8g#; 4a; 4c+;}
~~~

### Par des sections BEGIN END

~~~
Begin Solo Riff
   4c; 2d; 4f;
   4.a; 8g#; 4a; 4c+
End
F
F
~~~

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


## 

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

~~~
