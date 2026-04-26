# Premier fichier MMA

## Objectif

Dans ce chapitre, nous allons créer notre premier fichier MMA, le transformer en fichier MIDI et écouter le résultat.

Un fichier MMA est simplement un fichier texte contenant des commandes en mode texte. On peut le créer avec n'importe quel éditeur de texte.

Par exemple :

- sous Linux : Gedit, Kate, kwrite, Mousepad ou Vim ;
- sous Windows : Notepad ou Notepad++ ;
- sous macOS : TextEdit en mode texte.

Le fichier devra porter l'extension `.mma`.

Remarques : 

- Le fichier peut contenir des tabulations ou plusieurs caractères blancs consécutifs qui seront compris comme un seul espace.
- Les lignes vides sont ignorées
- On peut utiliser des commentaires :
    - Soit sur plusieurs lignes en encadrant par des commentaires de début /* et de fin */
    - Soit sur une seule ligne en par les caractères //
- Les mots clés peuvent être entrés en majuscules ou en minuscules ou même dans un mélange de minuscules et de majuscules
- True est équivalent 1 ou ON
- False est équivalent à 0 ou  OFF

## Création du fichier

Créons un fichier nommé `premier.mma` contenant :

~~~mma
Tempo 120

Groove Metronome2-4

1 C
2 F
3 G
4 C
~~~


- La commande Tempo 120 indique que le tempo est de 120 qui est la valeur par défaut. Cette ligne aurait pu être ommise mais nous pouvons également la laisser.
- La commande Groove charge un style prédéfini qui est Métronome2-4, nous verrons que nous pourrons mettre ici beaucoup de styles différents. 
- Les lignes suivantes décrivent les accords sur 4 mesures, sachant que chaque mesure ne comprendra qu'une ronde.
- Chaque ligne peut démarrer par un index, c'est à dire le numéro de la mesure, mais ce numéro d'index peut être omis. Il est utile que pour ne pas avoir à compter les mesures dans le fichier d'édition.

Nous aurions pu aussi choisir des accords sur une noire :

~~~mma
Tempo 120

Groove Metronome2-4

1 C F G C
2 C F G C
3 C F F C
4 F F F C
~~~

## Génération du fichier Midi

~~~bash
mma premier.mma
~~~

- Cette commande informe que le fichier midi example0.mid a été créé

~~~
Overwriting existing midi file (4 bars, 0.13 min / 0:08 m:s): 'example0.mid'
~~~

- Il nous faut maintenant aprendre à lire un fichier MIDI 

## Lecture du fichier MIDI

### Sous Winwdows ou sous MacOS

Sous Windows ou MacOs, un double-clic sur le fichier .mid ouvre généralement le lecteur multimédia par défaut.

### Sous linux


#### Premier exemple 

Nous allons utiliser la commande aplay du serveur ALSA qui avec l'option -a donne la liste des cartes son susceptibles d'interpréter des fichiers MIDI


~~~bash
aplay -l
~~~~

~~~
**** Liste des périphériques matériels PLAYBACK ****
carte 0 : PCH [HDA Intel PCH], périphérique 0 : ALC221 Analog [ALC221 Analog]
  Sous-périphériques : 1/1
  Sous-périphérique #0 : subdevice #0
carte 1 : HDMI [HDA ATI HDMI], périphérique 3 : HDMI 0 [HDMI 0]
  Sous-périphériques : 1/1
  Sous-périphérique #0 : subdevice #0
carte 2 : USB [Scarlett 2i2 USB], périphérique 0 : USB Audio [USB Audio]
  Sous-périphériques : 1/1
  Sous-périphérique #0 : subdevice #0
~~~


Ici nous voyons que nous avons 3 cartes son :
    - la carte par défaut du PC qui est la carte 0 (en général cela active le micro qui beepe)
    - Une carte HDMI qui peut être par exemple une Télévision qui est ici la carte 1 
    - La carte USB Scarett qui est celle qui est raccordée à des enceintes d'écoute.
    

Nous pouvons lancer fluidsynth en mode alsa par la commande 

~~~bash
fluidsynth -a alsa -o audio.alsa.device=plughw:2 -ni /usr/share/sounds/sf2/FluidR3_GM.sf2 
           example0.mid
~~~

Les arguments sont les suivants : 

- -a : désigne le mode ALSA
- -o : désigne le périphérique d'écoute
- -ni : est la banque de son MIDI que nous voulons utiliser
- example0.mid : est le fichier MIDI produit par la commande mma example0.mma

On aurait pu choisir de lancer en mode pipewire  par la commande 

~~~bash
fluidsynth -a pipewire -ni /usr/share/sounds/sf2/FluidR3_GM.sf2 example0.mid
~~~~

#### Deuxème exampe avec pipewire et plusieurs cartes son


- Pour choisir une carte par défaut entre plusieurs cartes : 

~~~bash
pactl list sinks | grep -E "Name|Description"
~~~

Affiche 

~~~
Name: alsa_output.pci-0000_3c_00.0.pro-output-0
        Description: RME Hammerfall DSP MADI Pro
        Name: alsa_output.pci-0000_00_1f.3.pro-output-0
        Description: Audio interne Pro
        Name: alsa_output.pci-0000_00_1f.3.pro-output-3
        Description: Audio interne Pro 3
        Name: alsa_output.pci-0000_00_1f.3.pro-output-7
        Description: Audio interne Pro 7
        Name: alsa_output.pci-0000_00_1f.3.pro-output-8
        Description: Audio interne Pro 8
~~~

On peut choisir la carte RME Hammerfall DSP MADI Pro par la commande 

~~~bash
pactl set-default-sink alsa_output.pci-0000_3c_00.0.pro-output-0
~~~~

Pour voir la carte par défaut : 

~~~bash
pactl info | grep "Default Sink"

~~~







