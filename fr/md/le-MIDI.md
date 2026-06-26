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


- Les instruments peuvent être sélectionné par leur nom donné dans la colonne Nom Anglais ou par leur numéro donné dans la coloNne Numéro.

| Catégorie    | N° | Nom anglais        |    Nom MMA        |
|:-------------|:---|-------------------:|:------------------|
| Pianos       |  1	| AcousticGrandPiano | Piano1       |
| Pianos       |  2	| BrightAcousticPiano| Piano2    |
| Pianos       |  3	|Electric Grand Piano| Piano3             |
| Pianos       |  4	| Honky-tonkPiano    | Honky-TonkPiano  |
| Pianos       |  5	| ElectricPiano1     | RhodesPiano|
| Pianos       |  6	| ElectricPiano2     | EPiano|
| Pianos       |  7 | Harpsichord	     | HarpsiChord          |
| Pianos       |  8 | Clavinet	         | Clavinet           |
| Percussions  |  9 | Celesta            | Celesta           |
| Percussions  | 10 | Glockenspiel       | Glockenspiel      |
| Percussions  | 11 | MusicBox           | MusicBox   |
| Percussions  | 12 | Vibraphone         | Vibraphone        |
| Percussions  | 13 | Marimba            | Marimba           |
| Percussions  | 14 | Xylophone          | Xylophone         |
| Percussions  | 15 | TubularBells       | TubularBells|
| Percussions  | 16 | Dulcimer           | Santur |
| Orgues       | 17 | DrawbarOrgan       | Organ1     |
| Orgues       | 18 | PercussiveOrgan    | Organ2   |
| Orgues       | 19 | RockOrgan          | Organ3        |
| Orgues       | 20 | ChurchOrgan        | ChurchOrgan    |
| Orgues       | 21 | ReedOrgan          | ReedOrgan |
| Orgues       | 22 | Accordion          | Accordion |
| Orgues       | 23 | Harmonica          | Harmonica |
| Orgues       | 24 | TangoAccordion     | Bandoneon |
| Guitares     | 25 |AcousticGuitar(nylon)| NylonGuitar |
| Guitares     | 26 |AcousticGuitar(steel) | SteelGuitar  |
| Guitares     | 27 |ElectricGuitar(jazz) | JazzGuitar |
| Guitares     | 28 |ElectricGuitar(clean | CleanGuitar |
| Guitares     | 29 |ElectricGuitar(muted) | MutedGuitar |
| Guitares     | 30 | OverdrivenGuitar | OverDriveGuitar |
| Guitares     | 31 | DistortionGuitar | DistortionGuitar |
| Guitares     | 32 | GuitarHarmonics | GuitarHarmonics |
| Basses       | 33 | AcousticBass | AcousticBass |
| Basses       | 34 | ElectricBass(finger) | FingeredBass |
| Basses       | 35 | ElectricBass(pick) | PickedBass |
| Basses       | 36 | Fretless(Bass) | FretlessBass |
| Basses       | 37 | SlapBbass1 | SlapBass1 |
| Basses       | 38 | SlapBass2 | SlapBass2  |
| Basses       | 39 | SynthBass1 | SynthBass1 |
| Basses       | 40 | SynthBass2 | SynthBass2 |
| Cordes       | 41 | Violin | Violin |
| Cordes       | 42 | Viola | Viola |
| Cordes       | 43 | Cello | Cello |
| Cordes       | 44 | Contrabass | ContraBass |
| Cordes       | 45 | TremoloStrings | TremoloStrings |
| Cordes       | 46 | PizzicatoStrings | PizzicatoStrings |
| Cordes       | 47 | OrchestralHarp | PizzicatoStrings |
| Cordes       | 48 | Timpani | Timpani |
| Ensembles    | 49 | StringEnsemble1 | Strings |
| Ensembles    | 50 | StringEnsemble2 | SlowStrings |
| Ensembles    | 51 | SynthStrings1 | SynthStrings1 |
| Ensembles    | 52 | SynthStrings2 | SynthStrings2 |
| Ensembles    | 53 | ChoirAahs | ChoirAahs |
| Ensembles    | 54 | VoiceOohs | VoiceOohs|
| Ensembles    | 55 | SynthVoice | SynthVox |
| Ensembles    | 56 | OrchestraHit | OrchestraHit |
| Cuivres      | 57 | Trumpet | Trumpet |
| Cuivres      | 58 | Trombone | Trombone |
| Cuivres      | 59 | Tuba | Tuba |
| Cuivres      | 60 | MutedTrumpet | MutedTrumpet |
| Cuivres      | 61 | FrenchHorn | FrenchHorn |
| Cuivres      | 62 | BrassSection | BrassSection |
| Cuivres      | 63 | SynthBrass 1 | Cuivres synthé 1 |
| Cuivres      | 64 | SynthBrass 2 | Cuivres synthé 2 |
| Bois / anches| 65 | SopranoSax | Sax soprano |
| Bois / anches| 66 | AltoSax | Sax alto |
| Bois / anches| 67 | TenorSax | Sax ténor |
| Bois / anches| 68 | BaritoneSax | Sax baryton |
| Bois / anches| 69 | Oboe | Hautbois |
| Bois / anches| 70 | EnglishHorn | Cor anglais |
| Bois / anches| 71 | Bassoon | Basson |
| Bois / anches| 72 | Clarinet | Clarinette |
| Flûtes       | 73 | Piccolo | Piccolo |
| Flûtes       | 74 | Flute | Flûte |
| Flûtes       | 75 | Recorder | Flûte à bec |
| Flûtes       | 76 | PanFlute | Flûte de pan |
| Flûtes       | 77 | BlownBottle | Bouteille soufflée |
| Flûtes       | 78 | Shakuhachi | Shakuhachi |
| Flûtes       | 79 | Whistle | Sifflet |
| Flûtes       | 80 | Ocarina | Ocarina |
| Leads synthé | 81 | Lead1(Square) | Lead carré |
| Leads synthé | 82 | Lead2(Sawtooth | Lead dent de scie |
| Leads synthé | 83 | Lead3(Calliope) | Lead calliope |
| Leads synthé | 84 | Lead4(Chiff) | Lead chiff |
| Leads synthé | 85 | Lead5(Charang) | Lead charang |
| Leads synthé | 86 | Lead6(Voice) | Lead voix |
| Leads synthé | 87 | Lead7(Fifths) | Lead quintes |
| Leads synthé | 88 | Lead8(Bass+Lead) | Lead basse+solo |
| Pads         | 89 | Pad1(neage) | Pad new age |
| Pads         | 90 | Pad2(warm) | Pad warm |
| Pads         | 91 | Pad3(polysynth) | Pad polysynth |
| Pads         | 92 | Pad4(choir) | Pad chœur |
| Pads         | 93 | Pad5(bowed) | Pad frotté |
| Pads         | 94 | Pad6(metallic) | Pad métallique |
| Pads         | 95 | Pad7(halo) | Pad halo |
| Pads         | 96 | Pad8(sweep) | Pad sweep |
| FX           | 97 | FX1(rain) | Effet pluie |
| FX           | 98 | FX2(soundtrack) | Bande son |
| FX           | 99 | FX3(crystal) | Cristal |
| FX           |100 | FX4(atmosphere) | Atmosphère |
| FX           |101 | FX5(brightness) | Brillance |
| FX           |102 | FX6(goblins) | Goblins |
| FX           |103 | FX7(echoes) | Échos |
| FX           |104 | FX8(sci-fi) | Science-fiction |
| Ethniques    |105 | Sitar | Sitar |
| Ethniques    |106 | Banjo | Banjo |
| Ethniques    |107 | Shamisen | Shamisen |
| Ethniques    |108 | Koto | Koto |
| Ethniques    |109 | Kalimba | Kalimba |
| Ethniques    |110 | Bagpipe | Cornemuse |
| Ethniques    |111 | Fiddle | Violon folk |
| Ethniques    |112 | Shanai | Shanaï |
| Percu./FX    |113 | Tinkle Bell | Clochette |
| Percu./FX    |114 | Agogo | Agogo |
| Percu./FX    |115 | SteelDrums | Steel drums |
| Percu./FX    |116 | Woodblock | Woodblock |
| Percu./FX    |117 | TaikoDrum | Tambour taiko |
| Percu./FX    |118 | MelodicTom | Tom mélodique |
| Percu./FX    |119 | SynthDrum | Batterie synthé |
| Percu./FX    |120 | ReverseCymbal | Cymbale inv |
| Bruitages    |121 | GuitarFretNoise | Bruit de frettes |
| Bruitages    |122 | BreathNoise | Souffle |
| Bruitages    |123 | Seashore | Vagues |
| Bruitages    |124 | BirdTweet | Chant d’oiseau |
| Bruitages    |125 | TelephoneRing | Sonnerie téléphone |
| Bruitages    |126 | Helicopter | Hélicoptère |
| Bruitages    |127 | Applause | Applaudissements |
| Bruitages    |128 | Gunshot | Coup de feu |


## Conclusion 

Le MIDI est donc une représentation minimale mais extrêmement puissante :

- qui ne produit pas  de son
- qui ne gère pas de style des morceaux
- qui ne gère pas l’interprétation

mais qui traite Juste des événements musicaux dans le temps.

