# Les variables


## Définition d'une variable

MMA utilise des variables internes et vous permet de définir vos propres variables.

Ces variables pourront être testées pour effectuer des actions conditionnelles et elles
peuvent également contenir des séquences d'accords plus ou moins complexes.


Voici quelques règles qui régissent ces variables : 

- les noms de variable ne sont pas sensibles à la casse.
- ces noms ne peuvent pas commencer par les caractères $ et _
- ces noms ne peuvent pas commencer les caractères [ et ] 

La variable est définie par la syntaxe : 

~~~mma
set MaVariable D / C /
~~~

Ensuite elle sera utilisée avec le caractère $ devant. Ainsi si on rencontre dans le fichier MMA
la variable $MaVariable elle sera dans l'exemple précédent replacé par D / C /


Le caractère $ définissant une variable doit être

- précédé d'un caractère espace à moins que le $ soit en début de ligne
- être suici d'un caractère espace ou d'un caractère fin de ligne

La ligne suivante : 


~~~mma
1 $MaVariable
~~~

Sera comprise comme 

~~~mma
1 D / C / 
~~~

### La commande Set

La commande Set permet comme nous l'avons vu d'assigner une variable avec d'éventuels calculs :

~~~mma
set a $varialble
~~~

On peut concaténer une variable et une autre variable ou une constante par utilisaion du caractère +

~~~mma
set a $Groove + Sus
~~~

### NewSet

La commande NewSet permet de créer la variable sauf si elle est déjà allouée. Dans ce cas elle garde
sa valeur qui est la sienne. 


### Mset 

MSet fonctionne comme la variable Set mais permet l'affectation d'une valeur sur plusieurs lignes : 

~~~mma
mset PLusieursLignes 
1 C
2 G
3 C
MsetEnd
~~~

Le mot MsetEnd outre le fait qu'il peut être en majuscule ou minuscule sur chacune de ces lettres peut aussi 
être écrit EndMset.

Par contre les variables comprises entre le MSet et MSetEnd seront étendues

### RndSet

La commande RndSet permet de sélectionner une valeur aléatoire entre plusieurs : 


~~~mma
RndSet Var 1 2 3
~~~


Ceci donnera à la variable $var l'une des valeur 1 2 ou 3

Cela peut s'appliquer à un groove par la syntaxe

~~~mma
RndSet Grv Groove1 Groove2 Groove3
~~~

et en utilisant 

~~~mma
Groove $Grv
~~~

Ce qui peut se déclarer égakement par la syntae

~~~mma
RndSet Grv Groove1 Groove2 Groove3
~~~


### Supprimer une variable


Pour supprimer une variable préalablement affectée : 

~~~
UnSet variable
~~~


### Afficher une variable 

ShowVars permet d'afficher une variable à l'écran. 

La commande ShowVars suivie d'une ou plusieurs noms de variables non
précédées du caractères $ afficher la valeur de ces variables.

~~~
ShowVars Gev Count
   $Gev: hello
   $COUNT: 12
~~~


Si on ne précise aucun arguement à afficher, toutes les variables seront affichées.

### Commandes d'incrémentation et de décrémentation


Les commandes Inc et Dec permettent d'incrémenter  ou de décrémenter des variables de types numériques

Sans argument l'incrémentation ou la décrémentation sera d'une unité, suivi d'une valeur
numérique l'incrémentation ou da décrémentation se fera de cette valeur.

~~~mma
Set count 3
Inc count  
Inc count 2
~~~

Dans cet exemple count vaudra 6 en sortie.


### Expansion des variables


L'expansion est par défaut active ce qui veut dire que la syntaxe suivante 

~~~mma
set Intro Am Em
set Final Am Am
set Sequence $Intro $Final 
~~~

donnera à Sequence la valeur Am Em Am am 

Par contre, si on force expension à off par la syntaxe

~~~mma
VExpand off
~~~

L'instruction 

~~~
set Sequence $Intro $Final 
~~~


donnera à la variable Sequence la valeur $Intro $Final

Pour reforcer l'expansion à on il faudra utiliser la syntaxe

~~~mma
Vexpand on
~~~




Elle peut être rendue inactive par la syntaxe


~~~mma
VExpand Off
~~~

Puis on peut la rendre à nouveau active par la syntaxe

~~~mma
Vexpand On
~~~


### Stack Value

Stack Value permet de sauvegarder plusieurs lignes de code dans une variable.

Par exemple on sauvegarde les lignes de code dans la variable  $_SwingMode


~~~mma
StackValue $_SwingMode
SwingMode On
Begin Drum Define
  Swing8 1 0 90 * 8
End
~~~

Pour récupérer les lignes de code de la variabl $_SwingMode on utilisera la syntaxe : 

~~~mma
SwingMode $_StackValue
~~~

## Les Variables prédéfinies 

