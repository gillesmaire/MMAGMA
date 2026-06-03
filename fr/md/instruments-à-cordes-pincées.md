# Instruments à cordes pincés


## Présentatilon

Les pistes *plectrum* sont concues pour permettre de créer des pistes qui sonnet comme de vrais
instruments à cordes. Dans ces pistes la durée de la note n'est pas utilisée, à savoir que la note
est maintenue jusqu'a ce que la note suivante soit jouée  ou que la note actuelle soit arrêtée.

## Définition d'un instrument 

Par défaut l'instument "plectrum" est une guitare à savoir que la suite de note est e- a- d g b e+ 


On va permettre de défnir l'instrument par la commande 


~~~mma
Plectrum Tuning
~~~

- Exemple : Un banjo 4 cordes sera défini comme suit : 

~~~mmm
Plectrum Tuning g - d a e+
~~~ 

Pour une séqunce une seule piste PLECTRUM peut être définie. Ce tuning est enregistré dans le Groove
On peut définiot des instruments totalement différents de ceux existants chez votre luthier.


## La directive Capo

On peut simuler l'utilisation d'un capodastre :
Par exemple : 

~~~mma 
Plectrum capo2
~~~

jouera toutes les notes 2 demi ton a dessus

~~~mma 
Plectrum capo-2 
~~~

jouera toutes les notes 2 demi ton a dessous

Si on dépasse la valeur 127 on qu'on descend en dessous de 0 on n'entendra pas la note.

Un seul capo par séquence peut être défini

## Strum

Par défaut, tous les motifs PLECTRUM calculent leurs décalages STRUM (retards) à partir de la première corde. 

On peut changer ce mécanisme pour calculer ces décalates par rapport à Start, Center ou End

## Articulate


