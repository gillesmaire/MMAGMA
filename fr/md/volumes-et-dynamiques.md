# Volumes et dynamique



## Vélocité 

La vélocité est l'intensité de chaque note jouée contrairement à 
l'augmentation générale d'une piste qui dépendra de la variable MIDIVolume.

La vélocité initiale dépend du paramètre vélocité donné dans une 
Sequence, par exemple 

~~~mma
Bass Sequence { .5 8 5 70; 1 4 1 90; 3 4 5 90 } 
~~~

Les vélocités 70,90 et 90 sont celles définies sur la basse à l'initialisation.

Il est possible de modifier le volume non pas par un pourcentage mais par des valeurs suivant le tableau suivant : 

|  Nom symbolique  |   Pourcentage  |
|:----------------:|--------------:|
| off              |        0       |
| pppp             |        5       |
| ppp              |       10       |
| pp               |       25       |
| p                |       40       |
| mp               |       70       |
| m                |      100       |
| mf               |      110       |
| f                |      130       |
| ff               |      160       |
| fff              |      180       |
| ffff             |      200       |

On positionnera le volume par la variable Volume : 

~~~mma
Volume ff
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
    - sur la mesure 4 au battement 1 par une augmentation de 30% et au battement 2 par une augmentation de 30%

Pour supprimer les accents sur les mesures à suivre : 

~~~mmma
Bass Accent
~~~


## Ajuster les volumes


