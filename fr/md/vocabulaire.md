# Vocabulaire 

## Présentation


MMA utilise un certain nombre de concepts que nous allons définir
avant d'apprendre à nous en servir.

On peut dénombrer les concepts suivants : 

- Les Pattern ou motifs en français
- Les Sequence ou séquences en français
- Les Track ou pistes 
- Les Groove ou style d'accompagnement


## Les termes globaux 


### Pattern 

- **Définition :** Un Pattern est une unité musicale élémentaire qui a une durée d'une mesure ou même parfois moins. Ce Pattern concerne un instrument et donc une seule piste.
- **Portée :** Une piste
- **Durée :** une mesure (ou moins)
- **Rôle :** définir ce qui est joué 
- **Notation:** Suite d'événements dont la syntaxe dépend du type de piste.
- **Remarque :** 
   - nous  verrons que l'on peut ajouter le numéro de la mesure avant les notes
   - nous verrons qu'en fonction des instruments le Pattern peut être une succession de notes ou d'accords en fonction de la piste à la quelle il est rattaché
   
### Define

- **Définition :** Associe un nom à un pattern.
- **Rôle :** Permet de réutiliser un même pattern dans une ou plusieurs séquences.
- **Portée :** Une piste.
- **Durée :** Jusqu'à la fin du fichier ou à une nouvelle définition du même nom.

### Sequence 

- **Définition :** La sequence contient une liste de Pattern
- **Portée :** Une piste
- **Durée :** la somme des Pattern
- **Rôle :** permettre de rassembler plusieurs Pattern pour en faire un couplets, un refrain,
un solo ou chorus
- **Notation:** Bass Sequence Broken1 Broken2 Broken1 Broken1


### Track

- **Définition :** définit l'instrument joué sur la piste : Bass, Drum, Walk ...
- **Rôle :** contient des Pattern et/ou des Séquences
- **Durée :** Pendant tout le morceau.

### Groove 

- **Définition :** définit le style complet
- **Rôle :** couche de contrôle global qui orchestre les pistes (patterns et sequences). 
Il ne contient aucune donnée musicale directe, mais définit des paramètres d’exécution comme le tempo et le niveau général de mixage.
- **Notation :** Groove Metronome2-4


## Les types de piste

### Bass

- **Définition :** c'est la piste réservée à la basse, qui est automatiquement générée pour produire
une ligne de basse. Il est possible de modifier la génération automatique par défaut.
- **Rôle:** : assurer la partie Basse du morceau

### Chord 

- **Définition :** c'est la piste réservée aux accords qui doivent être fournis pour servir de base
à la génération de la ligne de basse. 
- **Rôle:** : Donner l'harmonie du morceau sans se soucier du rythme

### Drum 

- **Définition :** c'est la piste qui gère le rythme du morceau
- **Rôle :** gérer la batterie et tous les instruments percussifs

### Arpeggio 

- **Définition :** c'est la piste réservée aux accords joués en arpège. 
- **Rôle :**  Donner l'harmonie du morceau sans inclure de rythme 

### Melody

- **Définition :** correspond généralement à une ligne de notes jouée par un instrument mélodique. 
C'est une suite de note qui suit la mélodie principale.
- **Rôle :** jouer la ligne mélodie par un instrument accompagnant la voix ou la remplaçant

### Solo 

- **Définition :** c'est un passage où un instrument prend le premier rôle et improvise ou joue une mélodie mise en avant, souvent avec plus de liberté qu'un mélodie.
- **Rôle :** jouer une ligne mélodique complémentaire 


### Riff

- **Définition :** c'est une phrase musicale courte, souvent répétée, qui sert de base au morceau. 
Il peut être joué par une guitare, une basse, un clavier, etc. Il donne souvent l'identité du morceau. 
- **Rôle :** introduire une séquence de note pour donner la couleur du morceau 


### Walk 

- **Définition :** c'est une technique notamment utilisée à la Basse pour ajouter des notes de basse pour
former une mélodie complémentaire à la mélodie principale
- **Rôle :** rendre la ligne de basse plus vivante

### Scale

- **Définition :** génère une succession de notes appartenant à une gamme adaptée à l'accord joué. A
- **Rôle :** au lieu de jouer uniquement les notes de l'accord (comme un CHORD ou un ARPEGGIO), elle joue les notes voisines de la tonalité pour créer des lignes mélodiques, des montées ou descentes.

### Aria 

- **Définition :** est une piste  qui produit une mélodie automatique en utilisant les informations harmoniques du morceau (accords, tonalité, gamme). Contrairement à SCALE, qui suit souvent une progression de gamme assez régulière, ARIA peut créer des phrases plus variées. 
- **Rôle :** Elle choisit des notes qui appartiennent à l'accord ou à la gamme courante et crée une phrase mélodique. 

### Plectrum 

- **Définition :** Les pistes PLECTRUM imitent le son d'un instrument à cordes pincées comme une guitare ou un banjo.
- **Rôle :** les sons de ces pistes continuent à sonner jusqu'à ce qu'un nouvel accord ou motif soit rencontré. Ils peuvent ainsi sembler plus pleins que d'autres,plus de notes ont tend ance à être jouées
