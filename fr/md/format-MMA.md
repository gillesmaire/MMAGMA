# Format MMA 

## Présentation

Comparé aux motifs, séquences, Grooves et les différentes directives utilisé dans MMA, les notations d'accords barre par barre sont étonnamment simple.

Toute ligne dans votre fichier de saisie qui n'est pas une directive ou un commentaire est supposée être une barre de données d'accords.

Une ligne pour les données d'accords se compose des parties suivantes:

- Numéro de ligne optionnel,
- Données d'accord ou de repos (avec indicateur de position optionnel),
- Données lyriques optionnelles,
- Données solo ou mélodies optionnels,
- Multiplicateur facultatif optionnels.

Formellement, une ligne devient: 

~~~mma
[num] Accord [accord ...] [lyrique] [solo] [* facteur]
~~~

Ainsi on peut voir ces différentes lignes :

- Cm
- Cm Dm
- 10 Cm Dm

## Numéros de barre

Le numéro de barre d'attaque optionnel est silencieusement écarté par MMA. C'est juste un commentaire spécialisé qui vous aide à déboguer votre musique. Notez que seul un élément numérique est autorisé ici.

Prenez l'habitude d'utiliser des numéros de barre. Vous vous remercierez quand une barre manquera à une chanson ou au contraire quand il y en aura une de trop, ainsi que si vous êtes amené à vouloir travailler sur quelques lignes d'accords et à extraire ces quelques lignes par la commande `mma -b`.

Notez qu'il est parfaitement acceptable de n'avoir qu'une barre numéro sur une ligne. Ceci est courant lorsque vous utilisez une répétition du genre : 

~~~mma
1 Cm * 4
2
3
4
5 A
~~~

## Le commutateur facteur

Souvent, la musique a plusieurs barres identiques séquentielles et au lieu de saisir ces barres MMA dispose d'un multiplicateur optionnel qui peut être placé à la fin d'une ligne de musique données. Ce multiplicateur permet de répéter l'accord courant le nombre spécifié de fois.

**Exemple:**

~~~mma
Cm Cm Dm Dm * 4
~~~

produit 4 mesures de sortie.

Cela évite d'écrire 

~~~mma
Cm Cm Dm Dm
Cm Cm Dm Dm
Cm Cm Dm Dm
Cm Cm Dm Dm
~~~~

Nous verrons que l'on aurait pu écrire :


~~~mma
Cm / Dm / * 4
~~~

ou même

~~~mma
Cm - Dm - * 4
~~~


## Les accords

Sur chaque ligne on doit entrer au moins un accord.
S'il y a moins d'accords que la mesure, le dernier accord est ajouté autant de fois que nécessaire.

Ainsi sur une mesure à quatre temps ces combinaisons sont identiques : 

~~~mma
Cm 
Cm Cm 
Cm Cm Cm
Cm Cm Cm Cm
~~~

Un / ou un - permet de répéter l'accord à gauche du symbole.
Ainsi toutes ces lignes sont identiques pour une mesure à quatre temps

~~~mma
Cm 
Cm Cm 
Cm Cm Cm
Cm Cm Cm Cm
Cm /
Cm /  /
~~~
 
Si on commence une ligne par /, le dernier accord de la ligne précédente sera utilisé.
Par contre, si le premier accord est précédé d'un / vous obtiendrez une erreur.


Voici la liste des symboles suivant le noms de l'accord supportés :

