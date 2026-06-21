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

Le MIDI fonctionne avec des évènements simples 

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
- **CC1 :** Modulation souvent lié au vibrato et dépend des synthés

### Les messages système

Ces messages concernent :

- le tempo
- la synchronisation 
- le changement d'instrument

## Le temps MIDI 

Le MIDI ne travaille pas en secondes, mais en ticks.

De plus un fichier MIDI définit une résolution appelée  PPQ (Pulses Per Quarter note), ce qui 
est le nombre de pulsation par quart de temps donc le nombre de pulsations par minute. 

**Exemple : **

PPQ = 480
1 noire = 480 ticks
1 croche = 240 ticks

Le tick est donc une unité de temps relative, indépendante du tempo.

C'est par ce mécanosme qu'on peut changer  le tempo  sans modifier la structure musicale.


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

## Conclusion 

Le MIDI est donc une représentation minimale mais extrêmement puissante :

- qui ne produit pas  de son
- qui ne gère pas de style des morceaux
- qui ne gère pas l’interprétation

mais qui traite Juste des événements musicaux dans le temps

