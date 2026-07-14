# Les fontes sonores 

Les **SoundFonts** sont des banques de sons numériques permettant de reproduire le son d'instruments de musique à partir d'un clavier MIDI ou d'un fichier MIDI. Contrairement au format MIDI, qui ne contient que les informations musicales (notes, vélocité, changements de programme, etc.), une fonte sonore ou SoundFont en anglais fournit les échantillons sonores qui seront réellement joués.

Le format le plus répandu est le **SoundFont 2** (`.sf2`), développé à l'origine par Creative Labs pour ses cartes son Sound Blaster AWE32.

## Principe de fonctionnement

Lorsqu'un fichier MIDI demande par exemple de jouer une note de piano :

* le fichier MIDI indique la note (Do4, Ré4, etc.) ;
* le numéro de l'instrument (Piano acoustique) ;
* la durée ;
* la vélocité (force de frappe).

Le synthétiseur recherche alors dans le SoundFont l'échantillon correspondant et le joue à la bonne hauteur.

Le résultat dépend donc entièrement de la qualité du SoundFont utilisé.

## Structure d'une SoundFont

Un fichier SoundFont est organisé en plusieurs niveaux.

### Les échantillons (Samples)

Ce sont des enregistrements audio réels d'instruments.

Par exemple :

* Piano_Do3.wav
* Piano_Sol3.wav
* Piano_Do5.wav

Le synthétiseur transpose ensuite ces enregistrements pour produire toutes les notes intermédiaires.

### Les Instruments

Un instrument regroupe plusieurs échantillons.

Par exemple un piano peut utiliser :

* un échantillon pour les graves ;
* un autre pour les médiums ;
* un troisième pour les aigus.

Chaque échantillon est affecté à une plage de notes.

### Les Presets

Les presets correspondent aux instruments MIDI visibles par l'utilisateur.

Par exemple :

| Programme MIDI | Instrument       |
| -------------- | ---------------- |
| 0              | Piano acoustique |
| 24             | Guitare nylon    |
| 40             | Violon           |
| 56             | Trompette        |
| 73             | Flûte            |

Lorsqu'un fichier MIDI sélectionne le programme 40, le SoundFont joue le preset « Violon ».

## Les banques MIDI

Le standard MIDI prévoit 128 instruments répartis sur plusieurs banques.

Le canal 10 est réservé aux percussions.

Dans un SoundFont, les percussions sont généralement stockées dans la banque 128.

Chaque note du clavier correspond alors à un instrument de percussion :

| Note MIDI | Instrument        |
| --------- | ----------------- |
| 35        | Grosse caisse     |
| 38        | Caisse claire     |
| 42        | Charleston fermé  |
| 46        | Charleston ouvert |
| 49        | Cymbale Crash     |

## Les zones

Chaque instrument peut être découpé en plusieurs **zones**.

Une zone peut être définie selon :

* la plage de notes ;
* la vélocité ;
* le canal ;
* d'autres paramètres.

Par exemple :

* de Do1 à Si2 → échantillon grave ;
* de Do3 à Si4 → échantillon médium ;
* de Do5 à Do8 → échantillon aigu.

Il est également possible de changer d'échantillon selon la force avec laquelle la touche est frappée.

## Les enveloppes ADSR

Les SoundFonts permettent de définir l'évolution du volume dans le temps grâce à une enveloppe **ADSR**.

* **Attack** : temps nécessaire pour atteindre le volume maximal.
* **Decay** : diminution après l'attaque.
* **Sustain** : niveau maintenu tant que la note est jouée.
* **Release** : temps nécessaire pour que le son disparaisse après le relâchement de la touche.

Cette enveloppe permet de reproduire le comportement naturel des instruments.

## Les boucles (Loops)

Pour économiser de la mémoire, un échantillon n'est pas forcément enregistré pendant toute sa durée.

Une partie de celui-ci peut être jouée en boucle.

Le principe est le suivant :

1. lecture du début de l'échantillon ;
2. répétition d'une petite zone centrale ;
3. lecture de la fin lorsque la note est relâchée.

Cette technique permet de produire des notes très longues avec peu de mémoire.

## Les filtres

Les SoundFonts peuvent appliquer différents traitements :

* filtre passe-bas ;
* résonance ;
* modulation ;
* vibrato ;
* trémolo.

Ces paramètres rendent le son plus réaliste.

## Les SoundFonts General MIDI

La plupart des SoundFonts respectent la norme **General MIDI (GM)**.

Cette norme impose :

* 128 instruments standards ;
* une disposition fixe des instruments ;
* un canal réservé aux percussions.

Ainsi, un fichier MIDI sonnera correctement avec n'importe quel SoundFont compatible GM, même si la qualité sonore varie.

## Taille des SoundFonts

Les premiers SoundFonts tenaient sur quelques mégaoctets.

Exemples :

* 2 Mo : qualité correcte.
* 8 Mo : bonne qualité.
* 32 Mo : très bonne qualité.
* 128 Mo : excellente qualité.
* plusieurs gigaoctets : qualité professionnelle.

Aujourd'hui, certains SoundFonts orchestraux dépassent plusieurs gigaoctets grâce à des milliers d'échantillons enregistrés.

## Avantages

Les SoundFonts présentent de nombreux avantages :

* excellente qualité sonore ;
* faible utilisation du processeur ;
* compatibilité avec le standard MIDI ;
* possibilité de créer ses propres banques de sons ;
* grande portabilité.

## Limites

Ils présentent également quelques limites :

* la qualité dépend entièrement des échantillons ;
* certaines articulations complexes sont difficiles à reproduire ;
* le format SF2 est moins évolué que les bibliothèques modernes (SFZ, Kontakt, etc.).

## Utilisations

Les SoundFonts sont encore largement utilisés pour :

* la lecture de fichiers MIDI ;
* les synthétiseurs logiciels (*software synthesizers*) ;
* les stations audionumériques (DAW) ;
* les jeux vidéo rétro ;
* les systèmes embarqués ;
* les applications éducatives.

## Conclusion

Le format SoundFont constitue une solution simple et efficace pour transformer des données MIDI en sons réalistes. Grâce à une organisation en échantillons, instruments et presets, il offre une excellente compatibilité avec le standard General MIDI tout en permettant des sons de qualité très variable selon les banques utilisées. Bien qu'il ait été supplanté dans certains domaines professionnels par des formats plus avancés, le SoundFont reste aujourd'hui un standard apprécié pour sa simplicité, sa légèreté et sa large compatibilité avec les logiciels et les systèmes de synthèse MIDI.
