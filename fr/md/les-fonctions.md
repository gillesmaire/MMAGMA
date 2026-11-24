# Les fonctions 

Les fonctions sont définies par un ordre DefCall et slont appelées par un ordre Call.
L'usage de ces fonctions est simplifié par rapport aux concepts que l'on trouve dans 
les langages évolués.

Deux ordre permettent d'utiliser les fonction : 

- Un ordre définition : DefCall
- Un ordre pour appeler une fonction : Call

## DefCall

Pour créer une fonction on déclare son nom comme ceci

~~~mma 
defCall MaFoncion
print "Bonjour"
endDefCall
~~~

- On peut indifférement utiliser EndDefCall ou DefCallEnd
- Le nom de la fonction doit être sur la même lgen que DefCall
- EndDefCall et DefEndCall doivent occuper une ligne entière.
- La fonction doit être définie avant d'être appelées
- Le nom de la fontion est insensible à la casse

On peut ajouter un ou plusieurs paramètres à la foncion  par la syntaxe suivante :

~~~mma
defCall MaFconction Parametre1, Parametre2
   print Bonjour: $parametre1 
   Default Parametre2="chaine"
endDefCall 
~~~

- les paramètres définis doivent être séparés par des virgules
- on peut positonner la valeur par défaut d'un paramètre et le rendre ainsi optionnel
- les fonctions MMA ne retournent pas de valeur

# Appel de la fonction 

L'appel de la fonction se fait par la syntaxe

~~~mma
Call bonjour, autre argument
~~~
- Le séparateur d'arguments est la virgule
- Si un paramètre comprend une virgule cette virgule devra être backoté par le caractère \
