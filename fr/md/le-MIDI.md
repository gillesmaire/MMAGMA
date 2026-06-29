# Le MIDI 

##  Définitions 

Le MIDI est  un langage de commande musicale : il décrit quoi jouer, quand, et comment, mais il ne définit jamais le son lui-même

La vélocité est la puissance sonore d'une note. 


## Séparation de la musique et de l'audio 

Avant le MIDI, la musique numérique était souvent enregistrée comme un signal audio (comme un magnétophone).

Le MIDI introduit une idée fondamentale :

- le son est produit ailleurs (synthétiseur, sampler)
- l’ordinateur ne stocke que des instructions

**Exemple :**

“joue un Do4 avec le son d'un Piano à 120 bpm pendant une noire” plutôt que “voici l’onde sonore”

## Les messages MIDI 

Le MIDI fonctionne avec des évènements simples que nous allons expliciter dans 
ce sous chapître.

### Note ON

Cette commande joue une note avec en paramètre la note de 0 à 127 et sa vélocité 

### Note OFF 

Cette commande provoque l'arrêt de la note


## Les contrôleurs

### Définition

Les contrôleurs MIDI, appelés Control Change (CC), sont des messages qui servent à modifier des paramètres continus pendant le jeu.

Chaque contrôleur est identifié par un numéro CC #0 à CC #127

Chaque CC transporte une valeur  de 0 à 127 (résolution 7 bits)

###  Principe général

Un message CC contient :

- un numéro de contrôleur (ex : 7 = volume)
- une valeur (0–127)
- un canal MIDI (1–16)

**Exemple :**

CC7 = 100  correspond à un volume à de 78 %

Ces valeurs peuvent changer en continu, créant des courbes.

### Les contrôleurs les plus importants

- **CC7 :**  Volume (Channel Volume) règle le volume global d’un canal utilisé pour les mixages MIDI
- **CC10 :** Panoramique gauche droite : 0 = gauche, 64 = centre, 127 = droite
- **CC11 :**  Expression volume musical agit comme un volume secondaire
- **CC11 :** nuance expressive
- **CC64 :**  Sustain (pédale de sustain) 0–63 : relâchée 64–127 : enfoncée
- **CC1 :** Modulation souvent liée au vibrato et dépendante des synthés

### Les messages système

Ces messages concernent :

- le tempo
- la synchronisation 
- le changement d'instrument

## Le temps MIDI 

Le MIDI ne travaille pas en secondes, mais en ticks.

De plus un fichier MIDI définit une résolution appelée PPQ (Pulses Per Quarter note), ce qui est le nombre de pulsations par quart de temps donc le nombre de pulsations par minute. 

**Exemple : **

PPQ = 480
1 noire = 480 ticks
1 croche = 240 ticks

Le tick est donc une unité de temps relative, indépendante du tempo.

C'est par ce mécanosme qu'on peut changer le tempo  sans modifier la structure musicale.


## Le Tempo 

- Le MIDI sépare :

   - la structure musicale (ticks)
   - de la vitesse d’exécution (BPM)

Ainsi une partition MIDI reste identique mais peut être jouée lentement ou rapidement

Formule de base : (Ticks / PPQ)*(60/BPM)

Le BPM était ne nombre de noires par seconde.


## La notion de  position musicale

Dans un système d’analyse musicale comme MMA, le MIDI est essentiel car il permet :

- L'analyse harmonique
   - repérer les notes jouées
   - déduire accords et tonalité
- L'analyse rythmique
   - positions exactes des événements
   - détection de patterns
- Reconstruction musicale
   - rejouer un morceau
   - tester des transpositions
   
## MIDI et tonalité

Le MIDI ne contient pas directement :

- la tonalité
- les accords
- les fonctions harmoniques

Mais il permet de les déduire :

- par accumulation de notes on produit des accords
- de la distribution des accords on déduit la tonalité probable

C’est exactement ce que MMA exploite.


## Les instruments MIDI 


- En MIDI les instruments peuvent être sélectionnés par le numéro.
- Le nom donné dans la colonne Nom Anglais est le nom qui ne sert
qu'à décrire l'instrument. C'est aussi ce qu'on appelle la liste
GeneralMIDI mais en MIDI on n'utilise que le numéro.
- La colonne Nom MMA est une étiquette qui ne sert que dans MMA
où l'on peut : 
   - donner le numéro de l'instrument 
   - ou l'étiquette qui comme on le voit ne suit pas le nom donné
   en anglais à l'instrument
