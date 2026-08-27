# La piste Solo

## Présentation 

Une piste `Solo` est destinée à une improvisation ou à une ligne ponctuelle, qui ne fera pas 
partie d'un Groove mais sera incluse dans un fichier MMA. 

Pour inclure un Solo on devra définir l'instrument, cet instrument ne faisant pas 
nécessairement partie des instruments du Groove en cours : 

~~~mma
Solo Voice AltoSax
~~~


- Les réglages des pistes Solo ne sont pas sauvegardés ni récupérables via la commande 
   Groove. 
- Un certain nombre de réglages sont donc nécessaires pour les pistes Solo, 
   ces paramètres sont généralement définis en préambule de votre fichier MMA, ces paramètres
   étant utilisables pour la chanson entière.
  
##  Armure


Pour chacune des pistes Solo ou Mélodie, on devra définir l'armure c'est à dire les dièses et les bémols  de début de portées qui s'appliquent à la partition ou plus simplement la tonalité du morceau.

En général la tonalité d'un morceau est donnée par le dernier accord joué qui fait office de conclusion musicale.


Ceci se définit par le mot clé **KeySig**.

Le tableau suivant donne les Keysig de base représentant les tonalités de chacunes des tonalités majeures et mineures.

| Keysig | Tonalité majeure | Tonalité mineure |
|:-------|:----------------:|:----------------:|
|    0   |  Do              |  Lam             |
|    1#  |  Sol             |  Mim             |
|    2#  |  Ré              |  Sim             |
|    3#  |  La              |  Fa#m            |
|    4#  |  Mi              |  Do#m            |
|    5#  |  Si              |  Sol#m           |
|    6#  |  Fa#             |  Ré#m            |
|    7#  |  Do#             |  La#m            |
|    1b  |  Fa              |  Rém             |
|    2b  |  Sib             |  Solm            |
|    3b  |  Mib             |  Dom             |
|    4b  |  Lab             |  Fam             |
|    5b  |  Reb             |  Sibm            |
|    6b  |  Solb            |  Mibm            |
|    7b  |  Dob             |  Labm            |


Le bémol est noté b mais peut être remplacé par le caractère &.
Le dièse quant à lui est noté #.

On peut utiliser la notation 1b ou Fa et on précise :

   - Maj, Major ou rien  pour le mode majeur
   - Min ou Minor pour le mode mineur

On peut utiliser indifférement la notation 

   - 1# 
   - G 

Bien sûr on peut également utiliser des armures différentes pour produire des mélodies qui sortent des tonalités. 


Voici quelques exemples de KeySig équivalents  : 

~~~mma
KeySig 2#
KeySig 2# Major
KeySig 2# Maj
KeySig D 
KeySig D Maj
KeySig D Major
~~~~



- Le signe + élève d'un octave
- Le signe - descend d'un octave
- Les signes b et # sont les alitérations dièse et bémol
- le signe ~ effectue une liaison
- La durée est exprimée par
    - 1 pour la ronde
    - 2 pour la blanche
    - 4 pour la noire
    - 8 pour la croche
- Les accords s'exécutent entre { } : {c e g}


```mma
Solo Voice AltoSax

Solo
1 G
2 A
3 C+
4 D+
```

Elle peut être utilisée seulement dans certaines parties du morceau.

## Exemples 


