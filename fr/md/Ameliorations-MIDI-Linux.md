# Améliorations MIDI sous Linux


## Premières améliorations

La commande fluidsynth utilisée par la commande play est : 

~~~bash
fluidsynth /usr/share/sounds/sf2/FluidR3_GM.sf2 Court.mid
~~~

c'est la commande la plus basique pour jouer un fichier MIDI sous Linux. 

Elle peut être améliorée par des réglages plus fins avec la syntaxe suivante: 

~~~
 fluidsynth    -o synth.reverb.active=1 \
               -o synth.chorus.active=1 \  
               -o synth.reverb.room-size=0.8 \
               -o synth.reverb.damp=0.3 \
               -o synth.chorus.depth=8 \
               -o synth.chorus.level=2 \
               -o synth.polyphony=256 \
               -r 48000 \
               -g 1.7 \
               -ni /usr/share/sounds/sf2/FluidR3_GM.sf2 Court.mid
~~~


Ces paramètres sont : 

- **synth.reverb.active :** activation de la réverbération
- **synth.reverb.room-size :** taille de la salle
- **synth.reverb.damp :** damping ou éliminations des hautes fréquences
- **synth.chorus.active :** activation des chorus c'est à dire de l'élargissement du son
- **synth.chorus.depth:** profondeur du son
- **synth.chorus.level:**  niveau de chorus
- **synth.cpu-cores :** augmentation du nombre de coeurs du processeur pour améliorer le rendu
- **-g :** de 0 à 2 règle le volume sonore global
- **-n :** pas de mode interactif
- **-i :** pas de prompt interactif MIDI


Mais on le comprend, ces petites amélioratons ne changeront pas fondamentalement le rendu des instruments.

## Création d'une SoundFont

### Préambule 

Nous allons créer une SoundFont propre à une formation musicale comprenant :
- une contrebasse
- deux guitares classiques
- des percussions

Par la suite nous pourrons compléter notre orchestre

Pour réaliser ce travail nous allons utiliser le logiciel polyphone et des SoundFont qui nous conviennent. 


