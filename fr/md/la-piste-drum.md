# La piste Drum

## Présentation

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

## Les adaptations pratiques

### Drumkit MMA réaliste (funk / rock groovy)

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

### Kick humain

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

### Paramètres essentiels

~~~mma
RTiming 5–10
RVolume 10–15
~~~

- évite l'effet machine 5-10
- stimule l'imprécision humaine

## Synamique réaliste

|Type de notes| Vélocité typique|
|:-----------:|:---------------:|
| Accent snare|	100–120         |
| Ghost note  | 10-30           |
| Hi-hat      | 50-90           |