Un certain nombre de variables sont prédéfinies et reconnaissables par le fait que leur 
nom commence par le caractère _.

Voici la liste de ces variables 

| Variable       |     Signification                                    |
|:---------------|:-----------------------------------------------------| 
| $_AutoLibPath  | la valeur de AUTOLIBPATH                             | 
| $_BarNum       | nombre de mesures d'un morceau                       |
| $_ChordAdjust  | ajustement des accords                               |
| $_CTabs        | liste des time-set                                   |
| $_DataPlugins  | liste des plugins enregistrés                        |
| $_DateDate     | date au format yyyy-mm-dd                            |
| $_DateTime     | heure u format hh-mm-ss                              |
| $_DateYear     | année au format yyyy                                 |
| $_Debug        | état des valeurs de debug                            |
| $_FileName     | nom du fichier en cours de traitemetnt               |
| $_Env(VAR)     | valeur de la variable du shell courant               |
| $_Groove       | nom du groove actuel                                 |
| $_Groovelist   | liste de tous les noms de groove définis             |
| $_KeySig       | signature du morceau si définie                      |
| $_IncPath      | liste des Paths utilisés pour l'inclusion            |                                        
| $_LastGroove   | dernier groove sélectionné avant l'actuel            |                                         
| $_LastVolume   | derner volume utilisé avant l'actuel                 |
| $_LibPath      | valeur de la variable LIBPATH                        |
| $_LineNum      | numéro de la ligne courante dans le fichier MMA      |
| $_Lyric        | état de la variable LYRIC                            |
| $_MMAPath      | emplacement sur le disque des fichiers MMA           |
| $_MIDIassigns  | liste des canaux MIDI utilisés et des pistes MMA     |
| $_MIDISplit    | liste des SPLITSCHANNELS                             |
| $_MIDIPlayer   | nom du player MIDI                                   |
| $_NoteLen(n)   | retourne la durée en ticks MIDI d'une unité de note  |
| $_OutPath      | retourne la valeur de la variable OUTPATH            |
| $_Plugin       | liste des plugin enregistrés                         |
| $_PWD          | répertoire de travail courant                        |
| $_TrackPlugins | liste des plugins de pistes enregistrés              | 
| $_Seq          | valeur de SEQ courant                                |
| $_SeqRnd       | valeur de SEQRND courant                             |
| $_SeqRndWeight | valeur de SEQRNDWEIGHT                               |
| $_SeqSize      | valeur de SESSIZE                                    |
| $_SwingMode    | On ou  Off du mode Swing                             |
| $_StackValue   | valeur de  STACKVALUE                                |
| $_SongPath     | nom du fichier incluant le chemin de ce fichier      |
| $_Tempo        | tempo courant                                        |
| $_TickPos      | positon en tick MIDI                                 |
| $_Time         | nombre de noires par mesure                          |
| $_TimeSig      | dernière valeur de TIMESIG                           | 
| $_ToneTr       | valeur de TONETR                                     |
| $_Tracklist    | liste de tous les noms de pistes présente            |
| $_Transpose    | valeur de TRANSPOSE                                  |
| $_VExpand      | valeur On ou Off de la macro VEXPAND                 |
| $_VoiceTr      | valeur de tous les paramètres de settings            |
| $_Volume       | valeur du volume global                              |
| $_VolumeRatio  | valeur de ADJUSTVOLUME                               |


## Les variables de type NOMPISTE

Ces variables de la forme $_NOMPISTE_parametre permettent d'accéder au parametre de chaque piste NOMPISTE

Par exemple si BASS_MIDIVolume est 0

On peut récupérer cette valeur par la variable $_BASS_MIDIvolume

Voici la liste de ces variables : 


~~~mma
  $_NOMPISTE_Accent
  $_NOMPISTE_Articulate
  $_NOMPISTE_Channel
  $_NOMPISTE_Compress
  $_NOMPISTE_Delay
  $_NOMPISTE_Direction
  $_NOMPISTE_DupRoot (uniquement pour les pistes Chord)
  $_NOMPISTE_Harmony
  $_NOMPISTE_HarmonyOnly
  $_NOMPISTE_HarmonyVolume
  $_NOMPISTE_Invert
  $_NOMPISTE_Limit
  $_NOMPISTE_Mallet (uiqueent pour les pistes Solo et Melody) 
  $_NOMPISTE_MidiNote
  $_NOMPISTE_MOctave
  $_NOMPISTE_MIDIVolume
  $_NOMPISTE_NoteSpan
  $_NOMPISTE_Octave
  $_NOMPISTE_Ornament
  $_NOMPISTE_Plugins
  $_NOMPISTE_Range
  $_NOMPISTE_RDuration
  $_NOMPISTE_Rpitch
  $_NOMPISTE_Rskip
  $_NOMPISTE_Rtime
  $_NOMPISTE_Rvolume
  $_NOMPISTE_SeqRnd
  $_NOMPISTE_SeqRndWeight
  $_NOMPISTE_Sequence
  $_NOMPISTE_Span
  $_NOMPISTE_Sticky
  $_NOMPISTE_Strum
  $_NOMPISTE_StrumAdd
  $_NOMPISTE_Tone (seulement pour les pistes Drum) 
  $_NOMPISTE_Trigger
  $_NOMPISTE_Unify
  $_NOMPISTE_Voice
  $_NOMPISTE_Voicing (seulement pour les piostes Chord) 
  $_NOMPISTE_Volume
