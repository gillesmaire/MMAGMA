# Chapitre 1 – Introduction à MMA

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

Le but principal de ChordV est de fabriquer des livrets :  

- un livret de paroles ;  
- un livret avec les paroles et les noms des accords dans le texte ;  
- un livret avec les paroles et les grilles d'accords à la guitare dans le texte ;  
- un livret avec juste les grilles d'accords pour les musiciens.  

Dans les dernières versions de ChordV, j'ai ajouté une sortie des chansons au format **JJazzLab**, permettant d'écouter la rythmique, la basse ainsi que les accords. Cependant, ceci est à moitié satisfaisant : l'utilisateur ne bénéficie que d'un couplet et d'un refrain, et il doit apprendre à se servir de JazzLab pour chaque chanson afin d'obtenir un résultat complet.

J'ai entendu parler de MMA. Ce logiciel paraît très puissant, mais sa documentation est relativement complexe à appréhender. J'ai donc décidé d'écrire ce livre avec une documentation claire, afin de savoir ensuite comment implémenter une sortie MMA dans ChordV.
