# La piste Chord


## Présentation 

La piste `Chord` joue les accords du morceau avec la syntaxe suivante : 


~~~mma
Chord Sequence {
    1 2 100
    3 1 90
    4 1 90
}
~~~

- La première colonne désigne une note pouvant prendre les valeurs 0 pour DO à 6 pour SI. 
Les corresponsances de notes sont données par le tableau suivant :

|Valeur|Note Française|Note anglaise|
|:----:|:------------:|------------:|
|   0  |      DO      |      C      |
|   1  |      RÉ      |      D      |
|   2  |      MI      |      E      |
|   3  |      FA      |      F      |
|   4  |      SOL     |      G      |
|   5  |      LA      |      A      |
|   6  |      SI      |      B      |

- La deuixème colonne désigne le nombre de temps. Ainsi dans notre exemple :
la piste jouera :
    -  C pendant deux temps
    -  F pendant un temps
    -  G pendant un temps

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
- **NoteSpan** : limite la plage des notes jouées. 1 durée normale, >1 notes plus longues, <1 notes plus courtes. O.4 est Stacato, 1.2 et Légato. Si Strum décale le départ de la note, NoteSpan délale sa durée. Ces deux paramètres utilisés ensemble donnent un effet très réaliste.

## Exemples


