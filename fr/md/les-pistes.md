# Les pistes

## Présentation 

Dans MMA, une piste représente une partie musicale sous une des formes suivantes : 

- batterie (Drum) : batterie ou percussions qui en général en MIDI sont allouées au canal MIDI 10
- basse (Bass) : les notes d'un instrument de basse (contrebasse, basse, hélicon) souvent la fondamentale.
- basse walk (walk)  : les notes de la basse avancent note par note généralement sur chaque temps en reliant les accords entre eux
- accords (Chord) : les accords sont joués par une justaposition de notes
- arpèges (Arpeggio) : accords sous joués en arpèges
- échelle (Scale) :  motifs mélodiques construits à partir de la gamme associée à l’accord, généralement de façon répétitive et rythmique.
- médiator (Plectrum) : motif de l'accord joué notre par note comme un coup de médiator
- mélodie (Melody) : notes de la mélodie que l'on fournit note par note
- mélodie (Automatic Melody) : les notes sont trouvées par MMA de façon automatique.
- solo (Solo) : ornements solo 


Cette forme musicale représente donc une composante d'un orchestre et peut être multiple. De plus nous devrons associer aux composant
voulus un instrument
et chaque piste possède son propre instrument, son propre rythme et sa propre manière d'utiliser les accords du morceau.

Les noms des instruments correspondent aux instuments MIDI disponibles sur vote banque MIDI.


## Les silences

On peut génére un silence sur une piste de plusieurs façons :

- **OFF :** supprime la sortie sur toute la piste. Par exemple Bass Off
- **Seqence :** indique ce que joue la piste à chaque mesure. Par exemple Bass Sequence A B C D ( Mesure 1 A, Mesure 2 B etc ). 

On peut ainsi programmer un silence par la lettre z sur une mesure  par exemple sur la troisième par : Bass Seq A B z D

- On peut supprimer une séquence par SEQCLEAR : Drum SEQCLEAR
- Désactiver un canal MIDI en ajoutant le Canal 0: Arpeggio-1 Channel 0
- On peut supprimer le son sur une piste entière en lançant mma avec l'ption -T qui spécifie les pistes sur lesquelles il faut jouer



## Définition des pistes 

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

## Deux façons de configurer une piste 

Une piste a plusieurs paramètres et chaque paramètre peut avoir plusieurs qualificateurs. 
Par exemple le paramètre Arpeggio que vous verrons plus loin et qui consiste à jouer les accords en arpège peut avoir des paramètres comme Up ou Down pour jouer
l'arpège de bas ou haut ou de haut en bas en plus d'autres paramètre comme **Voice** qui peut être **piano**, **guitar** ou autre

On peut déclarer ces paramètres de façon globale ou sous forme répétitive 

### Méthode globale 

~~~mma
Begin Arpeggio
    Voice Guitar1
    Type Up
End
~~~

### Méthode répétitive 

~~~mma
Arpeggio Voice Guitar1
Arpeggio Type Up
~~~

## La piste Chord

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


Un certain nombre de paramètres peuvent agir sur la piste 

