# La piste Bass

## Présentation

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

## Exemples


