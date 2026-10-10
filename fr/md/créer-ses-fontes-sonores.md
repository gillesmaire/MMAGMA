# Fabriquer sa fonte sonore


## Présentation

Nous allons  créer une font sonore comprenant des instruments spécifiques existants dans diverses
ressources d'internet.

Nous allons utiliser le logiciel Polyphone qui est disponible dans les dépots Debian et donc
installable sur une distrubution Linux Debian par la commande :

~~~bash
apt install polyphone
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
    
On peut également créer avec Polyphone des fontes sonores correspondant à ses propres instruments, mais cet usage est
documenté sur nombre de ressources alors que la démarche montrée ici est moins usuelle.

### Création de la fonte sonore LaFonteDeMonGroupe.sf2


Nous allons préparer une nouvelle fonte polyphone dans laquelle nous insérons différents instruments 

Ouvrir le logiciel Polyphone et créer un nouvelle fonte en appuyant sur la zone 1 marquée *Nouvelle banque de sons*

![Écran d'accueil de Polyphone](images/Polyphone1.png)

Vous devez ici renseigner les informations relatives à la nouvelle fonte que vous allez créer.

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
3. Sélectionner la ligne correspondant à la police Classical Guitar et appuyer sur Control C ou 
optenez le Control C par un clic sur le bouton droit de la souris.

#### Importation de cet instrument

Maintenant nous allons coller cette fonte dans notre nouvelle police qui est vide 

![Coller les informations de fonte](images/Polyphone5.png)

1. Revenir dans la nouvelle fonte que vous êtes en train de créer 
2. Se positionner sur Instruments
3. Coller les différents enregistrements copiés  par la combinaison de touches Control V

#### Copie de la partie ensembles

![Copier la partie ensemble](images/Polyphone6.png)

Il nous faut procéder de même pour copier la partie ensembles 

1. Revenir sur Spanish classical guitar
2. Cliquer sur Ensemble
3. Coller les différents enregistrements copiés  par la combinaison de touches Control V


