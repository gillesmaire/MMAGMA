# La piste Aria

## Présentations

Une piste Aria est une mélodie automatique générée à partir des accords. Cette mélodie ne 
sera peut être pas équivalente au meilleurs solos que l'on peut entendre mais peut être
suffisante en tant qu'ornement lors d'un pont musical, au début ou à la fin d'une chanson.

Ces mélodies seront bien sûr générées à partir des accords qui figurent dans le morceau.

On peut créer autant de pistes Aria qu'on le souhaite et on peut jouer ces pistes Aia simultanément
ou les unes à la suite des autres.

Pour définir une piste Aira on devra choisir un instrument.

La majorité des commandes comme  OCTAVE, ARTICULATE, HARMONY, VOLUME, etc pourront s'appliquer à ces pistes ARIA.

## Les paramètres ARIA

### Range

Définit l'octave dans le quel la mélodie sera générée

Range 1 génèrera une mélodie avec des notes sélectionnées dans un octave

Range 2.5 génèrera la mélodie avec des notes sélectionnées dans deux octaves et démi

### ScaleType

Permet de choisir le type  d'intervalle  :

- **CHORD :** les notes sont choisies dans l'accord
- **SCALE :** est identique à CHORD 
- **AUTO :**  les notes ont choisies automatiquement
- **KEY :** choisit les notes via la signature donnée en clé, cest à dire le paramètre 
KEYSIG.
- **CHROMATIC :** choisit les douze tons commençant sur la fondamentale de l'accord.

On peut ajouter un signe - après chacun de ces types de mélodie e, par exemple CHORD-
Dans ce cas, la liste des notes utilisées pour la mélodie s'épuise au fur et à mesure, jusqu'à ce que toutes les notes aient été employées ou qu'un changement de tonalité, d'accord, etc., survienne. Ce mode permet, dans la plupart des cas, d'éviter la répétition des notes. On pourrait même y voir une sorte d'outil de composition dodécaphonique « au rabais » (ce qui, en réalité, est loin d'être le cas).


### Direction 

Lors du traitement d’un morceau par MMA, un pointeur de sélection de notes se déplace vers le haut ou vers le bas au sein d’une liste contenant les notes de la gamme choisie. Cette gamme peut être l’un des types d'intervalle  ScaleType décrits précédemment. Par défaut, le paramètre DIRECTION est fixé à la valeur « 1 », ce qui force  MMA à ajouter 1 à la position du pointeur après la génération de chaque note. Il est toutefois possible de définir cette valeur par un nombre entier compris entre -4 et 4, ou par une série de 1 à 4 lettres « r ». Les options « r » permettent d’obtenir des déplacements aléatoires (vous pouvez utiliser entre 1 et 4 « r ») 



~~~mma
Position Duration Volume; ...
~~~
}

## Exemple 

