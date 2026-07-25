# La piste Arpeggio

## Présentation 

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

## Exemples


