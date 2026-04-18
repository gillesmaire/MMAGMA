# Les options de MMA 



## Présentation 

Nous avons utilisé la comande **mma** avec la syntaxe :

~~~bash
mma fichier.md
~~~

Cette syntaxe peut être enrichie d'un certain nombre d'options qui sont affichées lorsqu'on lance la commande **mma** sans argument.

Voici le résultat de la commande traduite en français :

~~~
MMA - Musical Midi Accompaniment
  Copyright 2003-22, Bob van der Poel. Version 25.05.0
  Distribué sous les  termes de la licence  GNU Public Licence
  Usage: mma [opts ...] INFILE [opts ...]

Options:
-b <n>      Limiter la compilation aux mesures n1 à n2 (numéros de commentaires)
-B <n>      Comme -b mais avec les numéros absolus de mesures
-c          Afficher les affectations de canaux par défaut
-d          Activer de nombreux messages de débogage
-Dk         Afficher la liste des mots-clés MMA
-Dxl        Extraire les blocs de documentation LaTeX depuis le fichier
-Dxh        Extraire les blocs de documentation HTML depuis le fichier
-Dgh        Extraire la documentation HTML des grooves
-Djs        Extraire les informations JSON des grooves depuis le fichier
-Dbo        Extraire le texte pour une application navigateur
-Ds         Extraire les listes de séquences depuis le fichier
-e          Afficher les lignes analysées et développées
-f <file>   Définir le nom du fichier de sortie
-g          Mettre à jour la base de dépendances des grooves
-G          Créer la base de dépendances des grooves
-i <file>   Spécifier le fichier d'initialisation (mmarc)
-I <plugin> Afficher la documentation d’un plugin si disponible
-II         Ignorer le test de permissions des plugins (dangereux)
-L          Afficher l’ordre de traitement des mesures
-m <x>      Définir le nombre maximal de mesures (500 par défaut)
-M <x>      Définir le type SMF (0 ou 1)
-n          Ne pas générer de sortie MIDI
-o          Afficher les noms complets des fichiers ouverts
-p          Afficher les patterns lors de leur définition
-P          Jouer le morceau sans le sauvegarder
-r          Afficher la progression en cours
-s          Afficher les informations de séquence pendant l’exécution
-S <var=val> Définir une macro 'var' avec la valeur 'val'
-T <tracks> Limiter la génération aux pistes spécifiées
-v          Afficher le numéro de version
-V <groove> Préécouter un groove (avec options possibles)
-w          Désactiver les messages d’avertissement
-xCHORDS=   Tester la validité d’une liste d’accords
-xNOCREDIT  Supprimer les crédits MMA dans les métadonnées MIDI
-xCHECKFILE= Vérifier les accords dans un fichier
-xTSplit    Créer un fichier MIDI par piste
-xCSplit    Créer un fichier MIDI par canal
-0          Créer une synchronisation au début de toutes les pistes
-1          Créer une synchronisation à la fin de toutes les pistes
-           Utiliser l’entrée standard (STDIN) au lieu d’un fichier
~~~

## Contrôle principal de génération MIDI


- **-f <file> :**   Nom du fichier MIDI de sortie qui sera différent du nom du fichier d'entrée. En remplaçant le nom de fichier par - le résultat sera affiché à l'écran sans génération de fichier
- **-n :**          Ne génère pas de fichier MIDI mais juste les pistes allouées et les canaux MIDI assignés.
- **-P :**          Génère le fichier MIDI et le joue mais supprime le ficier MIDI une fois qu'il a été joué
- **-T <tracks> :** Limite la génération à certaines pistes. La liste de ces pistes étant séparées par des virgules. Par exemple : -T drum-hh,chord
- **-M <x> :**      Type de fichier MIDI (0 = une piste, 1 = multi-pistes) 
- **-m <x> :**      Nombre maximal de mesures (défaut 500)


## Tests et validation 

- **-xChords=<liste> :**   Vérifie la validité des accords passés en argument. Par exemple mma -x chords C B A H va indiquer que H n'est pas un accord
- **-xCheckfile=<fichier>:**  Vérifie que tous les accords d’un fichier son valides. Tout ce qui n'est pas un accord n'est pas analysé.

## Debug et analyse interne

- **-d :**   Active le mode debug (très verbeux et réservé au développeur)
- **-e :**   Affiche les lignes après expansion 
- **-r :**   Affiche la progression
- **-s :**   Affiche les informations de séquence
- **-L :**   Affiche l’ordre de traitement des mesures
- **-o :**   Affiche les noms complets des fichiers ouverts

## Inspection du langage MMA

- **-Dk :**   Liste tous les mots-clés MMA
- **-c  :**  Affiche les affectations de canaux par défaut
- **-p :**    Affiche les patterns lors de leur définition
- **-I <plugin>:**  Documentation d’un plugin

##  Extraction de documentation

Si les fichiers mma ont des blocs de document, les commandes suivant permettent d'extraire ces blocs dans les formats énoncés ci-dessous. Les blocs
de document sont encadrés par les mots clés Doc et EndDox, mots clés qui peuvent être en majsucule ou minuscule.

- **-Dxl**:  Extrait documentation LaTeX
- **-Dxh**:   Extrait documentation HTML
- **-Dgh**:   Extrait documentation HTML des grooves
- **-Djs**:   Extrait les grooves en JSON
- **-Dbo**:   Extrait du texte pour application web
- **-Ds**:    Extrait les séquences
