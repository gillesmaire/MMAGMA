# La piste Scale

## Présentation 

Un motif SCALE est défini avec:

~~~mma
Position Duration Volume; ...
~~~

Chaque groupe consiste en un décalage de temps pour le point de départ, la durée de la note et le volume.


Par exemple :


~~~mma
scale Define S1 1 1 90
scale Define S4 S1 * 4
Scale Define S8 S1 * 8
~~~

Cet exemple définit trois modèles de gamme: "S1" est juste une seule note entière, pas si utile en soi, mais elle est utilisée
comme une base pour "S4" et "S8".
"S4" est de 4 noires et "S8" de 8 croches.
Tous les volumes sont réglés sur une vélocité MIDI de 90.
Les modèles de gammes sont très utiles dans les fins.
Plus d'options pour les gammes sont détaillées dans la SCALE DIRECTION  et SCALE TYPE (ici) sections.

## Exemple 

