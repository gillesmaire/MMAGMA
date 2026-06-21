# Instruments à cordes pincés


## Présentatilon

Les pistes *plectrum* sont concues pour permettre de créer des pistes qui sonnent comme de vrais
instruments à cordes. Dans ces pistes la durée de la note n'est pas utilisée, à savoir que la note
est maintenue jusqu'à ce que la note suivante soit jouée  ou que la note actuelle soit arrêtée.

## Définition d'un instrument 

Par défaut l'instument "plectrum" est une guitare à savoir que la suite de note est e a d g b e 


On va permettre de définir l'instrument par la commande 


~~~mma
Plectrum Tuning e- a- d  b b e+ 
~~~


- e- est le MI grave
- a- le LA grave
- e+ est le LA aigu


- Exemple : Un banjo 4 cordes est être défini comme suit : 

~~~mmm
Plectrum Tuning g- d a e+
~~~ 

Pour une séqunce une seule piste PLECTRUM peut être définie. Ce tuning est enregistré dans le Groove
On peut donc définir des instruments totalement différents de ceux existants chez un luthier.


## La directive Capo

On peut simuler l'utilisation d'un capodastre, accessoire qu'on ne trouve que sur les instruments à cordes.

Par exemple : 

~~~mma 
Plectrum capo2
~~~

jouera toutes les notes 2 demi ton a dessus :

~~~mma 
Plectrum capo-2 
~~~

jouera toutes les notes 2 demi ton a dessous.

Si on dépasse la valeur 127 on qu'on descend en dessous de 0 on n'entendra pas la note.

Un seul capo par séquence peut être défini.

L'utilisation de la directive Capo ne modifie pas la hauteur des accords, à savoir qu'un ré mineur reste un ré mineur, 
par contre il sera automatiquement joué décalé  donc joué non plus en ré mineur mais en mi mineur automatiquement. 

## Strum

Par défaut, tous les motifs PLECTRUM calculent leurs décalages STRUM (retards) à partir de la première corde. 

On peut changer ce mécanisme pour calculer ces décalages par rapport à Start, Center ou End

La directive par défaut qui est Start.

Par exemple pour forcer le décalge à Center : 

~~~mma
PLECTRUM STRUM  CENTER
~~~


## Articulation


