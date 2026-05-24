# Utilisations des grooves

## Présentation des groove

### Qu'est ce qu'un groove 

Dans MMA, un groove est un modèle d’accompagnement musical automatique, c'est à dire qu'il permet d'utiliser des motifs et des séquences.


Ce groove définit pour une mesure les jeux : 

- de la batterie (drums)
- de la basse
- des accords (piano/guitare)
- du style rythmique


Le Groove ne définit pas le style de guitare utilisée ou les types de percussion, 
C'est dans le morceau que le type d'instrument sera utilisé.
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


La commande suivante affiche le nombre de grooves disponibles sous Linux. Le résultat au moment de
la rédaction de ce doument est de 289  grooves différents disponibles.

~~~bash
ls /usr/share/mma/lib/* | grep -v :$ | grep -v ^$ | wc -l
~~~

On peut affichier tous les grooves contenant le mot jazz par la commande 

~~~bash
ls /usr/share/mma/lib/* | grep jazz 
~~~

Ce qui donnera la liste 

~~~
slowswing.mma
swing.mma
68swing.mma
countryswing.mma
easyswing.mma
fastswing.mma
swing.mma
westernswing.mma
jazzswing.mma
~~~


### L'appel d'un Groove 

L'appel d'un groove se fait par :

~~~
Groove NomDuGroove
~~~

MMA remplace alors : 

- les patterns de la batterie
- les patterns de la basse 
- les patterns harmonique

Mais il ne change pas les accords

Ceci va jouer tout le long du morceau avec le Groove sélectionné.

### L'appel de plusieurs Groove

L'appel de plusieurs grooves se fait par exemple comme ceci :

~~~
 Groove Swing CountrySwing WesterSwing
~~~

Cela veut dire que la première mesure sera jouée Swing, 
la seconde coutryswing, la troisième westernswing puis à nouveau swing

Attention à ne pas confondre, ce n'est pas tout le morceau qui est jouée swing puis coutryswing puis westerswing. Pour faire 
des boucles sur les couplets, nous verrons que nous disposons un autre outil.

Cette utilisation permet juste de créer des balancements rythmiques et simuler des battements moins mécaniques

On peut même faire des répétitions d'un même groove: 

~~~
Groove G1 G1 G1 G2 G2 G3
~~~

Nous verrons par la suite que la succession de mesures peut se faire en utilisant le symbole / 
de répétition:

~~~
Groove G1 //  G2 / G3
~~~


On aurait pu donc pour revenir à notre exemple  choisir les répétions de Groove: 

~~~
Groove Swing // CountrySwing // WesterSwing /
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


### Appel de groove par nom de fichier 

~~~mma
Groove stdlib/rhumba:rhumaend
~~~

Ceci va charger le fichier rhumba situé dans le répertoire stdlib et ne prendre que le groove nommé
rhumaend sachant que tout ce qui est à gauche des deux points (:) fait partie du système de fichiers.

### Les alias de Groove

- La syntaxe suivante permet de lancer le groove swing via le nomm MoGroove

~~~mma
DefAlias Swing MonGroove
~~~

Ce nouveau nom de groove ne doit pas être déjà utilisé ni dans un Groove existant ni dans un Alias

### AllGrooves 

La directive AllGrooves permet d'appliquer des modification à tous les Groove utilisés. 

Dans l'exempe suivant sur tous les Groove utilisés on provoquera, pour la Basse une articulation de 20 et on augmentera son volime de 30

~~~mma
begin AllGrooves
  Bass Articulate 20
  Bass Volume +30
end
~~~

Si on dispose d'une seule modification on peut s'affranchir des ordres begin end 

~~~mma
AllGrooves Bass Volumes +30
~~~


On peut ajouter d'autres modifieur dans la directive AllGrooves :


- Verbose=True/False qui affichera les noms des grooves affectés
- Only=A ou Only=A,B pour restreindre l'apllication à une liste de Groove
- Skip=A ou Skip=A,B pour ne pas appliquer les modicitaton à une liste de Groove 


### Supprimer les grooves

GrooveClear permet de ne plus utiliser les Groove qui ont été chargés en mémoire. Cette instruction peut être utile
quand on désire changer de Groove après une introduction. L'utilisation de GROOVECLEAR efface les données existantes ainsi que les
alias de Groove et force une relecture du fichier de la bibliothèque.
Veuillez noter que les paramètres de bas niveau tels que les affectations de pistes MIDI ne sont pas modifiés par cette commande.
Les alias Groove sont également supprimés avec cette commande.
Les paramètres de bas niveau tels que les affectation de pistes MIDI ne sont pas modifiés par cette commande. 


### Les sticky Grooves

On peut vouloir qu'une piste soit invisible aux mécanismes de Groove par exemmple pour une piste de clic.
La piste ClicTest sera définiee comme : 

~~~mma
Drum-Test Sticky True
~~~
- La piste Sticky peut également prendre les valeurs **False**, **On**,  **1**, **Off** ou **0** 

### Noms de Groove identiques 

Si deux Grooves identiques sont définis dans deux Fichiers mma,  on doit faire précéder juste avant l'appel du groove la directive

~~~mma
use  fichier-voulu
~~~

La directive **use**  va lire le fichier spécifié et écraser l'ancienne définition de "Rhumba2" et le remplacer


## Les Grooves par famille

Attention aucun nom de Groove ne doit prendre un caractère -, si dans la liste ci-dessous des noms de Groove aparaissent 
avec un tel caractère, il ne peut s'agir que d'une coupure de mot arbitraire.


### Alexis 

hiphop teamtechno 

### Casio

16beat1 16beat2 16beat3 16beatballad1 16beatballad2 16beatballad3 16shuffle1 16shuffle2 60spop 60srock 60ssoul 68ballad 80spop 8beat1 8beat2 8beat3 8beatballad1 8beatballad2 8beatballad3 8beatdance 8beatpop1 8beatpop2 8beatpop3 ambient1 ambient2 ambient3 blues dance1 dance2 dancepop1 dancepop2 dancepop3 digitalrock discosoul electricpop fastbigband foxtrot funk1 funk2 fusion germanmarch heavymetal hip-hop house jazzcombo jazzwaltz latinfusion latinhouse march1 mellowrb middlebigband modernjazz modernrb oldieballad polkafox polka popballad pop poppolka poprock1 poprock2 popshuffle1 popshuffle2 popwaltz quickstep rave r+b rock1 rock2 serenade shuffleboogie shufflerock slow16beat slowbigband slowrock slowswing soul soulpop swing techno trance1 trance2 triphop twist worldpop

### Kara

2beatp 8beatmotown fasttwist happyshuffle K50s_rock kbossa Kfunk1 kwestballad twi


### pflib

16beat1 16beat2 8beat1 8beat2 highfive metal1 metal2 rock1 slowrock 

### stdlib

0srock 60srock 68march 68swing 8beat afro-cuban arpeggio44 arpeggio68 arpeggiowaltz ballad128 ballad68 ballad basicrock bebop beguine bigband bluefolk bluegrass blues128 blues68 blues boggiewoggie bolero boneym bossanova broadway broadwaywaltz bubblerock bvfunk bwmarch calypso chacha charleston click countryblues countryswing countrywaltz cubanguitar descendingjazz desert dixiemarch dixie doowop dsoul easyswing eewaltz evansish fastblues fastjazzwaltz fastswing fastwaltz folkballad folk folkrock folkyjazz foxtrot frenchwaltz guitarballad gypsyjazz hillcountry hymn jazz-54 jazzcombo jazzguitar jazzrhumba jazzrock jazzwaltz jive latinwaltz lfusion lighttango lullaby mambo march mellowjazz merengue metronome3 metronome68 metronome6 metronome modernjazz modernjazzwaltz nitejazz none pianoballad polka popballad popspiritual quickstep ragtime rbballad rb rhumba rock-128 rockballad rockwaltz salsa samba showtune shuffleboggie ska slowblues slowbolero slowbroadway slowcountry slowdesert slowjazz slowspiritual softrock softshoe son spiritual stringballad strut swing tango trance twist vienesewaltz waltz westernswing zydeco 

### Yamaha

jazzbasie jazzbossa jazzbouncy jazzcountry vi  jazzswing jazztrio jazzwaltz mambo quando-g.s280 salsa1 salsa2 western w-rock

### Zoom 

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

- C'est une commande ajoutée par les auteurs de ce manuel.


## Travaux pratiques Groove contre mélange des Groove


Comparer l'écoute des deux fichiers suivants 

- Fichier monoGroove

~~~MMA
Tempo 120
Groove Swing

1 Abm   Dbm
2 Eb7   Abm
3 Dbm   Gb
4 B7    Ab7
5 Dbm   Gb
6 B7    Ab
7 Db7   Gb
8 Gb    B7
~~~

- Fichier multiGroove

~~~MMA
Tempo 120
Groove Swing CountrySwing Swing CountrySwing / Swing /

1 Abm   Dbm
2 Eb7   Abm
3 Dbm   Gb
4 B7    Ab7
5 Dbm   Gb
6 B7    Ab
7 Db7   Gb
8 Gb    B7
~~~


## Afficher les instruments d'un groove


- La commande  suivante affiche toutes les informations utiles : 

~~~mma
mma -k fichier.mma
~~~

- Nous allons utiliser la commande grep linux pour filter les différentes pistes créées : 
- La commande suivante affiche les différentes pistes créées

~~~
mma -d Court.mma  | grep Creating

Creating new track DRUM
Creating new track SCALE
Creating new track BASS
Creating new track ARPEGGIO
Creating new track CHORD
Creating new track WALK
Creating new track DRUM-PHH
Creating new track DRUM-OHH
Creating new track DRUM-KICK
Creating new track DRUM-SIDE
Creating new track DRUM-LOWCONGA
Creating new track DRUM-HICONGA
Creating new track CHORD-GUITAR
Creating new track CHORD-SUS
Creating new track DRUM-RIDEC
Creating new track CHORD-SAX
Creating new track DRUM-SNARE
~~~

- La commande suivante montre les canaux MIDI assignés 
    - le canal dix est assigné à toutes les percussion s KICK, SODE, LOWCONGA etc ..
    - le canal 16 à la basse
    - le canal 15 aux accords 
    - le canal 16 aux accords guitare

~~~mma
mma -d Court.mma  | grep assigned

MIDI Channel 10 assigned to DRUM
MIDI Channel 10 assigned to DRUM-PHH
MIDI Channel 10 assigned to DRUM-OHH
MIDI Channel 10 assigned to DRUM-KICK
MIDI Channel 10 assigned to DRUM-SIDE
MIDI Channel 10 assigned to DRUM-LOWCONGA
MIDI Channel 10 assigned to DRUM-HICONGA
MIDI Channel 10 assigned to DRUM-RIDEC
MIDI Channel 10 assigned to DRUM-SNARE
MIDI Channel 16 assigned to BASS
MIDI Channel 15 assigned to CHORD
MIDI Channel 14 assigned to CHORD-GUITAR
~~~

- La commande suivante affiche les différents volumes volume : 40 40 40 40 chaque pattern

~~~
mma -d Court.mma  | grep " Volume"

mma -d Court.mma  | grep " Volume"
Set DRUM-PHH Volume to: 40 40 40 40
Set DRUM-OHH Volume to: 40 40 40 40
Set DRUM-KICK Volume to: 70 70 70 70
Set DRUM-SIDE Volume to: 70 70 70 70
Set DRUM-LOWCONGA Volume to: 130 130 130 130
Set DRUM-HICONGA Volume to: 130 130 130 130
Set CHORD Volume to: 70 70 70 70
Set CHORD-GUITAR Volume to: 70 70 70 70
Set BASS Volume to: 110 110 110 110
Set WALK Volume to: 110 110 110 110
Set ARPEGGIO Volume to: 40 40 40 40
Set CHORD-SUS Volume to: 40 40 40 40
Set WALK Volume to: 110 110 110 110
Set CHORD Volume to: 40 40 40 40
Set CHORD-SAX Volume to: 10 10 10 10
Set WALK Volume to: 110 110 110 110
Set BASS Volume to: 110 110 110 110
Set CHORD Volume to: 110
Set SCALE Volume to: 70 70 70 70
~~~

- La commande suivante affiche la liste de tous les réglages par catégorie 

~~~
mma -d Court.mma   | sort
~~~


## Les instruments MIDI 


- Les instruments peuvent être sélectionné par leur nom donné dans la colonne Nom Anglais ou par leur numéro donné dans la colone Numéro.

| Catégorie | Numéro | Nom anglais  |   Nom français |
|:---------|:----------|:------------|:--------------|
| Pianos	| 1	         | AcousticGrandPiano	| Piano|
| Pianos	| 2	| BrightAcousticPiano	|Piano brillant |
| Pianos    |	3	|Electric Grand Piano	|Piano |
| Pianos    |	4	|Honky-tonkPiano	|Piano honky-tonk|
| Pianos    |	5	|ElectricPiano1	|Piano électrique 1|
| Pianos    |6	|ElectricPiano2	|Piano électrique 2|
| Pianos    |	7|	Harpsichord	|Clavecin|
| Pianos|	8|	Clavinet	|Clavinet|
| Percussions | 9 | Celesta | Célesta |
| Percussions| 10 | Glockenspiel | Glockenspiel |
| Percussions | 11 | MusicBox | Boîte à musique |
| Percussions | 12 | Vibraphone | Vibraphone |
| Percussions | 13 | Marimba | Marimba |
| Percussions| 14 | Xylophone | Xylophone |
| Percussions | 15 | TubularBells | Cloches tubulaires |
| Percussions| 16 | Dulcimer | Cymbalum / Dulcimer |
| Orgues | 17 | DrawbarOrgan | Orgue Hammond |
| Orgues | 18 | PercussiveOrgan | Orgue percussif |
| Orgues | 19 | RockOrgan | Orgue rock |
| Orgues | 20 | ChurchOrgan | Orgue d’église |
| Orgues | 21 | ReedOrgan | Harmonium |
| Orgues | 22 | Accordion | Accordéon |
| Orgues | 23 | Harmonica | Harmonica |
| Orgues | 24 | TangoAccordion | Accordéon tango |
| Guitares | 25 | AcousticGuitar(nylon) | Guitare nylon |
| Guitares | 26 | AcousticGuitar(steel) | Guitare folk  |
| Guitares | 27 | ElectricGuitar(jazz) | Guitare jazz |
| Guitares | 28 | ElectricGuitar(clean | Guitare électrique |
| Guitares | 29 | ElectricGuitar(muted) | Guitare mutée |
| Guitares | 30 | OverdrivenGuitar | Guitare overdrive |
| Guitares | 31 | DistortionGuitar | Guitare saturée |
| Guitares | 32 | GuitarHarmonics | Harmoniques guitare |
| Basses | 33 | AcousticBass | Contrebasse |
| Basses | 34 | ElectricBass(finger) | Basse élec. doigt |
| Basses | 35 | ElectricBass(pick) | Basse élec. médiator |
| Basses | 36 | Fretless(Bass) | Basse fretless |
| Basses | 37 | SlapBbass1 | Slap bass 1 |
| Basses | 38 | SlapBass2 | Slap bass 2 |
| Basses | 39 | SynthBass1 | Basse synthé 1 |
| Basses | 40 | SynthBass2 | Basse synthé 2 |
| Cordes | 41 | Violin | Violon |
| Cordes | 42 | Viola | Alto |
| Cordes | 43 | Cello | Violoncelle |
| Cordes | 44 | Contrabass | Contrebasse section |
| Cordes | 45 | TremoloStrings | Cordes trémolo |
| Cordes | 46 | PizzicatoStrings | Cordes pizzicato |
| Cordes | 47 | Orchestral Harp | Harpe |
| Cordes | 48 | Timpani | Timbales |
| Ensembles | 49 | StringEnsemble1 | Ensemble cordes 1 |
| Ensembles | 50 | StringEnsemble2 | Ensemble cordes 2 |
| Ensembles | 51 | SynthStrings1 | Cordes synthé 1 |
| Ensembles | 52 | SynthStrings2 | Cordes synthé 2 |
| Ensembles | 53 | ChoirAahs | Chœur Aahs |
| Ensembles | 54 | VoiceOohs | Chœur Oohs |
| Ensembles | 55 | SynthVoice | Voix synthé |
| Ensembles | 56 | OrchestraHit | Coup d’orchestre |
| Cuivres | 57 | Trumpet | Trompette |
| Cuivres | 58 | Trombone | Trombone |
| Cuivres | 59 | Tuba | Tuba |
| Cuivres | 60 | MutedTrumpet | Trompette bouchée |
| Cuivres | 61 | FrenchHorn | Cor français |
| Cuivres | 62 | BrassSection | Section cuivres |
| Cuivres | 63 | SynthBrass 1 | Cuivres synthé 1 |
| Cuivres | 64 | SynthBrass 2 | Cuivres synthé 2 |
| Bois / anches | 65 | SopranoSax | Sax soprano |
| Bois / anches | 66 | AltoSax | Sax alto |
| Bois / anches | 67 | TenorSax | Sax ténor |
| Bois / anches | 68 | BaritoneSax | Sax baryton |
| Bois / anches | 69 | Oboe | Hautbois |
| Bois / anches | 70 | EnglishHorn | Cor anglais |
| Bois / anches | 71 | Bassoon | Basson |
| Bois / anches | 72 | Clarinet | Clarinette |
| Flûtes | 73 | Piccolo | Piccolo |
| Flûtes | 74 | Flute | Flûte |
| Flûtes | 75 | Recorder | Flûte à bec |
| Flûtes | 76 | PanFlute | Flûte de pan |
| Flûtes | 77 | BlownBottle | Bouteille soufflée |
| Flûtes | 78 | Shakuhachi | Shakuhachi |
| Flûtes | 79 | Whistle | Sifflet |
| Flûtes | 80 | Ocarina | Ocarina |
| Leads synthé | 81 | Lead1(Square) | Lead carré |
| Leads synthé | 82 | Lead2(Sawtooth | Lead dent de scie |
| Leads synthé | 83 | Lead3(Calliope) | Lead calliope |
| Leads synthé | 84 | Lead4(Chiff) | Lead chiff |
| Leads synthé | 85 | Lead5(Charang) | Lead charang |
| Leads synthé | 86 | Lead6(Voice) | Lead voix |
| Leads synthé | 87 | Lead7(Fifths) | Lead quintes |
| Leads synthé | 88 | Lead8(Bass+Lead) | Lead basse+solo |
| Pads | 89 | Pad1(neage) | Pad new age |
| Pads | 90 | Pad2(warm) | Pad warm |
| Pads | 91 | Pad3(polysynth) | Pad polysynth |
| Pads | 92 | Pad4(choir) | Pad chœur |
| Pads | 93 | Pad5(bowed) | Pad frotté |
| Pads | 94 | Pad6(metallic) | Pad métallique |
| Pads | 95 | Pad7(halo) | Pad halo |
| Pads | 96 | Pad8(sweep) | Pad sweep |
| FX | 97 | FX1(rain) | Effet pluie |
| FX | 98 | FX2(soundtrack) | Bande son |
| FX | 99 | FX3(crystal) | Cristal |
| FX | 100 | FX4(atmosphere) | Atmosphère |
| FX | 101 | FX5(brightness) | Brillance |
| FX | 102 | FX6(goblins) | Goblins |
| FX | 103 | FX7(echoes) | Échos |
| FX | 104 | FX8(sci-fi) | Science-fiction |
| Ethniques | 105 | Sitar | Sitar |
| Ethniques | 106 | Banjo | Banjo |
| Ethniques | 107 | Shamisen | Shamisen |
| Ethniques | 108 | Koto | Koto |
| Ethniques | 109 | Kalimba | Kalimba |
| Ethniques | 110 | Bagpipe | Cornemuse |
| Ethniques | 111 | Fiddle | Violon folk |
| Ethniques | 112 | Shanai | Shanaï |
| Percussions / FX | 113 | Tinkle Bell | Clochette |
| Percussions / FX | 114 | Agogo | Agogo |
| Percussions / FX | 115 | SteelDrums | Steel drums |
| Percussions / FX | 116 | Woodblock | Woodblock |
| Percussions / FX | 117 | TaikoDrum | Tambour taiko |
| Percussions / FX | 118 | MelodicTom | Tom mélodique |
| Percussions / FX | 119 | SynthDrum | Batterie synthé |
| Percussions / FX | 120 | ReverseCymbal | Cymbale inv |
| Bruitages | 121 | GuitarFretNoise | Bruit de frettes |
| Bruitages | 122 | BreathNoise | Souffle |
| Bruitages | 123 | Seashore | Vagues |
| Bruitages | 124 | BirdTweet | Chant d’oiseau |
| Bruitages | 125 | TelephoneRing | Sonnerie téléphone |
| Bruitages | 126 | Helicopter | Hélicoptère |
| Bruitages | 127 | Applause | Applaudissements |
| Bruitages | 128 | Gunshot | Coup de feu |
