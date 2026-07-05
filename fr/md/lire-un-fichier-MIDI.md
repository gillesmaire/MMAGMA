# Lire un fichier MIDI


## Présentation

MMA sait inclure un dichier MIDI à n'importe quel endroit d'un morceau. Ce fichier MIDI peut être joué en SOLO en même temps que le morceau ou remplir une section à lui tout seul.

L'inclusion de la commande MIDI peut contenir des options que nous allons détailler dans ce chapître.

Nous verrons que le fichier MIDI peut être inséré comme un Solo ou une Mélodie avec les options propres à chacune de ces entités.

Pour inclure un fichier midi nous devons au minimum : 

- donner le nom du fichier à inclure (cela sera fait par l'option FILE)
- spécifier une ou plusieurs pistes sur lesquelles le fichier va être inséré

Si le fichier MIDI contient plusieurs pistes on peut spécifier les pistes que l'on veut insérer.



## La commande d'inclusion d'un fichier MIDI

Voici plusieurs exemples d'inclusion de fichier MIDI 

~~~mma
MIDIInc FILE=fichier.mid DRUM=10 
~~~

Dans ce cas les notes du canal 10 seront insérées dans la piste DRUM. Si cette piste d'existe pas elle sera créée

~~~mma
MIDIInc FILE=fichier.mid SOLO-TENOR=1 
~~~

Dans ce cas les notes du canal 1 seront insérées dans la piste oui SOLO-TENOR


Le chemin du fichier peut être donné en suivant la syntaxe Python à savoir :

- Le séparateur de dossiers et de fichier est le symbole / 
- le symbole ~ désigne votre répertoire d'accueil 

Exemple : 

~~~mma
MIDIInc FILE=~/Musique/compos/midyfile.mid
~~~


## Autres paramètres

### VOLUME 

L'ajustement du volume du fichier MIDI inséré se fait comme un pourcentage. En dessous de la valeur 100 le volume est baissé en dessus de 100 il est monté. 

Ainsi l'argument VOLUME à 120 prendra 20 % de volume supplémentaire.

### STRETCH

Une valeur de 1 à 500 permet de ralentir ou d'accélérer le tempo du morceau. Une valeur de 50 rendra le morceau deux fois plus lent alors qu'une valeur à 200 le rendra 2 fois plus rapide. Les valeurs autorisées vont de 1 à 500.

### OCTAVE

Les valeurs de -4 à 4 permettent de monter ou baisser d'un octave toutes les notes du fichier. 
Cela ne s'applique pas aux batteries et percussions. Il ne faut pas penser que OCTAVE = 2 va positionner les notes à l'octave 2 mais bien transposer toutes les notes de 2 octaves au dessus


### TRANSPOSE 

Les valeurs de -24 à 24 permettent de transposer d'autant de demi tons que demandé. C'est donc plus fin que la notion d'octave. Transpose=12 va monter toutes les notes d'un octave.

Là encore la piste 10 n'est pas affectée.

### LYRIC 

Cette option permet de garder les éventuelles paroles du morceau dans le fichier MIDI, si elles sont destinées à un équipement qui sait par exemple les afficher.


Les valeurs sont ON ou OFF qui est est la valeur par défaut. 

### TEXT

Cette option permet de conserver les commentaires, les annotations et autres textes qui ne sont pas les paroles.

Par défaut la valeur est OFF

## Sélection des pistes 


On peut sélectionner une ou plusieurs pistes que l'on veut jouer. Par exemple l'option DRUM=10, chaque notre du canal 10 seront
insérée dans la piste MMA DRUM. L'option SOLO-TENOR=1 copiera les notes du canal 1 vers la piste SOLO-TENOR.

Si la piste SOLO-TENOR ou la piste DRUM ne sont pas présentes elles seront créées.

Cela donnera une syntaxe du style : 

~~~mma
MIDIinc File=test.mid Solo-Piano=1 Drum=10 Volume=70 
~~~


On peut ajouter à cette notation 
### Riff 

### Sequence

### Print



## Intervalles


### Unité de mesure 

Pour les intervalles définis par START  START, END and OFFSET décrits ci-dessous, les unités données  peut être :

- une mesure quand on ajoute la lettre m ou M
- un tick MIDI quand on utilise la lettte t ou T 
- un temps quand on utilise la lettre b ou B

Lorsqu'on omet de préciser l'unité c'est la mesure qui est appliquée 


### START

Permet de définir la mesure où l'on veut démarrer. START = 4 signifie que l'on commence au quatrième temps. On peut spécifier START = 4b ou START = 4B pour signifier 4 noires
oui 4

### END
   
Permet d'arrêter le morceau après le nombre de mesures donné.

### OFFSET

Donne la position en mesures du point d'insertion. 

### IGNOREPC
    
Permet d'ignprer les ordre MIDI Program Change qui provoque des changements d'instruments. Cela permet 
de jouer la mélodie sans se soucier du type d'instrument.


### STRIPSILENCE

On peut également spécifier le nombre de tick MIDI à enlever par exemple : 


~~~mma
STRIPSILENCE=120
~~~


## OUtils de Débug


### VERBOSE

Affiche des informations de debugage à la console. 

Par défaut la valeur est OFF on peut activer cette option par 

~~~mma
VERBOSE=ON
~~~

### REPORT

Affiche un rapport sur le terminal sans aucune donnée MIDI 



