# Comment faire un groove

## 1. Principe de fonctionnement de MMA

Rappelons  trois éléments fondamentaux utilisés  par MMA pour construire un groove.

**PATTERN (DEFINE)**

Un pattern décrit ce que joue un instrument pendant une mesure : les notes, leur position, leur durée et leur vélocité.

**SEQUENCE**

Une séquence associe un ou plusieurs patterns. Elle permet notamment de construire des rythmes sur plusieurs mesures.

**GROOVE**

Un groove mémorise la configuration des pistes et leurs séquences. Il pourra ensuite être rappelé dans un morceau avec une simple commande :

```mma
Groove Rock
```

Dans le chapitre décrivant l'(utilisation des grooves|utilisation-des-grooves.md) nous avons largement commenté la syntaxe d'appel des 
ces grooves notamment :

- l'utilisation consécutive de deux grooves sur deux mesures : Groove Swing CountrySwing
- la répétiion d'un groove par le caractère / :  Groove Swing / CountrySwing


## 2. Préparer le fichier

Nous allons créer un premier groove Rock en 4/4.

Créer un fichier texte nommé `rock.mma`.

Commençons par initialiser MMA :

```mma
SeqClear
SeqSize 1
Time 4
Timesig 4 4
```

- `SeqClear` réinitialise les séquences.
- `SeqSize 1` définit une séquence d'une mesure.
- `Time 4` définit la durée de la mesure en temps.
- `Timesig 4 4` définit la signature rythmique.

Pour cet exemple, nous travaillons sur une seule mesure qui sera répétée.

## 3. Créer les patterns de batterie

La batterie est constituée de plusieurs éléments indépendants.

Nous allons utiliser trois patterns :

- K1 : grosse caisse.
- S1 : caisse claire.
- H1 : charleston.

Voici les définitions :

```mma
Begin Drum Define

    K1 1 8 100 ; 2.5 8 85 ; 3 8 100

    S1 2 8 95 ; 4 8 95

    H1 1 8 70 ; 1.5 8 60 ;
       2 8 70 ; 2.5 8 60 ;
       3 8 70 ; 3.5 8 60 ;
       4 8 70 ; 4.5 8 60

End
```

La structure d'une note de batterie est :

```text
POSITION DUREE VELOCITE
```

Par exemple :

```mma
K1 1 8 100
```

Cela signifie :

- Position 1 : premier temps de la mesure.
- Durée 8 : croche.
- Vélocité 100 : intensité de la frappe.

La position `2.5` correspond au contretemps situé entre les deuxième et troisième temps.

Le point-virgule sépare les différentes notes d'un même pattern.

Nous avons maintenant trois patterns indépendants.

## 4. Affecter les patterns aux pistes

Il faut maintenant créer les pistes de batterie et leur affecter les patterns.

```mma
Begin Drum-Kick
    Tone KickDrum1
    Sequence K1
End

Begin Drum-Snare
    Tone SnareDrum1
    Sequence S1
End

Begin Drum-HH
    Tone ClosedHiHat
    Sequence H1
End
```

Chaque bloc `Begin / End` définit une piste.

`Tone` sélectionne le son de percussion.

`Sequence` indique quel pattern doit être joué.

Il est possible de créer plusieurs pistes Drum afin de séparer les différents éléments de la batterie.

## 5. Créer le pattern de basse

La basse utilise une syntaxe légèrement différente de celle de la batterie.

Chaque note comporte quatre informations :

```text
POSITION DUREE NOTE VELOCITE
```

La note est exprimée sous forme de degré de l'accord courant.

Voici notre première ligne de basse :

```mma
Begin Bass Define

    B1 1 4+8 1 90 ;
       2.5 8 1 85 ;
       3 8 1 90 ;
       3.5 4 1 85 ;
       4.5 8 1 85

End
```

Explications :

- `1` : premier temps.
- `4+8` : durée d'une noire pointée.
- `1` : fondamentale de l'accord.
- `90` : vélocité.

Le chiffre `1` désigne la fondamentale, `3` la tierce et `5` la quinte.

Nous pouvons maintenant créer la piste :

```mma
Begin Bass-Simple
    Voice AcousticBass
    Sequence B1
    Octave 3
End
```

`Voice` sélectionne l'instrument MIDI.

`Octave` définit la hauteur de jeu.

## 6. Créer l'accompagnement harmonique

Nous allons maintenant ajouter un accompagnement au piano.

Le pattern suivant joue deux accords par mesure :

