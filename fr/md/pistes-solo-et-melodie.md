# Les pistes solo et mélodie


## Présentation 


Nous avons vu comment utiliser la batterie et les accords, nous allons voir comment ajouter des lignes
mélodiques. Ces mélodies sont avec les harmonies que nous verrons dans un des chapitres suivants.

Il est bien sûr possible d'ajouter des mélodies et des harmonies via des instruments MIDI, mais on 
dispose également de pistes réservées aux mélodies : 

   - des pistes **solo** qui permettent improvisations, contrechants, riffs ou interventions ponctuelles
   d’un instrument. Ces pistes sont initialisées une seule fois au démarrage du morceau. Les mogts SEQ et CLEAR sont
   ignorés pour les pistes solo. Les réglages des pistes SOLO ne sont pas sauvegardés ni récupérables via la commande 
   Groove. Un certain nombre de réglages sont donc nécessaires pour les pistes Solo
   - les pistes **mélodie** reprenant l'air du morceau  utilisent les Grooves qui sont en cours 
  
Nous verrons que l'on peut également ajouter des Harmonies dans un des chapitres suivants.


On déclare les pistes Solo  de la façon suivante : 

~~~mma
Solo Voice TenorSax
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


## Armure 

Pour chacune des piste on devra une définir l'armure c'est à dire les dièses et les bémols  de début de portées qui s'appliquent sur la partition. Ceci se définit par le mot clé KeySig



| KeySig | Armure | Effet |
|:------:|:------:|:-----:|
|    C   |        |  Do   |
|    G   |  1#    |  Sol  |
|    D   |  2#    |  Ré   |
|    F   |  1b    |  Fa   |
|    Bb  |  2b    |  Sib  |
|    Am  |        |  Lam  |
|    Em  |  1#    |  Mim  |


Enfin les mots clé Major Minor ou leur raccourci Maj Min peuvent être ajoutés



## Format des données de la note 

Les notes jounées dans un Solo ou un Mélody doivent être définies accompagnées de leur durée :

| Notation | Description        |  Durée |
|:--------:|:------------------:|:------:|
|    1     |  Ronde             | mesure |
|    2     |  Blanche           | moitié |
|    4     |  Noire             | quart  |
|    8     |  Croche            | 8ème   | 
|   16     |  Double croche     | 16ème  |
|   32     |  Triple croche     | 32ème  |
|   64     |  Quadruple croche  | 16ème  |
|   81     |  1ère croche plus longue  | 8ème  |
|   82     |  3ème croche plus courte  | 8ème  |
|   3      |  Triolet de croches       | 3/8 |
|   43     |  Triolet de noires        | 3/4|
|   23     |  Triolet de blanches        |3/2 |
|   6      |  Triolet de double croches  |3/16|
|   5      |  quintolet de croches    ||
|   0      |  tick MIDI               ||
| ddT      |  dd nombre de ticks midi      ||



**Exemples : **

- Bass C 1 1 : la basse joue un Do pendant une ronde 
- Bass C 4 4 4 4 : la basse jour 4 noires 
- Bass C 81 82 81 82 : la base joue qutre noire façon swing
- Bass C 96T : joue 96 ticks MIDI



Une flûte jouera sur le 5 ème octave alors qu'une guitare saturée jouera sur l'octave 4.

- Les notes sont notées de A (La) à G (Sol) le silence est noté R
- Les dièses sont notés # et les bémols b ou &
- Une fois l'octave choisi, on peut passer à une note de l'octave supérieur par a+ et a- pour l'octave inférieur
sachant que l'octave de base est définit par octave suivi d'un numéro
- La vélocité,c'est à dire le volume de base est donné par Volume
- Le Symbole ~ renforce  la tenue de la note par exemple C~ 
- Il est également possible d'importer les notes d'un fichier MIDI par 

~~~mma
MidiFile solo.mid
~~~


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
