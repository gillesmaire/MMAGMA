# La piste Drum Tone

## Présentation 

## Exemple 



## Combinaison des pistes

### Plusieurs pistes en même temps

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

### Nommer des pistes

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