```mma
Begin Chord Define

    C1 1 2+4 80 ; 4 4 80

End
```

La syntaxe d'un pattern Chord est différente :

```text
POSITION DUREE VELOCITE
```

Contrairement à la basse, MMA détermine les notes à jouer à partir de l'accord indiqué dans le morceau.

Créons la piste :

```mma
Begin Chord-RightHandPiano
    Voice Piano1
    Sequence C1
End
```

Nous disposons maintenant de quatre éléments musicaux :

- Grosse caisse.
- Caisse claire.
- Charleston.
- Basse.
- Piano.

## 7. Enregistrer le groove

La dernière commande permet de mémoriser la configuration :

```mma
DefGroove Rock
```

Cette commande enregistre les paramètres des pistes et leurs séquences sous le nom `Rock`.

Le groove est maintenant disponible dans le fichier.

Voici le contenu complet de notre premier groove :

```mma
SeqClear
SeqSize 1
Time 4
Timesig 4 4

Begin Drum Define
    K1 1 8 100 ; 2.5 8 85 ; 3 8 100
    S1 2 8 95 ; 4 8 95
    H1 1 8 70 ; 1.5 8 60 ;
       2 8 70 ; 2.5 8 60 ;
       3 8 70 ; 3.5 8 60 ;
       4 8 70 ; 4.5 8 60
End

Begin Bass Define
    B1 1 4+8 1 90 ;
       2.5 8 1 85 ;
       3 8 1 90 ;
       3.5 4 1 85 ;
       4.5 8 1 85
End

Begin Chord Define
    C1 1 2+4 80 ; 4 4 80
End

Begin Drum-Kick
    Tone KickDrum1
    Sequence K1
End

Begin Drum-Snare
    Tone SnareDrum1
    Sequence S1
End

Begin Drum-HH
    Tone ClosedHiHat
    Sequence H1
End

Begin Bass-Simple
    Voice AcousticBass
    Sequence B1
    Octave 3
End

Begin Chord-RightHandPiano
    Voice Piano1
    Sequence C1
End

DefGroove Rock
```

## 8. Tester le groove dans un morceau

Il faut maintenant créer un deuxième fichier, par exemple `test-rock.mma`.

On y charge notre fichier de groove avec la commande `Use`.

```mma
Use rock.mma

Tempo 120

Groove Rock

1 C
2 F
3 G
4 C
5 F
6 G
7 C
8 C
```

Lancer MMA :

```bash
mma test-rock.mma
```

MMA génère un fichier MIDI que l'on peut écouter avec son lecteur MIDI habituel.

On peut alors modifier les patterns du fichier `rock.mma` et relancer le test jusqu'à obtenir le résultat souhaité.

## 9. Créer une variation du groove

Un groove peut être décliné en plusieurs versions.

Par exemple, nous souhaitons créer une variante avec davantage de grosse caisse.

Il suffit de rappeler le groove initial, de modifier la séquence concernée et d'enregistrer une nouvelle définition.

```mma
Groove Rock

Drum-Kick Sequence { K1 ; K1 }
DefGroove RockPlus
```

Cette variante utilise deux mesures de séquence, avec le pattern K1 répété sur chacune d'elles.

On peut maintenant utiliser les deux versions dans un morceau :

```mma
Groove Rock
1 C
2 F

Groove RockPlus
3 G
4 C
```

Il est ainsi possible de créer plusieurs déclinaisons d'un même accompagnement.

## 10. Quelques règles importantes

**Ne pas confondre DEFINE et SEQUENCE.**

DEFINE décrit les notes d'un pattern. SEQUENCE organise les patterns dans le temps.

**Attention à SeqSize.**

La taille de la séquence détermine le nombre de mesures avant répétition. Une séquence de quatre mesures permet de créer des accompagnements plus évolutifs.

**Attention à DefGroove.**

Un groove mémorise les séquences et les paramètres des pistes, mais pas les définitions des patterns elles-mêmes. Il faut donc éviter de réutiliser les mêmes noms de patterns en les redéfinissant sans précaution.

**Ne pas multiplier inutilement les pistes.**

Une piste distincte est utile lorsqu'on souhaite contrôler séparément un instrument ou un élément de percussion. Mais plusieurs éléments peuvent également être regroupés dans une même piste lorsque cela est pertinent.

**Toujours écouter le résultat.**

Un fichier MMA peut être parfaitement valide du point de vue syntaxique sans pour autant produire un accompagnement musical intéressant.
