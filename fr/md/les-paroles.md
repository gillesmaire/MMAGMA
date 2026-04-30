# Les paroles

## Une possibilité limitée

Il est possible d'inclure les paroles dans un fichier MIDI pour permettreà certains séquenceurs 
ou logiciels MIDI de les afficher en synchronisation avec la musique.

Dans le cas de l'utilisation de Chord V par exemple, nous disposons des paroles mais les fichiers textes ne
respectent pas les syntaxes que nous allons énoncer dans ce chapitre.

## Les options Lyrics

- **Lyric Off** et **Lyric On** permettent respectivement de supprimer ou de garder les paroles dans les fichiers
MIDI
- Les évènements **Lyric EVENT=LYRIC** et **Lyric EVENT=TEXT** permettent respectivmeent  de sélectionner le mode 
LYRIC qui est le mode par défaut ou le mode TEXTE. Certains logiciels considèrent que chaque syllabe distincte servira
de repère, d'autres que la synchronisation devra se faire par un marqueur FF 05  dans le texte, ce dernier cas correspond 
au mide LYRIC.
- **KARMODE=On** dans ce mode l'extention du nom de fichier n'est pas MID mais KAR qui présentent certaines 
particularité notamment le non respect du marqueur de synchronisation FF 05. Dans le mode KAR les syllabes des paroles 
sont séparées par "-". Dans le fichiers car les traits d'union doivent être précédés du caractère "\". Par défaut le mode KARMODE est positionné à OFF
- **Lyric SPLIT=BAR** ou  **Lyric SPLIT=NORMAL** les paroles doivent être divisées en syllabes mais on peut mettre syllabes
dans une BAR en entourant ces syllabes par **Lyric SPLIT=BAR**  puis par  **Lyric SPLIT=NORMAL**
- **Lyric CHORDS=On** dans ce mode les noms d'accord qui ont été comuniqué au synthétiseur MIDI sont gardés dans le texte,
par exemple pour les musicien dans l'autre mode **Off** qui est le mode par défaut ces noms sont supprimés.
- **Lyric CHORDS=On Transpose=2** permet de transposer un accord, qui ne ttient pas compte du paramètre global Transpose. S'il faut ajouter bémol ou dièse, on doit rajouter CNames=Flat, de la façon suivant : Lyric CHORDS=On Transpose=2 CNames=Flat 


## Mise en place des accords

L'ajout des paroles est assez simple. Chaque mesure est délimitée par des crochets ouvrants ou fermants: 

~~~mma
z [ Bonjour ]
C [ C'est encore moi ]
E7 [ Il fait encore noir \r]
C [ Ce jour ] 
E [ D'au revoir ] 
~~~

On peut aussi utiliser la méthode alternative basée sur la  directive lyrics qui peut se trouver n'importe où sur la lignes.
Le signe = n'est pas permis dans les paroles.

~~~mma
A/Am/ Lyrics set Bonjour mes amis
~~~

Les caractères \\r et \\n sont autorisés 


