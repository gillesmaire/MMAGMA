# Introduction à MMA

## Qu'est-ce que MMA ?

MMA signifie *Musical MIDI Accompaniment*. C'est un logiciel écrit par **Bob van der Poel** sous licence **GNU GPL 2**.

C'est un logiciel libre qui permet de générer automatiquement des fichiers MIDI à partir d'un simple fichier texte. Au lieu de saisir les notes une à une dans un séquenceur, on décrit la musique avec quelques commandes : tempo, accords, instruments, rythme, etc.

MMA lit ensuite ce fichier texte et produit un fichier MIDI que l'on peut écouter dans n'importe quel lecteur MIDI ou importer dans un séquenceur.

MMA est particulièrement utile si vous :

- aimez écrire la musique sous forme de texte ;  
- voulez créer rapidement un accompagnement ;  
- souhaitez générer plusieurs variantes d'un morceau ;  
- utilisez Linux, mais aussi Windows ou macOS ;  
- aimez automatiser les choses.  

MMA est souvent comparé au logiciel **Band-in-a-Box**, qui est payant, ou au logiciel open source **JJazzLab**. Ces deux logiciels possèdent une interface graphique, c'est-à-dire que vous devez manipuler la souris pour créer votre composition ou éventuellement importer un fichier comprenant des accords, mais avec des options relativement limitées.

Band-in-a-Box utilise une interface graphique alors que MMA utilise des fichiers texte. Cela peut sembler plus difficile au début, mais cela donne beaucoup plus de souplesse. Un fichier MMA peut être modifié avec n'importe quel éditeur de texte, conservé dans un système de gestion de versions ou généré automatiquement par un programme.

Pour quelqu'un qui aime à la fois la musique et la programmation, MMA est un outil très puissant.

## Pourquoi ai-je été amené à écrire ce livre ?

En tant qu'auteur du logiciel **ChordV** et auteur-compositeur-interprète, j'ai été amené à utiliser JJazzLab et à l'intégrer dans ChordV.  

Mais que fait ChordV ? C'est un éditeur de texte qui permet de saisir des textes de chansons et d'y ajouter des accords, par exemple `[Lam]`. Il offre tout un tas de petites fonctionnalités : un clic sur `[Lam]` affiche un manche de guitare avec la position des doigts, et on peut ajouter une note à la souris pour transformer `Lam` en `Lam7`.  

Mais le but principal de ChordV est de fabriquer des livrets de différents types:  

- un livret de paroles ;  
- un livret avec les paroles et les noms des accords dans le texte ;  
- un livret avec les paroles et les grilles d'accords à la guitare dans le texte ;  
- un livret avec juste les grilles d'accords pour les musiciens.  

Dans les dernières versions de ChordV, j'ai ajouté une sortie des chansons au format **JJazzLab**, permettant d'écouter la rythmique, la basse ainsi que les accords. Cependant, ceci est à moitié satisfaisant : l'utilisateur ne bénéficie que d'un couplet et d'un refrain, et il doit apprendre à se servir de JjazzLab pour chaque chanson afin d'obtenir un résultat complet.

J'ai entendu parler de MMM, un  logiciel très puissant, qui a bénéficie d'une documentation de référence très précises et de quelques pages de mise en route plus légères, le tout en langue anglaise . J'ai donc décidé d'écrire ce livre sous forme d'une documentation intermédiaire mais en langue fançaise, d'abord pour apprendre à me servir de MMA et ensuite pouvoir implémenter une sortie MMA dans ChordV.

## Les ressources MMA

- La ressources en langue anglaise est disponible à l'adresse https://www.mellowood.ca/mma/online-docs/html/mma.html
- La documentation de référence en langue anglaise  est disponible à l'adresse  https://www.mellowood.ca/mma/online-docs/html/ref/mma.html


## La documentation MMAGMA

### Présentation

- La documentation est écrite en Markdown dans le répertoire fr pour la langue française
- Elle fournit trois formant de documentations : 
    - Le PDF
    - Le HTML 
    - Le format Epub pour les liseuses
- Deux fichiers exécutables peuvent être  utiles : 
    - **compile :**  qui supprime les fichiers précédemment générés et lance la fabrication de la documentation par le biais d'un fichiers MMakeLists.txt. Il faut donc 
    installer CMake si vous voulez générer la documentation
    - **play :** qui  convertit le fichier mma en fichier midi et qui lance sous Linux la commande d'écoute vi la sounfont /usr/share/sounds/sf2/FluidR3_GM.sf2
- Quelques chansons sont fournies à titre d'exemple  dans le répertoire examples. 

### Remarques sur la commande play

La commande play permet de lancer une chanson au format mma. Elle a deux syntaxe : 

- Un format simple pour convertir le fichier Court.mma en midi et le jouer 

~~~bash
play Court
~~~

- Un format avec deux arguments permettant de changer le style en cours dans le fichier Court.mma et de le remplacer par un autre 

~~~bash
play Court mambo
~~~

### Où trouver la présente documentation


Vous pouvez retrouver la dernière version de ce document sur gitHub à l'adresse https://github.com/gillesmaire/MMAGMA

Si vous désirez collaborer à l'élaboration de ce document vous pouvez me contacter par github ou via mon adresse gilles.maire@ignu.fr



