# Chapitre 6 – Les pistes

Dans MMA, une piste représente une partie musicale sous une des formes suivantes : 
- accords (Chord) : les accords sont joués
- basse (Bass) : les notes d'un instrument de basse (contrebasse, basse, hélicon)
- batterie (Drum) : batterie ou percussions
- mélodie (Melody) : notes de la mélodie)
- arpèges (Arpeggio) : accords sous la forme d'arpèges
- solo (Solo) : ornements solo
    
Cette forme musicale représente donc une composante d'un orchestre et peut être multiple. De plus nous devrons associer aux comosants voulus un instrument
et chaque piste possède son propre instrument, son propre rythme et sa propre manière d'utiliser les accords du morceau.

Les noms des instruments correspondent aux instuments MIDI disponibles sur vote banque MIDI.

# 6.1 Déclaration d'une piste

Une piste se définit par son type suivi éventuellement de réglages.

Exemple :

```mma
Chord Voice Piano1
Bass Voice FingeredBass
Drum Voice StandardKit
```

Ici :

* la piste `Chord` utilise un piano
* la piste `Bass` utilise une basse électrique
* la piste `Drum` utilise une batterie standard

# 6.2 La piste Chord

La piste `Chord` joue les accords du morceau.

```mma
Chord Sequence {
    1 2 100
    3 1 90
    4 1 90
}
```


Les corresponsances de notes sont donc : 

|Valeur|Note Française|Note anglaise|
|:----:|:------------:|------------:|
|   0  |      DO      |      C      |
|   1  |      RÉ      |      D      |
|   2  |      MI      |      E      |
|   3  |      FA      |      F      |
|   4  |      SOL     |      G      | 
|   5  |      LA      |      A      |
|   6  |      SI      |      B      |


la piste jouera :

* C pendant deux temps
* F pendant un temps
* G pendant un temps

La piste `Chord` est généralement utilisée pour le piano, la guitare ou les nappes.

# 6.3 La piste Bass

La piste `Bass` utilise automatiquement les accords pour produire une ligne de basse.

```mma
Bass Voice FingeredBass

Bass Sequence {
    1 1 100
    3 1 90
}
```

Avec les accords :

```mma
1 C
2 F
3 G
```

la basse jouera automatiquement :

* la fondamentale de C au temps 1
* la fondamentale de G au temps 3

Selon le groove, MMA peut aussi utiliser la quinte ou d'autres notes de l'accord.

# 6.4 La piste Drum

La piste `Drum` ne dépend pas des accords. Elle joue uniquement un rythme.

```mma
Drum Sequence {
    1 1 120
    2 1 90
    3 1 110
    4 1 90
}
```

La piste batterie utilise des sons spéciaux de batterie GM.

Exemple :

```mma
Drum Tone KickDrum1
Drum Sequence {
    1 1 120
    3 1 120
}
```

Cela joue la grosse caisse aux temps 1 et 3.

On peut créer plusieurs pistes de batterie en leur donnant un nom.

```mma
Begin Drum-Snare
    Tone SnareDrum1
    Sequence { 2 1 100; 4 1 100 }
End

Begin Drum-HiHat
    Tone ClosedHiHat
    Sequence { 1 0.5 70; 1.5 0.5 70; 2 0.5 70; 2.5 0.5 70 }
End
```

# 6.5 La piste Arpeggio

La piste `Arpeggio` joue les notes d'un accord les unes après les autres.

```mma
Arpeggio Sequence {
    1 0.5 100
    1.5 0.5 90
    2 0.5 90
    2.5 0.5 90
}
```

Avec l'accord `C`, la piste peut jouer successivement :

* do
* mi
* sol
* do

L'ordre dépend du réglage de la piste.

# 6.6 La piste Melody

La piste `Melody` ne suit pas automatiquement les accords. Les notes doivent être écrites explicitement.

```mma
Melody
1 C
2 D
3 E
4 G
```

La mélodie est indépendante de la piste `Chord`.

On peut donc avoir :

```mma
Chord Sequence { 1 4 100 }

1 C

Melody
1 E
2 G
3 A
4 G
```

L'accord reste C pendant toute la mesure tandis que la mélodie change.

# 6.7 La piste Solo

La piste `Solo` ressemble à `Melody`, mais elle est destinée à une improvisation ou à une ligne ponctuelle.

```mma
Solo Voice AltoSax

Solo
1 G
2 A
3 C+
4 D+
```

Elle peut être utilisée seulement dans certaines parties du morceau.

# 6.8 Plusieurs pistes en même temps

Toutes les pistes peuvent fonctionner simultanément.

```mma
Chord Voice Piano1
Bass Voice FingeredBass
Drum Tone KickDrum1

Chord Sequence { 1 4 100 }
Bass Sequence  { 1 1 100; 3 1 90 }
Drum Sequence  { 1 1 120; 3 1 120 }

1 C
```

Résultat :

* le piano tient l'accord C pendant toute la mesure
* la basse joue au temps 1 puis au temps 3
* la batterie joue la grosse caisse au temps 1 puis au temps 3

# 6.9 Nommer des pistes

On peut créer plusieurs pistes d'un même type en leur donnant un nom.

```mma
Begin Bass-Walking
    Voice FingeredBass
    Sequence { 1 1 100; 2 1 90; 3 1 100; 4 1 90 }
End

Begin Bass-Simple
    Voice AcousticBass
    Sequence { 1 2 100; 3 2 90 }
End
```

Chaque piste peut ensuite être activée séparément.

# 6.10 Résumé

* `Chord` joue les accords.
* `Bass` crée une ligne de basse à partir des accords.
* `Drum` joue un rythme indépendant des accords.
* `Arpeggio` joue les notes des accords successivement.
* `Melody` contient des notes écrites explicitement.
* `Solo` est une piste de mélodie temporaire ou improvisée.
* Chaque piste peut avoir sa propre `Sequence`, son instrument et son volume.
* Plusieurs pistes peuvent être utilisées simultanément dans la même mesure.
