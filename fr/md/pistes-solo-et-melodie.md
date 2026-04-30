# Les pistes solo et mélodie


## Présentation 


Ce chapitre explique comment glisser des solos ou des mélodies dans les musiques générées par MMA.

Il est bien sûr possible d'ajouter des mélodies et des harmonies via des instruments MIDI, mais on 
dispose également de pistes réservées aux mélodies : 

   - les pistes mélodie reprenant l'air du morceau
   - des commandes solo qui permettent improvisations, contrechants, riffs ou interventions ponctuelles d’un instrument.
   
On déclare ces pistes de la façon suivante : 

~~~mma
Begin Melody
   Voice Flute
   Octave 5
   Melody  c d e f g
   Volume 90
End

Begin Solo
   Voice DistortionGuitar
   Octave 4
End
~~~

Une flûte jouera sur le 5 ème octave alors qu'une guitare saturée jouera sur l'octave 4.

- Les notes sont notées de A (La) à G (Sol) le silence est noté R

- Les dièses sont notés # et les bémols b
- Une fois l'octave choisi, on peut passer à une note de l'octave supérieur par a+ et a- pour l'octave inférieur
sachant que l'octave de base est définit par octave suivi d'un numéro
- La vélocité,c'est à dire le volume de base est donné par Volume
- Le Symbole ~ reforce  la tenue de la note par exemple C~ 
- Il est également possible d'imporer les notes d'un fichier MIDI par 
~~~mma
MidiFile solo.mid
~~~


## Réglages plus fins



Pour éviter un rendu trop mécanique : 

~~~mma
Melody RTime -10,10 
Melody RVolume -5,5
~~~

## Exemples : 


~~~mma
Tempo 120
Groove Swing

C Am F G

Begin Melody
   Voice AltoSax
   Octave 5
End

Melody c d e g r g e d

~~~