- **Octave :** place les accords sur l'octave demandé. 3 assez grave, 4 médium, 5 aigu, 6 très aigu
- **Volume :** change le niveau général de la piste. Il est exprimé en pourcentage 100 pour 100% 200 pour 200% etc...
- **Strum :** décale légèrement les notes de l’accord pour simuler un balayage de guitare. 0 pas de décalage, 10 décalages de 10 tikcs, 5 15 : décalage aléatoire entre 5 et 15, -30 inverse le sens de balayage
- **Direction :** sens du balayage quand Strum est utilisé, les valeurs peuvent être **Up** **Down** **Both** **Random**
- **Invert :** change le renversement de l’accord.Pour un accord de trois notes comme C = C E G ,  Invert 0 : C E G (position normale),  Invert 1 : E G C (premier renversement),  Invert 2 : G C E (deuxième renversement).On peut aussi utiliser des valeurs négatives :  Invert -1 : G C E  Invert -2 : E G C. Les valeurs possibles dépendent du nombre de notes dans l’accord. Pour un accord à 4 notes comme C7 (C E G Bb), on peut utiliser jusqu’à Invert 3.
- **Compress :** force toutes les notes de l’accord à rester dans une seule octave si Compress=1. Si la valeur est 1.2 l'accord est plus serré. Si la valeur est 1.5 il est plus élargi. Les valeurs sont généralement comprises entre 0.5 et 1.5
- **Limit :** limite le nombre de notes jouées dans un accord.Limit 0 : pas de limite (comportement normal) Limit 1 : transforme en monophonie (une seule note à la fois) Limit 2 : maximum deux notes simultanées Limit 3, 4, etc. : limite le “voicing” des accords
- **Voicing :** choisit automatiquement une disposition plus musicale des notes dans les accords. Peut prendre les valeur **close** pour des accords serrés, **open** pour ouvert, **Drop2** pour descendre la deuxième notre la plus hautre ou **Drop3** pour descendre la troisième note la plus haute ou **Random** pour une répartition aléatoires des notes  dans l'accord, **Fixed** basé sur la construction de base de l'accord,
- **DupRoot :** ajoute une ou plusieurs copies de la fondamentale à d’autres octaves. Valeur 0 pas de duplication fondamentale,1 la fondamentale est doublée une fois, 
2 la fondamentale est doublée 2 fois etc...
**NoteSpan** : limite la plage des notes jouées. 1 durée normale, >1 notes plus longues, <1 notes plus courtes. O.4 est Stacato, 1.2 et Légato. Si Strum décale le départ de la note, NoteSpan délale sa durée. Ces deux paramètres utilisés ensemble donnent un effet très réaliste.

## La piste Bass

La piste `Bass` utilise **automatiquement** les accords pour produire une ligne de basse.

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
Les paramètres de Bass sont : 
* Ceux déjà explicités : Octave, Volume, Direction, Strum, Limit,NoteSpan, 
* **Articulation :** qui peut être Staccato ou Legato
* **OctaveShift :** délacage supplémentaire d'octave par exemple -1 ou 1 
* **Sequence :** est une liste de bloc { note durée vélocité note durée vélocité ... } c'est à dire degré de l'accord, durée (1 pour noire), vélocité ou force (100)

## La piste Drum

### Les notations théoriques

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

- **Tone** peut prendre les valeurs  suivantes : 
    - pour les caisses claires : AcousticBassDrum (35), BassDrum1  (36), SideStick (37), AcousticSnare  (38), HandClap  (39) ElectricSnare  (40)
    - pour les toms : LowFloorTom (41) ClosedHiHat (42) HighFloorTom  (43) PedalHiHat  (44) LowTom (45) OpenHiHat (46) LowMidTom (47)
    - pour les toms + cymbales : HiMidTom (48) CrashCymbal1 (49) HighTom (50) RideCymbal1 (51) ChineseCymbal (52) RideBell (53) Tambourine  (54)
    - pour les cymbales et percusions : SplashCymbal (55) Cowbell  (56) CrashCymbal2  (57) Vibraslap  (58) RideCymbal2  (59) hiBongo (60) LowBongo (61)
    - pour les Congas et timbales : MuteHiConga (62) OpenHiConga  (63) LowConga  (64) HighTimbale  (65) LowTimbale (66) HighAgogo  (67) LowAgogo  (68)
    - pour les percussions diverses : Cabasa  (69) Maracas (70) ShortWhistle (71) LongWhistle  (72) ShortGuiro (73) LongGuiro  (74) Claves (75)
    - pour les bois et les cloches : HiWoodBlock  (76) LowWoodBlock  (77) MuteCuica  (78) OpenCuica  (79) MuteTriangle  (80) OpenTriangle (81)
    
- MMA acceptes les variantes de noms suivantes :  
    - KickDrum1 = BassDrum1 
    - SnareDrum1 = AcousticSnare
    - Snare =  38
    - Kick = 36
    - HHClosed = ClosedHiHat

- On peut bien sûr utiliser la note par son numéro et par un numéro non répertorié ici mais présent dans la banque MIDI utilisée
- On peut mélanger les couches comme : 
    - Tone AcousticSnare ElectricSnare
    - Tone ClosedHiHat OpenHiHat
    
### Les adaptations pratiques 

#### Drumkit MMA réaliste (funk / rock groovy)

- Kick : groove syncopé
    - Snare :
        - 2 & 4 = accents
        - ghost notes entre les temps
    - Hi-hat : croches + variations

- Codage : 

~~~mma 
Begin Drum-Kick
    Tone BassDrum1
    Sequence { 110 0 0 80  0 0 100 0 }
    RTiming 5
End

