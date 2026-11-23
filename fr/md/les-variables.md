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

