# Présentation des pistes

## Les types de piste

Dans  un fichier MMA, une piste représente une partie musicale sous une des dix formes suivantes : 

- **Chord :** les accords sont joués par une justaposition de notes
- **Bass :** les notes d'un instrument de basse (contrebasse, basse, hélicon) sont jouées en commençant souvent par la fondamentale.
- **Drum :** la batterie ou les percussions sont jouées et correspondent  en général au canal MIDI 10
- **Arpeggio :** les accords sont joués en arpèges
- **Melody :** les notes de la mélodie sont fournies note par note
- **Solo :** permettent des ornements solo 
- **Walk:** les notes de la basse avancent note par note généralement sur chaque temps en reliant les accords entre eux
- **Scale :** les motifs mélodiques sont construits à partir de la gamme associée à l’accord, généralement de façon répétitive et rythmique.
- **Plectrum :** motif de l'accord est joué note par note comme un coup de médiator
- **Automatic Melody :** les notes sont trouvées par MMA de façon automatique.


Les noms des instruments correspondent aux instuments MIDI disponibles sur vote banque MIDI.

Chaque type de piste est régi par son propre algorithme. 

Chaque piste peut donner naissance à des sous pistes et ce de façon illimitée. Les sous pistes sont créées
en ajoutant un tiret suivi d'un complément de note que vous choisissez sachant que les noms des pistes sont
insensibles à la casse : 

~~~
Drum-1
Chord-Jim
Solo-Jimmy-Hendrix
~~~

Pour afficher les noms des pistes d'un morceau lancer mma avec l'option -a  le résulta sera présenté sous la forme 

~~~
Warning:   PLUGIN '/usr/share/mma/plugins' does not exist.

File 'Court.mma' parsed, but no MIDI file produced! 
Tracks allocated:
  ARPEGGIO        BASS            CHORD           CHORD-GUITAR   
  CHORD-SAX       CHORD-SUS       DRUM            DRUM-HICONGA   
  DRUM-KICK       DRUM-LOWCONGA   DRUM-OHH        DRUM-PHH       
  DRUM-RIDEC      DRUM-SIDE       DRUM-SNARE      SCALE          
  WALK           

Channel assignments:
  10  DRUM            DRUM-PHH        DRUM-OHH        DRUM-KICK      
      DRUM-SIDE       DRUM-LOWCONGA   DRUM-HICONGA    DRUM-RIDEC     
      DRUM-SNARE     
  14  CHORD-GUITAR   
  15  CHORD          
  16  BASS           
~~~

On voit dans cet exemple que la musique du fichier Court.mma utilise des pistes de base
(BASS,CHORD,...) suivie de pistes définies par le ou les Groove choisis par Court.mma. 
On remarque que le canal 10 est toujours assigné aux batteries.

On voit les canaux associés à chaque pistes.

De plus, nous devrons associer aux composants voulus un instrument et chaque piste possède
son propre instrument, son propre rythme et sa propre manière d'utiliser les accords du morceau.

Les Grooves définissent le rythme au moyen des mots Drum, Bass, Walk, Chord, Arpeggio, Scale,
Plectrum, Automatic Melody. Si aucun instrument n'est associé à ces mots clés, un instrument 
par défaut sera choisi par MMA.

Notons que Melody et Solo demandent de définir les notes une à une.

C'est dans le fichier mma que vous devez sélectionner les instuments comme indiqué dans le 
paragraphe suivant.


Chacun des dix chapitres qui suivent celui-ci détailleront les spécificités de chaque chapitre.

Les paragraphes suivants complètent les syntaxes propres à toutes les pistes.

## Définition des pistes 

Une piste se définit par son type suivi éventuellement de réglages.

Exemple :

```mma
Chord Voice Piano1
Bass Voice FingeredBass
Drum Voice StandardKit
```

Ici :

* la piste `Chord` utilise un piano
* la piste `Bass` utilise une basse électrique
* la piste `Drum` utilise une batterie standard



Ainsi, l'exemple de la chanson Court.mma peut être modifié pour changer les instruments par :

~~~mma
Tempo 120

Groove Swing

Bass Voice AcousticBass
Chord Voice GrandPiano

AllTracks  Volume 0 
Bass Volume 100 

 Abm   Dbm
 Eb7   Abm
 Dbm   Gb
 B7    Ab7
 Dbm   Gb
 B7    Ab
 Db7   Gb
 Gb    B7
 Dbm   Eb7
 Abm   Dbm
 Eb7   Abm
 Dbm   Eb7
 Abm   Dbm
 Abm
 Abm
 Abm
~~~

## Deux façons de configurer une piste 

Une piste dépend de plusieurs paramètres et chaque paramètre peut avoir plusieurs qualificateurs. 
Par exemple le paramètre Arpeggio que vous verrons plus loin et qui consiste à jouer les accords en arpège
peut avoir des paramètres comme Up ou Down pour jouer l'arpège de bas ou haut ou de haut en bas en plus 
d'autres paramètre comme **Voice** qui peut être **piano**, **guitar** ou autre

On peut déclarer ces paramètres de façon globale ou sous forme répétitive 

## Les silences

On peut génére un silence sur une piste de plusieurs façons :

- **OFF :** supprime la sortie sur toute la piste. Par exemple Bass Off
- **Seqence :** indique ce que joue la piste à chaque mesure. Par exemple Bass Sequence A B C D ( Mesure 1 A, Mesure 2 B etc ). 

On peut ainsi programmer un silence par la lettre z sur une mesure  par exemple sur la troisième par : Bass Seq A B z D

- On peut supprimer une séquence par SEQCLEAR : Drum SEQCLEAR
- Désactiver un canal MIDI en ajoutant le Canal 0: Arpeggio-1 Channel 0
- On peut supprimer le son sur une piste entière en lançant mma avec l'ption -T qui spécifie les pistes sur lesquelles il faut jouer

### Méthode globale 

~~~mma
Begin Arpeggio
    Voice Guitar1
    Type Up
End
~~~

### Méthode répétitive 

~~~mma
Arpeggio Voice Guitar1
Arpeggio Type Up
~~~