#5 add#9 add9 addb9 b5 + +7 +7#9 +7b9 +7b9#11
+9 +9M7 +M7 11 11#5 11+ 11b9 13 13#11 13#9 13b5
13b9 13sus 13sus4 13susb9 5 6 6(add9) 69 7 7#11
7#5 7#5#9 7#5b9 7#9 7#9#11 7#9b13 7(6) 7(add13)
7(omit3) 7+ 7+5 7+9 7-5 7-9 7alt 7b13 7b5 7b5#9
7b5(add13) 7b5b9 7b9 7# 7b9#5 7b9b13 7b9sus 
7omit3 7sus 7sus2 7sus4 7susb9 9 9#11 9#5 9+
9+5 9-5 9b5 9b6 9sus 9sus4 M M#11 M11 M13 M13#11 
M6 M7 M7#11 M7#5 M7(add13) 7th M7(add6) M7-5
M7b5 M7+5 M9 M9#11 add#9 add9 addb9 aug aug7 
aug7#9 aug7b9 aug9 dim aug9M7 dim(b13) dim3 dim7
dim7(addM7) m m#5 m#7 m(add9) m(b5) m(maj7) 
m(sus9) m+ m+5 m+7 m+7#9 m+7b9 m+7# m11 m11b5 
m13 m6 m6(add9) m69 m7 m7#5 m7#9 m7(#9)
m7(add11) m7(add13) m7(b9) m7(omit5) m7-5 m7b5
m7b5b9 m7b9 m7# m7omit5 m7sus m7sus4 m9 m9#11 
m9b5 mM7 mM7(add9) maj13 maj7 maj9 mb5 mb9 
min#7 min(maj7) msus msus4 omit3(add9) 
omit3add9 sus sus(add#9) sus(add9) sus(addb9) 
sus2 sus4 sus9 o o(addM7) o3

Sachant que la première lettre est forcément comprise entre A et E
Cela donne par exemple des noms d'accord valides

~~~mma
A#5 B Cmag7 C13#11 Dadd#9 Edim7(addM7) F7#9#11 G7b5(add13)
~~~

## Les silences



Lorsqu'une piste est créée, elle peut contenir des périodes de silence. Par exemple,
dans une piste de contrebasse, nous ne voulons probablement pas le son perdure sur 
une barre entière: nous pouvons faire sonner les notes sur le premier et deuxième temps
et mettre en sourdine les deuxième et quatrième temps.

Ou bien que se passe-t-il si nous utilisons une piste et que nous voulons pas de
la note du troisième temps ? 

Pour mettre en sourdine  une note ou une série de notes, sur une piste (ou toutes les pistes) 
on peut utiliser un nom d'accord spécial nommé z. 

Lorsqu'on utilise z collé derrière  un nom d'accord, il mettra en sourdine toutes les pistes à
l'exception des pistes DRUM. 
Vous pourrez cependant désactiver les pistes  Accords, Arpège, Gamme, Basse, Basse en Walking, Vocal ou Basse
en ajoutant un spécificateur de piste à  z. 

Les spécificateurs de piste sont : 

- *D* les pistes de batterie (Drum)
- *W* les pistes de basses en walking 
- *B* les traces de basse,
- *C* les pistes d'accord (Chord),
- *A* les pistes d'arpège,
- *S* les pistes de gamme (Scale),
- *R* les pistes en vocal (Aria),
- *P* les pistes de plectre.
- *!* les silences. 

Si vous ne spécifiez pas un nom d'accord juste avant ces spécificateurs, l'accord précédent sera utilisé. 

On ne peut pas utiliser un accord Nom avec le spécifiateur !.

Prenons la séquence d'accord suivante :

~~~mma
Fm z G7zC CmzD zW Em / z! 
~~~

- **Fm :** accord de Fa mineur avec basse et batterie
- **z :** aucun accord
- **G7zC :** accord de Sol7 sans l'accord mais avec basse et batterie
- **CmzD :** accord de Do mineur sans batterie
- **zw :** pas de basse walk mais accord et batterie sur l'accord précédent qui était Do mineur
- **Em :** accord de Mi mineur avec basse et batterie
- **/ :** accord précédent c'est à dire M mineur avec basse et batterie
- **z! :** pas d'accord mais un silence  renforcé par un ! qui produit un silence plus brutal.

On peut également mettre en sourdine toutes les pistes à une ou plusieurs exceptions près en utilisant non pas
le point d'exclamation mais le signe + suivi des pistes que l'on veut mettre en sourdine

~~~mma
Fm / Emz+C
Fm / Emz+AD
~~~

- Dans la première ligne on met tout en sourdine sauf l'accord
- Dans la deuxième ligne on met tout en sourdine sauf l'arpège et la batterie


## Position 


La notation suivante représente Dom Dom Rém Rém. Le deuxième Dom vient de la barre / et le deuxième
Dm vient du fait que si la mesure n'est pas remplie on la remplit avec le dernier élément.


~~~mma
Cm / Dm
~~~


Le sybbole @ sert quant à lui à dire :

- on veut cet accord à ce moment exact dans la mesure
- Par exemple Dm@3 : Le rém commence au temps 3

Ainsi 
~~~mma
C D@3 F
~~~


En 4/4 :

- C : le temps 1 dure jusqu’à 3
- D : commence à 3  pour un temps
- F : commence à 4


~~~mma
C D@3.5 F
~~~

- C : le temps 1 dure jusqu’à 3,5
- D : commence à 3,5 et fait un demi temps
- F : commence à 4


On trouvera les rythmes Jazz sous la forme : 

~~~mma
Cmaj7 E7@2.5 Am7 D7
~~~

On trouvera les rythmes Bossa Nova sous la forme

~~~mma
Cmaj7 G7@2.5 Fmaj7 G7@3.5
~~~
