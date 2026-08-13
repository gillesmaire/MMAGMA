# Volumes et dynamique



## Vélocité 

La vélocité est l'intensité de chaque note jouée contrairement à 
l'augmentation générale du niveau général qui dépendra de la variable MIDIVolume.

La vélocité initiale dépend du paramètre vélocité donné dans une 
Sequence, par exemple 

~~~mma
Bass Sequence { .5 8 5 70; 1 4 1 90; 3 4 5 90 } 
~~~

Les vélocités 70,90 et 90 sont celles définies sur la basse à l'initialisation.

Il est possible de modifier le volume non pas par un pourcentage mais par des valeurs suivant le tableau suivant : 

|  Nom symbolique  |   Pourcentage  |   Notation musicale   |
|:----------------:|:--------------:|:---------------------:|
| off              |        0       |                       |
| pppp             |        5       |     pianissississimo  |
| ppp              |       10       |     pianississimo     |
| pp               |       25       |     pianissimo        |
| p                |       40       |     piano             |
| mp               |       70       |     mezzo-piano       |
| m                |      100       |     mezzo             |
| mf               |      110       |     mezzo-forte       |
| f                |      130       |     forte             |
| ff               |      160       |     fortissimo        |
| fff              |      180       |     fortississimo     |
| ffff             |      200       |     fortissississimo  |

On positionnera le volume par la variable Volume : 

~~~mma
Volume ff
~~~

On peut modfier le pourcentage correspondant à un nom symbolique, par exemple mf eut être changé de sa valeur par défaut qui est 110 à 115

~~~mma
AdjustVolume MF=115 
~~~

Cela peut se faire pour plusieurs valeurs à la fois 

~~~mma
AdjustVolume MF=115 f=120
~~~

On peut utiliser les variables comme mp pour faire des calculs

~~~mma
AdjustVolume Mf=mp+200 
~~~

La notation suivante ajoute 20% à la valeur actuelle

~~~mma
AdjustVolume mf=+20
~~~

## L'accent

L'accent suivant les types de musique peut être sur le premier et le troisième temps ou sur le premier temps. 

Par exemple la notation :

~~~mma
Define Walk W1234 1 4 100; 2 4 70; 3 4 80; 4 4 70 
~~~

Peut être remplacée par une initialisation globale suivi du paramètre Accent comme suit : 


~~~mma
Define Walk W1234 1 1 90 * 4 
Walk Accent 1 20 2 -10 4 -10 
~~~

La dernière commande signifie : 

    - la première note est augmentée de 20%
    - la deuxième note est diminuée de 20%
    - la troisième note n'est pas concernée par la commande et reste donc inchangée
    - la quatrième note est diminuée de 10%

On peut également utiliser l'accent avec une autre syntaxe désignant les mesures sur lesquelles s'appliquent l'initialisation : 

~~~mma
Bass Accent {1 20} // {1 30 3 30} 
~~~

Ici l'accent s'effectue 

    - sur la mesure 1 au battement 1 par une augmentation de 20%
    - sur la mesure 2 et 3 on répète la même augmenation qu'à la mesure 1
    - sur la mesure 4 au battement 1 par une augmentation de 30% et au battement 2 
     par une augmentation de 30%

Pour supprimer les accents sur les mesures à suivre : 

~~~mmma
Bass Accent
~~~


## Le volume général ou master

MMA utilise les volumes des pistes et du master pour déterminer la vélocité d'une 
note.  Par défaut le volume de la piste est à 60% et le volume du master est  à
40%.


On peut changer ces ratios en affectant une valeur de Ratio  à la variable AdjustVolume. Par défaut on a: 

~~~mma
AdjustVolume Ratio=60 
~~~


On peut passer le volume de la piste à 40% et donc le volume du master à 60% par
la commande:

~~~mma
AdjustVolume Ratio=40
~~~

Si on veut n'écouter que la piste et plus l'ensemble des autres pistes: 

~~~mma
AdjustVolume Ratio=100
~~~

Et si on veut muter la piste:

~~~mma
AdjustVolume Ratio=0
~~~


## Volume

La commande *Volume* permet de régler le volume des pistes ou du master. 