Begin Drum-Snare
    Tone AcousticSnare

    # 2 et 4 = accents forts
    # ghost notes = vélocité très faible
    Sequence {
        0 20 0 0   110 15 0 10
    }

    RVolume 10
    RTiming 8
    Articulate 70
End

Begin Drum-HiHat
    Tone ClosedHiHat OpenHiHat

    # Hi-hat constant + ouverture légère fin de mesure
    Sequence {
        70 60 75 65   70 60 90 40
    }

    RVolume 15
    RTiming 5
End
~~~


### Explications : 


#### Snare réaliste

~~~mma
 Sequence {
        0 20 0 0   110 15 0 10
    }

~~~

|    Position    |        Type      |
|:--------------:|:----------------:|
|2e double croche| ghost note (~20) |
|  temps 2       |   ACCENT (110)   |
|  après 2       |   ghost (~15)    |
|    fin         |     ghost (~10)  |

#### Kick humain

~~~mma
Sequence { 110 0 0 80  0 0 100 0 }
~~~

- pas parfaitement symétrique
- variation de vélocité
- groove légèrement funk


#### Hi-hat (vie humaine)

~~~mma
Sequence { 70 60 75 65   70 60 90 40 }
~~~


 - jamais même vélocité
 - accent léger
 - ouverture (90 à 40)

#### Paramètres essentiels 

~~~mma
RTiming 5–10
RVolume 10–15
~~~

- évite l'effet machine 5-10
- stimule l'imprécision humaine

### Synamique réaliste 

|Type de notes| Vélocité typique|
|:-----------:|:---------------:|
| Accent snare|	100–120         |
| Ghost note  | 10-30           |
| Hi-hat      | 50-90           |


 
## La piste Arpeggio

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

L'ordre dépend du réglage de la piste par le paramètre Type qui peut prendre les valeur 

- **Up :** les notes sont jouées de la plus grave à la plus aiguë
- **Down :** les notes sont jouées de la plus aiguë à la plus grave
- **UpDown :** va de la grave à l’aigüe puis revient à la grave
- **DownUp :**va de l'aigüe à la grave puis revient à l'aigüe
- **random :** l’ordre est aléatoire
- **chord:** tout est joué en même temps


Les paramètres suivant sont utilisés :

- **Octave :** permet de répéter l'arpège sur plusiers octaves
- **Repeat :** indique combien de fois répéter l'arpège.
- **Velocity :** peut aller de 0 pour silence à 127 pour volume maximum
- **Duration :** exprime la durée par exemple 120 
- **Articulate :** exprime l'articulation par exemple 80
- **Delay :** pour le délai par exemple 10
- **RTiming :** par exemple 5
- **Accent :** par exemple 1 3 
- **Rvolume :** par exemple 10
- **RPitch :**  par exemple 5
- **Rduration :**  par exemple 10
- **Range :** par exemple pour deux octave 2
- **Invert :** pour le renversement d'accord par exemple 1 


## La piste Melody

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

- **Cresc :** pour le crescendo par exemple 60 100
- **Delay :** pour un délais par exemple 10
- **Swing :** avec une valeur par exemple 60

## La piste Solo

- La piste `Solo` ressemble à `Melody`, mais elle est destinée à une improvisation ou à une ligne ponctuelle.
- Le signe + éléve d'un octave
- Le signe - descend d'un octave
- Les signes b et # sont les alitérations dièse et bémol
- le signe ~ effectue une liaison
- La durée est exprimée par 
    - 1 pour la ronde
    - 2 pour la blanche
    - 4 pour la noire
    - 8 pour la croche 
- Les accords s'exécutent entre { } : {c e g}


```mma
Solo Voice AltoSax

Solo
1 G
2 A
3 C+
4 D+
```

Elle peut être utilisée seulement dans certaines parties du morceau.

## Plusieurs pistes en même temps

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

## Nommer des pistes

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

## Résumé

* `Chord` joue les accords.
* `Bass` crée une ligne de basse à partir des accords.
* `Drum` joue un rythme indépendant des accords.
* `Arpeggio` joue les notes des accords successivement.
* `Melody` contient des notes écrites explicitement.
* `Solo` est une piste de mélodie temporaire ou improvisée.
* Chaque piste peut avoir sa propre `Sequence`, son instrument et son volume.
* Plusieurs pistes peuvent être utilisées simultanément dans la même mesure.