- Il faut savoir que si en MIDI on veut sélectionner l'instrument
AccousticGrandPiano l'ordre envoyé n'est pas 1 mais 0.
-  En MMA on peut indifférement choisir Piano1 ou 1 
| Catégorie    | N° | Nom anglais         |    Nom MMA        |
|:-------------|:---|--------------------:|:------------------|
| Pianos       |  1	| AcousticGrandPiano  | Piano1            |
| Pianos       |  2	| BrightAcousticPiano | Piano2            |
| Pianos       |  3	|Electric Grand Piano | Piano3            |
| Pianos       |  4	| Honky-tonkPiano     | Honky-TonkPiano   |
| Pianos       |  5	| ElectricPiano1      | RhodesPiano       |
| Pianos       |  6	| ElectricPiano2      | EPiano            |
| Pianos       |  7 | Harpsichord	      | HarpsiChord       |
| Pianos       |  8 | Clavinet	          | Clavinet          |
| Percussions  |  9 | Celesta             | Celesta           |
| Percussions  | 10 | Glockenspiel        | Glockenspiel      |
| Percussions  | 11 | MusicBox            | MusicBox          |
| Percussions  | 12 | Vibraphone          | Vibraphone        |
| Percussions  | 13 | Marimba             | Marimba           |
| Percussions  | 14 | Xylophone           | Xylophone         |
| Percussions  | 15 | TubularBells        | TubularBells      |
| Percussions  | 16 | Dulcimer            | Santur            |
| Orgues       | 17 | DrawbarOrgan        | Organ1            |
| Orgues       | 18 | PercussiveOrgan     | Organ2            |
| Orgues       | 19 | RockOrgan           | Organ3            |
| Orgues       | 20 | ChurchOrgan         | ChurchOrgan       |
| Orgues       | 21 | ReedOrgan           | ReedOrgan         |
| Orgues       | 22 | Accordion           | Accordion         |
| Orgues       | 23 | Harmonica           | Harmonica         |
| Orgues       | 24 | TangoAccordion      | Bandoneon         |
| Guitares     | 25 |AcousticGuitar(nylon)| NylonGuitar       |
| Guitares     | 26 |AcousticGuitar(steel)| SteelGuitar       |
| Guitares     | 27 |ElectricGuitar(jazz) | JazzGuitar        |
| Guitares     | 28 |ElectricGuitar(clean | CleanGuitar       |
| Guitares     | 29 |ElectricGuitar(muted)| MutedGuitar       |
| Guitares     | 30 | OverdrivenGuitar    | OverDriveGuitar   |
| Guitares     | 31 | DistortionGuitar    | DistortionGuitar  |
| Guitares     | 32 | GuitarHarmonics     | GuitarHarmonics   |
| Basses       | 33 | AcousticBass        | AcousticBass      |
| Basses       | 34 | ElectricBass(finger)| FingeredBass      |
| Basses       | 35 | ElectricBass(pick)  | PickedBass        |
| Basses       | 36 | Fretless(Bass)      | FretlessBass      |
| Basses       | 37 | SlapBbass1          | SlapBass1         |
| Basses       | 38 | SlapBass2           | SlapBass2         |
| Basses       | 39 | SynthBass1          | SynthBass1        |
| Basses       | 40 | SynthBass2          | SynthBass2        |
| Cordes       | 41 | Violin              | Violin            |
| Cordes       | 42 | Viola               | Viola             |
| Cordes       | 44 | Contrabass          | ContraBass        |
| Cordes       | 45 | TremoloStrings      | TremoloStrings    |
| Cordes       | 46 | PizzicatoStrings    | PizzicatoStrings  |
| Cordes       | 47 | OrchestralHarp      | PizzicatoStrings  |
| Cordes       | 48 | Timpani             | Timpani           |
| Ensembles    | 49 | StringEnsemble1     | Strings           |
| Ensembles    | 50 | StringEnsemble2     | SlowStrings       |
| Ensembles    | 51 | SynthStrings1       | SynthStrings1     |
| Ensembles    | 52 | SynthStrings2       | SynthStrings2     |
| Ensembles    | 53 | ChoirAahs           | ChoirAahs         |
| Ensembles    | 54 | VoiceOohs           | VoiceOohs         |
| Ensembles    | 55 | SynthVoice          | SynthVox          |
| Ensembles    | 56 | OrchestraHit        | OrchestraHit      |
| Cuivres      | 57 | Trumpet             | Trumpet           |
| Cuivres      | 58 | Trombone            | Trombone          |
| Cuivres      | 59 | Tuba                | Tuba              |
| Cuivres      | 60 | MutedTrumpet        | MutedTrumpet      |
| Cuivres      | 61 | FrenchHorn          | FrenchHorn        |
| Cuivres      | 62 | BrassSection        | BrassSection      |
| Cuivres      | 63 | SynthBrass 1        | SynthBrass1       |
| Cuivres      | 64 | SynthBrass 2        | SynthBrass2       |
| Bois / anches| 65 | SopranoSax          | SopranoSax        |
| Bois / anches| 66 | AltoSax             | AltoSax           |
| Bois / anches| 67 | TenorSax            | TenorSax          |
| Bois / anches| 68 | BaritoneSax         | BaritoneSax       |
| Bois / anches| 69 | Oboe                | Oboe              |
| Bois / anches| 70 | EnglishHorn         | EnglishHorn       |
| Bois / anches| 71 | Bassoon             | Bassoon           |
| Bois / anches| 72 | Clarinet            | Clarinet          |
| Flûtes       | 73 | Piccolo             | Piccolo           |
| Flûtes       | 74 | Flute               | Flute             |
| Flûtes       | 75 | Recorder            | Recorder          |
| Flûtes       | 76 | PanFlute            | PanFlute          |
| Flûtes       | 77 | BlownBottle         | BottleBlow        |
| Flûtes       | 78 | Shakuhachi          | Shakuhachi        |
| Flûtes       | 79 | Whistle             | Whistle           |
| Flûtes       | 80 | Ocarina             | Ocarina           |
| Leads synthé | 81 | Lead1(Square)       | SquareWave        |
| Leads synthé | 82 | Lead2(Sawtooth      | SawWave           |
| Leads synthé | 83 | Lead3(Calliope)     | SynCalliope       |
| Leads synthé | 84 | Lead4(Chiff)        | ChifferLead       |
| Leads synthé | 85 | Lead5(Charang)      | Charang           |
| Leads synthé | 86 | Lead6(Voice)        | SoloVoice         |
| Leads synthé | 87 | Lead7(Fifths)       | 5thSawWave        |
| Leads synthé | 88 | Lead8(Bass+Lead)    | Bass&Lead         |
| Pads         | 89 | Pad1(neage)         | Fantasia          |
| Pads         | 90 | Pad2(warm)          | WwarmPad          |
| Pads         | 91 | Pad3(polysynth)     | PolySynth         |
| Pads         | 92 | Pad4(choir)         | SpaceVoice        |
| Pads         | 93 | Pad5(bowed)         | BowedGlass        |
| Pads         | 94 | Pad6(metallic)      | MetalPad          |
| Pads         | 95 | Pad7(halo)          | HaloPad           |
| Pads         | 96 | Pad8(sweep)         | SweepPad          |
| FX           | 97 | FX1(rain)           | IceRain           |
| FX           | 98 | FX2(soundtrack)     | SoundTrack        |
| FX           | 99 | FX3(crystal)        | Crystal           |
| FX           |100 | FX4(atmosphere)     | Atmosphere        |
| FX           |101 | FX5(brightness)     | Brightness        |
| FX           |102 | FX6(goblins)        | Goblins           |
| FX           |103 | FX7(echoes)         | EchoDrops         |
| FX           |104 | FX8(sci-fi)         | StarTheme         |
| Ethniques    |105 | Sitar               | Sitar             |
| Ethniques    |106 | Banjo               | Banjo             |
| Ethniques    |107 | Shamisen            | Shamisen          |
| Ethniques    |108 | Koto                | Koto              |
| Ethniques    |109 | Kalimba             | Kalimba           |
| Ethniques    |110 | Bagpipe             | BagPipe           |
| Ethniques    |111 | Fiddle              | Fiddle            |
| Ethniques    |112 | Shanai              | Shanai            |
| Percu./FX    |113 | Tinkle Bell         | TinkleBell        |
| Percu./FX    |114 | Agogo               | AgogoBells        |
| Percu./FX    |115 | SteelDrums          | SteelDrums        |
| Percu./FX    |116 | Woodblock           | WooBlock          |
| Percu./FX    |117 | TaikoDrum           | TaikoDrum         |
| Percu./FX    |118 | MelodicTom          | MelodicTom1       |
| Percu./FX    |119 | SynthDrum           | SynthDrum         |
| Percu./FX    |120 | ReverseCymbal       | ReverseCymbal     |
| Bruitages    |121 | GuitarFretNoise     | GuitarFretNoise   |
| Bruitages    |122 | BreathNoise         | BreathNoise       |
| Bruitages    |123 | Seashore            | SeaShore          |
| Bruitages    |124 | BirdTweet           | BirdTweet         |
| Bruitages    |125 | TelephoneRing       | TelephoneRing     |
| Bruitages    |126 | Helicopter          | HelicopterBlade   |
| Bruitages    |127 | Applause            | AApplause/Noise   |
| Bruitages    |128 | Gunshot             | GunShot           |


## Conclusion 

Le MIDI est donc une représentation minimale mais extrêmement puissante :

- qui ne produit pas  de son
- qui ne gère pas de style des morceaux
- qui ne gère pas l’interprétation

mais qui traite Juste des événements musicaux dans le temps.

