# Installation de MMA


# Installation depuis les dépots

Sur Debian ou Ubuntu, MMA peut souvent être installé directement depuis les dépôts officiels :

~~~bash
sudo apt install mma
~~~


## Vérification de l'installation

Pour vérifier que MMA est correctement installé, ouvrez un terminal ou une invite de commandes et tapez :

~~~bash
mma -v
~~~

Vous devriez voir la version installée, par exemple 21.09.

## Dépannage

- Le message suivant est généralement sans conséquence. Il signifie simplement que le répertoire des plugins n'existe pas encore. MMA fonctionne malgré cet avertissement.

~~~
    Warning: PLUGIN '/usr/share/mma/plugins' does not exist.
~~~
- Si MMA ne se lance pas, vérifiez que le chemin est correctement configuré et que la version correspond à votre système d'exploitation.


