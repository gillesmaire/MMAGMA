
# La piste Melody


## Présentation 

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

## Exemples 


