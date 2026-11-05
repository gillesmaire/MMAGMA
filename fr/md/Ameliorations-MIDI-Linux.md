# Améliorations MIDI


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


Outre les améliorations précédentes qui étaient assez minimes. On peut gagner
beaucoup en créant sa propre SoundFont. Pour cela le logiciel Polyphone vous aidera à créer de toute pièce votre SoundFont ou à remplacer une instrument
qui ne vous satisfait pas.

Il faut donc installer Polynome dans cette optique.

Deux méthodes d'installation de polyphone sont possibles:
- la dernière version en téléchargement;
- une version parfois moins récente par une commande Linux.

### Installation manuelle de la dernière version


Sous Linux  l'installation se fait en suivant les différentes étapes énumérées ci-dessous après avoir chargé le fichier AppImage depuis le site https://polyphone.io


- Ensuite il faut effectuer la liste des commandes suivantes : 

~~~bah
chmod +x Polyphone_2.6.0-linux_x64.AppImage
sudo mkdir -p /usr/local/bin
sudo cp Polyphone_2.6.0-linux_x64.AppImage /usr/local/bin/
~~~

- à ce stade il faut positionner l'icônne de l'application qui est incluse dans AppImage


~~~
mkdir ~/Temp /opt/Polyphone
cd ~/Temp
/usr/local/bin/Polyphone_2.6.0-linux_x64.AppImage --appimage-extract
~~~

-  il n'existe qu'un seul répertoire avec l'icone qui peut éventullement changer en fonction des versions 

~~~
sudo cp squashfs-root/usr/share/icons/hicolor/512x512/apps/polyphone.png \
/opt/Polyphone/logo.png
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

Sous Linux, vous devez être en capacité de trouver Polyphone dans votre bureau et éventuellement de draguer l'application sur votre bureau ou sur l'une de vos barres de tâches en fonction de l'environnement graphique de votre ordinateur.

### Installation classique Polyphone 


La commande  suivante vous permet d'installer une version de Polyphone parfois moins à jour qu'avec 
la méthode précédente : 


~~~bash
sudo apt install polyphone
~~~

## Fabrication d'une fonte MIDI

### Localisation des fontes sonores


Une fois Polyphone installé nous allons devoir

- récupérer des fontes de bonne qualité
- créer notre propre fonte sonore au format SF2 compatible avec QSynth.

Le site polyphone  https://www.polyphone.io propose un grand nombre de fontes sonores, mais il existe également des fontes sonores qui ne sont pas référencées sur ce site.

Nous allons récupérer deux fontes sonores :

- La fonte de contrebasse de Carlos Vaquero :
    - https://www.musical-artifacts.com/artifacts/1879
- La fonte de guitare cordes Nylons  :
    - https://freepats.zenvoid.org/Guitar/acoustic-guitar.html
    
On peut également créer avec Polyphone des fontes sonores en enregistrant ses propres instruments, cet usage est
documenté sur nombre de ressources alors que la démarche qui consiste à récupérer des polices dans divers endroit est moins usuelle et donc moins commentée.

### Création de la fonte sonore LaFonteDeMonGroupe.sf2

Nous allons préparer une nouvelle fonte polyphone dans laquelle nous insérons différents instruments 

![Écran d'accueil de Polyphone](images/Polyphone1.png)

Ouvrir le logiciel Polyphone et créer un nouvelle fonte en appuyant sur la zone 1 marquée *Nouvelle banque de sons*

Nous allons devoir renseigner ici les informations relatives à la nouvelle fonte que nous allons créer.

![Informations sur la fonte](images/Polyphone2.png)

Ici on saisit les différentes informations liées à la fonte sonore nouvellement créée :

1. Positionner le titre : La fonte de mon groupe
2. Auteur : Gilles Maire
3. Date : La date du jour 
4. Produit : Fonte des instruments du groupe 
5. Copyrigth : Creative Common
6. Commentaires : Démonstration
7. Cliquer sur le bouton sauvegarder et sauvegarder.


Cette fonte sonore est créée sans aucun instrument.

### Ajout d'un instrument


#### Choix d'un instrument

Nous allons ouvrir la fonte sonore de la Guitare Classique et pour cela nous allons : 

![Choix d'un instrument à copier](images/Polyphone3.png)

1. Revenir au menu pincipal en cliquant sur l'icone d'accueil
2. Cliquer sur le bouton **Ouvrir une banque de son**. 
3. Choisir une des banques son que vous avez préalablement chargée  par exemple 
/home/gilles/Musique/SoundFonts/Custom Classical Guitar.sf2. 

#### Copie de cet instrument 

Maintenant nous allons copier la police ce qui se fait en plusieurs étapes:

![Copier les informations de fonte](images/Polyphone4.png)

1. Ouvrir le contenu de la fonte Spanish Classical Guitar
2. Afficher la liste des instruments en cliquant sur le symbole +
3. Sélectionner la ligne correspondant à la police Classical Guitar et appuyer sur Control C ou optenez le Control C par un clic sur le bouton droit de la souris.

#### Importation de cet instrument

Maintenant nous allons coller cette fonte dans notre nouvelle police qui est vide 

![Coller les informations de fonte](images/Polyphone5.png)

1. Revenir dans la nouvelle fonte que vous êtes en train de créer 
2. Se positionner sur Instruments
3. Coller les différents enregistrements copiés  par la combinaison de touches Control V
4. Vérifier que l'instrument a bien été collé en dépliant le triangle de la ligne Intrument à coté de la pastille 3

#### Copie de la partie ensembles

![Copier la partie ensemble](images/Polyphone6.png)

Il nous faut procéder de même pour copier la partie ensembles 

1. Revenir sur Spanish classical guitar
2. Cliquer sur Ensemble
3. Sélectionner la ligne correspondant à la police Classical Guitar et appuyer sur Control C ou 
optenez le Control C par un clic sur le bouton droit de la souris.

### Importation de la partie ensemble

![Coller la partie ensemble et assigner l'instrument ](images/Polyphone7.png)

Nous devons coller la partie ensemble, assigner l'instrument et sauvegarder :

1. Se positionner sur Ensemble
2. Coller la partie Ensemble à l'aide de la touche Control V
3. Vérifier que l'ensemble a bien été collé
4. Assigner l'instrument MIDI dans la banque 0 (ou une autre si vous avez plusieurs banques)
5. Sauvegarder votre nouvelle fonte


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
fluidsynth -a alsa -o audio.alsa.device=plugw:2 \ 
-ni /usr/share/sounds/sf2/FluidR3_GM.sf2  testPolyphone.mid
~~~

Le device est trouvé avec la commande 

~~~bash
aplay -l
~~~
