# Les Riffs dans MMA

## Introduction

Dans MMA, un **riff** est une séquence musicale que l’on impose directement à une piste (basse, accords, batterie, etc.), au lieu de laisser le groove générer automatiquement le jeu.

Autrement dit :

* dans le **groove** le jeu est automatiquement basé sur des patterns
* dans le **riff** ont écrit exactement ce qui doit être joué


Les riffs peuvent être définis 
- en degrés d'accord 
- en notation ryhtmique

Mais il faut garder présent à l'esprit que dans le riff comme dans les groove aucune note n'est donnée. On va écrire le Riff en degrés par rapport à la 
fondamentale de l'accord.

1. la fondamentale de l'accord
2. la seconde 
3. la tierce
4. la quarte
5. la quinte
6. la sixte
7. la septième
8. l'octave
9. neuvième
11. onzième (sus)
13. treizième

### Notation en degrés d'accord 

~~~mma
Bass Riff 1 5 8 5  1 5 6 5  1 4 3 2  1 5 1 5
~~~

Ceci veut dire qu'à partir d'un accord quelconque le riff jouera 

- 1 : la note fondamentale de l'accord
- 5 : la quinete 
- 8 : l'octave 

### Notation en position durée vélocité

Dans cette notation chaque bloc est : 

~~~
position durée vélocité
~~~

- position :
    - 1   : début de la mesure
    - 1.1 : petit décalage pour faire humain
    - 1.5 : à la double croche
    - 1.5 : à la croche
    - 2   : deuxième temps
    - 3   : troisième temps
    - 4   : quatrième temps
    - etc
- durée de la note : 
    - 1   : ronde 
    - 2   : blanche
    - 4   : noire
    - 8   : croche
    - 16  : double croche
    - 32  : triple croche
- vélocité : 
    - 100 : fort
    - 90  : moins fort
    - 80  : plus doux

## Principe

Un riff remplace temporairement le comportement normal d’une piste.

Exemple :

```
Bass Riff 1 4 1 4
```

Dans cet exemple, on impose une ligne de basse précise en degrés indépendamment du groove.



## Fonctionnement

Quand un riff est actif :

* MMA **n’utilise plus le pattern du groove** pour cette piste
* il joue **exactement la séquence définie**

le riff a donc priorité sur le groove



## Durée d’un riff

Un riff s’applique :

* sur **une mesure**
* ou sur **plusieurs mesures** si la séquence est longue

Ensuite :

* soit il s’arrête
* soit il est répété
* soit il est remplacé par un autre riff



## Syntaxe générale

```
Track Riff <séquence>
```

où :

* `Track` = Bass, Chord, Drum, Arpeggio, etc.
* `<séquence>` = notes, positions rythmiques, ou événements



## Exemple simple

```
Bass Riff 1 5 6 5
```

produit une ligne de basse typique (tonique, quinte, sixte…)



## Riff sur plusieurs mesures

Un riff peut contenir plusieurs mesures implicites :

```
Bass Riff 1 5 1 5  6 5 4 5
```

ici :

* 1ère mesure → 1 5 1 5
* 2ème mesure → 6 5 4 5



## Interaction avec les accords

Le riff est **relatif à l’accord courant**.

Exemple :

```
Bass Riff 1 5 1 5

C
F
G
```

donnera :

* sur C → C G C G
* sur F → F C F C
* sur G → G D G D


## Riff et silence

On peut introduire des silences dans un riff, selon la syntaxe des patterns :

```
Bass Riff 1 z 5 z
```

 joue une note puis un silence, etc.


## Riff et répétition

Un riff peut être :

* utilisé une seule fois
* ou répété automatiquement selon le contexte

Si la longueur du riff est plus courte que la séquence :

 il peut être **réutilisé**



## Riff vs Sequence

Il ne faut pas confondre :

### Sequence

```
Bass Sequence B1 B2
```

alterne des patterns prédéfinis

### Riff

```
Bass Riff 1 5 1 5
```

impose directement les degrés de la gamme



## Riff vs Groove

* le **groove** définit le style global
* le **riff** force une piste spécifique

les deux peuvent coexister


## Exemple complet

```
Groove Rock

Bass Riff 1 5 1 5

C
F
G
C
```

- batterie et accords suivent le groove
- basse suit le riff



## Utilisation typique

Les riffs sont utiles pour :

* créer une **ligne de basse précise**
* écrire un **hook reconnaissable**
* faire une **variation ponctuelle**
* casser la monotonie d’un groove



## Astuces

* Utiliser les riffs avec parcimonie : trop de riffs rendent le morceau rigide
* Les combiner avec les grooves pour garder un aspect vivant
* Les utiliser pour les intros, breaks ou transitions



## Résumé

* Un riff impose une séquence musicale
* Il remplace le comportement du groove pour une piste
* Il est relatif à l’accord en cours
* Il permet un contrôle fin et précis



Les riffs sont l’outil idéal quand on veut prendre la main sur MMA et écrire soi-même une partie musicale.

