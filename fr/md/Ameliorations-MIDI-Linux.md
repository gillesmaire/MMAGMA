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


## Installation et utilisation de Polyphone 


### Installation de Polyphone


Polyphone permet de  créer ou modifier une sound font en y ajoutant ou modifant certains instruments.

Sous Macintosh ou Windows l'installation de Polyphone se fait simplement en chargeant le logiciel à l'adresse :


https://www.polyphone.io/fr/software

Sous Linux il faut compléter l'installation en suivant les différentes étapes énumérées ci-dessous après avoir 
chargé le fichier AppImage


- Ensuite il faut effectuer la liste des commandes suivantes : 

~~~bah
chmod +x Polyphone_2.6.0-linux_x64.AppImage
sudo mkdir -p /usr/local/bin
sudo cp Polyphone_2.6.0-linux_x64.AppImage /usr/local/bin/
# à ce stade il faut positionner l'icone de l'application qui est incluse dans AppImage
mkdir ~/Temp /opt/Polyphone
cd ~/Temp
/usr/local/bin/Polyphone_2.6.0-linux_x64.AppImage --appimage-extract
# il n'existe qu'un seul répertoire avec l'icone, cela peut changer en fonction des versions 
sudo cp squashfs-root/usr/share/icons/hicolor/512x512/apps/polyphone.png /opt/Polyphone/logo.png
~~~

- Créer le fichier /usr/local/share/applications/polyphone.desktop

~~~bash
sudo mkdir /usr/local/share/applications
sudo nano /usr/local/share/applications/polyphone.desktop
~~~

contenant

~~~
[Desktop Entry]
Version=2.6.0
Type=Application
Name=Polyphone
Exec=/usr/local/bin/Polyphone_2.6.0-linux_x64.AppImage
Terminal=false
Categories=AudioVideo;Audio;
Description=SoundEditor
Icon=/opt/Polyphone/logo.png
~~~

Sous Linux, vous devez être en capacité de trouver Polyphone dans votre bureau et éventullement de draguer l'application sur votre bureau ou sur l'une de vos barres de tâches en fonction de l'environnement graphique de votre ordinateur.


### Utilisation de Polyphone


### Préambule 

Nous allons maintenant faire quelques tests de SoundFonts propres à une formation musicale comprenant :

- une contrebasse
- deux guitares classiques
- des percussions

Par la suite nous pourrons compléter notre orchestre

Pour réaliser ce travail nous allons utiliser le logiciel polyphone et des SoundFont qui nous conviennent. 



### Test d'un instument 

Un des points qui nous intéresse en premier lieu est de pouvoir écouter chaque instrument d'une SoundFont indépendament pour en tester le rendu.

On peut également charger une SoundFont contenant un seul instrument comme
on en trouve sur certains sites de téléchargement comme Polyphone.


Nous pouvons créer un fichier MMA correspondant à un instrument, par exemple une contrebasse.
Nous allons utiliser la possibilité de créer une piste solo que
nous offre MMA et qui est détaillée dans le chapître *Les pistes Solo et Mélodie*.
Voici un fichier minimaliste mettant en oeuvre ce principe, donnons lui le nom de 
testPolyphone.mma

~~~mma
Tempo 120
Solo Voice AcousticBass
Solo Riff 4c; 2d; 4f;
F
Solo Riff 4a; 8d; 4a; 4c;
F
~~~

Nous verrons à quoi correspondent chacune de ces instructions, pour le moment admettons le fait que l'instrument
joué est une contrebasse en pizzicato, c'est à dire jouée façon Jazz et qu'une série de notes est jouée.

Les commandes pour jouer  : 

- sur la première carte son 

~~~bash
mma testPolyphone.mma
fluidsynth /usr/share/sounds/sf2/FluidR3_GM.sf2 testPolyphone.mid
~~~

- sur une autre carte son 

~~~bash
mma testPolyphone.mma
fluidsynth -a alsa -o audio.alsa.device=plugw:2 -ni /usr/share/sounds/sf2/FluidR3_GM.sf2  testPolyphone.mid
~~~

Le device est trouvé avec la commande 

~~~bash
aplay -l
~~~