~~~


Voici un exemple usuel 


~~~
Begin Bass
  Voice AcousticBass
  Octave 3
End
Begin Walk
  ChShare Bass
  Voice $_Bass_Voice
  Octave $_Bass_Octave
End 
~~~


## Indexation et intervalle de variables 

Chaque variable disponible sous forme de liste  dispose de deux options : 

- Indexation : permettant de récupérer la valeur d'un index dans la liste
- intervalle : permettzant de drécupérer l'intervalle de valeur de la liste

Si une variable dispose d'un seul élément cet indexation ou cet intervalle ne sont plus utilisable.



Prenons une Variable Volume déclarée comme 

~~~mma
Bass Volume m mf p mp 
~~~


- print $Bass_volume :  va afficher 100 110 40 70 sachant que ce sont les valeurs de mezzo, mezzo forte, piano, piano forte 
- print $Bass_volume[1:3] va afficher 110 40
- print $Bass_volume[2] va afficher 40
- print $Bass_volume[-1] va afficher 70
- print $Bass_volume[] va afficher le nombre d'élément c'est à dire 4



## Expressions mathématiques 


Une expression mathématique se présente sous la forme $(calcul) 
Par exemple 

~~~mma
print $( 2 + 2 ) 
~~~

affichera 4

~~~mma
Tempo 120
Set V $( $_Tempo + 1)
print $V
~~~

affichera 121

On peut à l'intérieur du $() utiliser du code Python

## Expressions conditionnelles 

Les expressions conditionnelles sont caractérisées

- par la présence du mot If
- éventuellement du mot Else
- par la présence du mot EndIf ou de son équivalent IfEnd

Une condition suit le mot clé If qui peut être 

- **Def NomDeVariable :** qui retourne Vrai si la variable est définie
- **Ndef NomDeVariable :** qui retourne Vrai si la variable n'est pas définie
- **IsEmpty NomDeVariable :** qui retourne vrai si la variable existe mais qu'elle n'a pas de valeur assignée
- **IfNotEmpty NomDeVariable :** qui retourne vrai si la variable existe et qu'elle a une valeur assignée
- **Exists NomDeFichier :** qui retourne vrai si le fichier existe
- **IsFile Chemin :** qui retourne vrai si le chemin est un  fichier 
- **IsDirPathname :* qui retourne vrai sir le chemin est un nom de répertoire

Les opérateurs de comparaisons sont : 

- **LT** pour <
- **LE** pour <=
- **EQ** pour == 
- **NE** pour != 
- **GT** pour > 
- **GE** pour <

Ces opérateurs comparente des chaînes de caractère par ordre alphabétique. 

Par exemple la ligne suivante  renverra vrai car en MMA Bonjour est pareil que bonjour


~~~
if EQ bonjour Bonjour 
~~~

Attention aux chaînes de caractères contenant des caractères blanc qui provoqueront des erreurs.


Une variable doit être donné sans caractère $ qui aurait juste comme effet de transformer la nom de la variable en sa valeur.
Ces opérateur trouven


Derrière un If on trouve une expression de test


Si une variable contient un caractère blanc par exmple si A vaut "un deux"
et B vaut 3 le test 

~~~
if LT $A $B
~~~

va provoquer une erreur car A va être étendu en "un deux trois" et cela fait 
un terme de trop pour la comparaison. 

Dans ce cas là il faut mettre deux $ devant le caractère A pour éviter l'erreur:


~~~mma
if LT $$A $B
~~~

Ce particularisme ne marque que pour l'instruction IF.

Les if imbriqués sont quant à eux autorisés.

## L'expression GoTo


L'expression GoTo permet de continuer à une ligne que l'on repère par une étiquette
ou par un numéro de ligne si on utiliose les numéros de lignes.


On peut placer une étiquette quelques part dans la liste des commandes par
la syntaxe : 

~~~mma
Label Etiquette1
~~~

- Le nom d'étiquette doit être unique dans le code
- Deux étiquette ne peuvent pas avoir le même numéro de ligne
- Les numéros de lignes que l'on peut entrer optionnellement peuvent être utilisée
dans un GoTO mais il faut alors veiller à ne pas avoir deux numéros de ligne
identiques.