Pour régler la commande du master à *piano*: 

~~~mma
Volume p
~~~

Pour régler la commande de la piste Guitar-Solo à fortissimo.

~~~mma
Guitar-Solo ff
~~~

Notons que dans la plupart des cas, les volumes des pistes se feront dans les Groove, à part pour les pistes solo qu'on peut écrire dans le fichier MMA.

On peut modifier le volume d'une piste en spécifiant ses volumes sur les mesures:

~~~mma
Drum Volume mp ff / ppp
~~~

Ici le / sert encore à répéter la valeur ff.


On peut chosir un volume entre fff (180) et ffff (200) par exemple 189 par la 
commande : 

~~~mma 
Volume 189
~~~

Mais il reste plus optimal de régler le snon non pas en valeur absolue mais en  valeur relative : 

~~~
Volume -20%
~~~

Cette commande baissant le son du général de 20%.

## Cresc et Decresc


Cresc et Decresc permettent de monter ou de descendre le volume sur une ou plusieurs mesures. Ces deux commandes peuvent s'appliquer à une piste ou au master.

Si on augmente vers un volume inférieur, un Warning sera généré et aucune augmentation de son ne sera constatée. Cette remarque s'applique également à la diminution du volume vers un volume supérieur.

Chacune de ces commandes nécessitent deux ou trois arguments :
 
    - le volume de départ 
    - le volume de fin 
    - le nombre de mesures affectées par ce changement de volume sonore.
    
Si on n'utilise que deux arguments, le volume de départ sera considéré comme le volume courant et les deux arguments donnés correspondrons au volume de fin et au nombre de mesures concernées par la variation de
volume.

À titre d'exemple la commande suivante va augmenter le volume courant vers forte pendant 2 mesures. 

~~~mma
Crec f 2
~~~

La commande suivante va baisser la piste nommée Guitar-Solo sur 2 mesures

~~~mma
Guitar-Solo Decresc pp  2
~~~

Les commandes Cresc et Decresc peuvent être utilisées non plus avec les valeurs musicales pp ff mais avec des valeurs numériques ce qui n'est peut être pas la meilleure des pratiques

On peut également utiliser les valeurs en pourcentages, par exemple:

~~~mma
Decresc -10% 40% 4
~~~

## Swell

La technique Swell appelée en musique messa di voce, consiste à créer un crescendo suivi d'un decrescendo ou l'inverse, c'est  à dire un descrescendo suivi d'un crescendo.

Un Swell peut être appliqué sur le volume général ou sur une seule piste.

   - Sur une piste 

~~~mma
Chord Swell pp ff 4
~~~
 
   - Sur le volume général 

~~~mma
Swell pp ff 4
~~~

On donne le volume de départ, le volume d'arrivée et le nombre de mesures sur les quelles va s'opérer le Swell.

Si on donne un seul volume, le Swell se fera du volume actuel à celui de la fin.

## RVolume

Dans la commande RVolume le R vient de random, et elle  peut s'appliquer à une piste. Par défaut, toutes les pistes ont le paramètre RVolume positionné à 0. 

Si on positionne le RVolule à 10, chaque notes aura un volume qui sera modifié aléatoirement  de 10% plus haut ou plus bas. L'idée est de reproduire un jeu humain et non pas mécanique.

On peut spécifier le volume avec deux valeurs dans ce cas la première sera la le pourcentage maximum et la deuxième le pourcentage minimum.

Ainsi sont équivalents : 

~~~mma
Chord RVolume -10 10
Chord RVolule 10
~~~

On peut également fournir  une liste de volumes minima maxima : 

~~~mma
Chord RVolume 0,10 -10,0 -10,20 8 
~~~


## Sauvegarde et restauration des volumes


Souvent les volumes sont définis dans le Groove et la meilleure façon de modifier un de ces volumes est de  modifier la piste concernée de la façon suivante :

~~~mma
Groove GrooveConcerne
PisteConcernee Volumm ff
DefGroove GrooverConcerne
~~~

Pour récupérer un ancien volume utilisé on peut utiliser la macro $_LastVolume.

Par exemple : 

~~~mma
Volume ppp

Cresc f 5 
$_LastVolume
~~~




