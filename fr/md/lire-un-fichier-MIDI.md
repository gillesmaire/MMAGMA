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

Dans ce cas les notes du canal 1 seront insérées dans la pistes SOLO-TENOR


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


