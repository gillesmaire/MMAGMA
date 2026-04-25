# Utilisations des grooves

## Qu'est ce qu'un groove 

Dans MMA, un groove est un modèle d’accompagnement musical automatique.

Ce groove définit pour une mesure : 

- la batterie (drums)
- la basse
- le comping (piano/guitare)
- le style rythmique

## L'appel d'un Groove 

L'appel d'un groove se fait par :

~~~
Groove NomDuGroove
~~~

MMA remplace alors : 

- les patterns de la batterie
- les patterns de la basse 
- les patterns harmonique

Mais il ne change pas les accords

## L'appel de plusieurs Groove

L'appel de plusieurs grooves se fait par exemple comme ceci :

~~~
 Groove Tango LightTango LightTangoSus 
~~~

Cela veut dire que la première mesure sera jouée Tango, 
la seconde LightTango, la troisième LightTangoSus puis à nouveau Tango

Cette utilisation permet de créer des balancements rythmiques et simuler des battements moins mécaniques

On peut même faire des répétitions d'un même groove : 

~~~
Groove G1 G1 G1 G2 G2 G3
~~~

Nous verrons par la suite que la succession de mesures peut se faire en utilisant le symbole / 
de répétition :

~~~
Groove G1 //  G2 / G3
~~~

La notation suivante permet de définir l'index du groove à choisir dans une liste


~~~
Groove 3 G1 G2 G3
~~~

est identique à 

~~~
Groove G3
~~~


Cette dernière notation parait quelque peu inutile mais nous verrons plus tard que
la Commande Repeat qui permet de faire des boucles peut permettre de faire une  boucle sur l'inclusion
de Groove suivant un indice et pour chaque indice d'effectuer des adaptations.

## Appel de groove avec notation étendue

~~~
Groove Verse*3 Chorus*4 Fill*1
~~~

Est identique à 

~~~
Groove Verse// Chorus/// Fill
~~~

## Appel de groove par nom de fichier 

~~~
Groove stdlib/rhumba:rhumaend
~~~

Ceci va charger le fichier rhumba situé dans le répertoire stdlib et ne prendre que le groove nommé
rhumaend sachant que tout ce qui est à gauche des deux points (:) fait partie du système de fichiers.

## Emplacement des fichiers groove

### Sous Linux 

Sous Linux les fichiers Groove se trouvent dans le répertoire 

~~~bash
/usr/local/share/mma/lib
~~~

Ils sont classés par familles : 

- alexis
- casio
- kara 
- pflib
- stdlib 
- yamaha
- zoom

## Les Grooves par famille

### Alexis 

hiphop teamtechno 

## Casio

16beat1 16beat2 16beat3 16beatballad1 16beatballad2 16beatballad3 16shuffle1 16shuffle2 60spop 60srock 60ssoul 68ballad 80spop 8beat1 8beat2 8beat3 8beatballad1 8beatballad2 8beatballad3 8beatdance 8beatpop1 8beatpop2 8beatpop3 ambient1 ambient2 ambient3 blues dance1 dance2 dancepop1 dancepop2 dancepop3 digitalrock discosoul electricpop fastbigband foxtrot funk1 funk2 fusion germanmarch heavymetal hip-hop house jazzcombo jazzwaltz latinfusion latinhouse march1 mellowrb middlebigband modernjazz modernrb oldieballad polkafox polka popballad pop poppolka poprock1 poprock2 popshuffle1 popshuffle2 popwaltz quickstep rave r+b rock1 rock2 serenade shuffleboogie shufflerock slow16beat slowbigband slowrock slowswing soul soulpop swing techno trance1 trance2 triphop twist worldpop

## Kara

2beatp 8beatmotown fasttwist happyshuffle K50s_rock kbossa Kfunk1 kwestballad twi


## pflib

16beat1 16beat2 8beat1 8beat2 highfive metal1 metal2 rock1 slowrock 

## stdlib

0srock 60srock 68march 68swing 8beat afro-cuban arpeggio44 arpeggio68 arpeggiowaltz ballad128 ballad68 ballad basicrock bebop beguine bigband bluefolk bluegrass blues128 blues68 blues boggiewoggie bolero boneym bossanova broadway broadwaywaltz bubblerock bvfunk bwmarch calypso chacha charleston click countryblues countryswing countrywaltz cubanguitar descendingjazz desert dixiemarch dixie doowop dsoul easyswing eewaltz evansish fastblues fastjazzwaltz fastswing fastwaltz folkballad folk folkrock folkyjazz foxtrot frenchwaltz guitarballad gypsyjazz hillcountry hymn jazz-54 jazzcombo jazzguitar jazzrhumba jazzrock jazzwaltz jive latinwaltz lfusion lighttango lullaby mambo march mellowjazz merengue metronome3 metronome68 metronome6 metronome modernjazz modernjazzwaltz nitejazz none pianoballad polka popballad popspiritual quickstep ragtime rb-ballad rb rhumba rock-128 rockballad rockwaltz salsa samba showtune shuffleboggie ska slowblues slowbolero slowbroadway slowcountry slowdesert slowjazz slowspiritual softrock softshoe son spiritual stringballad strut swing tango trance twist vienesewaltz waltz westernswing zydeco 

## Yamaha

jazzbasie jazzbossa jazzbouncy jazzcountry vi  jazzswing jazztrio jazzwaltz mambo quando-g.s280 salsa1 salsa2 western w-rock

## Zoom 

afro ambient bald34 bald beat16 beat8 blues34 blues68 blues bossa cntry count country dance dnb ending funk fus16 fusion hiphop house hrk intro jazz04 jazz latin mide mtl pop punk reggae rnb rock34 rock samba shuffle ska techno thr trip

## Comment tester les grooves 

La commande play à la racine de MMAGMA fonctionne sous Linux uniquement, elle permet  :

- D'écouter le fichier.mma par la syntaxe 

~~~bash
./play fichier
~~~~

- On note qu'il ne faut pas adjoindre l'extension mma au fichier
- Le Groove sera le dernier utilisé si aucun paramètre de groove n'est donné
- Si on ajoute un paramètre de groove ce paramètre viendra remplacer le paramètre de groove par défaut : 

~~~bash
/play fichier mambo
~~~

