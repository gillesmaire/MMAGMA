# Récupérer les sources

## Sans pouvoir communiquer vos modifications

git clone https://github.com/gillesmaire/MMAGMA.git

## En pouvant modifier les sources et participer au projet

- S'inscrire sur github
- Contacter gilles dans le forum du site  https://linuxmao.org/forumthread120185-Documentation-MMA?topics_offset=1

# Installer les dépendances nécessaires à la compilation 


Sous Linux Debian et dérivés 

~~~bah
sudo apt install texlive-latex-base texlive-latex-recommended texlive-lang-french CMake fluidsynth
~~~


# Lancer la compilation 

Se fait par la commande compile à la racine 

~~~bash
 ./compile 
-- The C compiler identification is GNU 14.2.0
-- The CXX compiler identification is GNU 14.2.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done (0.2s)
-- Generating done (0.0s)
-- Build files have been written to: /home/gilles/Developpements/MMAGMA/build
[  5%] Generating /home/gilles/Developpements/MMAGMA/fr/html/introduction.html
[ 11%] Generating /home/gilles/Developpements/MMAGMA/fr/html/installation.html
[ 17%] Generating /home/gilles/Developpements/MMAGMA/fr/html/vocabulaire.html
[ 23%] Generating /home/gilles/Developpements/MMAGMA/fr/html/premier-fichier-mma.html
[ 29%] Generating /home/gilles/Developpements/MMAGMA/fr/html/utilisation-des-grooves.html
[ 35%] Generating /home/gilles/Developpements/MMAGMA/fr/html/format-MMA.html
[ 41%] Generating /home/gilles/Developpements/MMAGMA/fr/html/les-sequences.html
[ 47%] Generating /home/gilles/Developpements/MMAGMA/fr/html/les-riffs.html
[ 52%] Generating /home/gilles/Developpements/MMAGMA/fr/html/les-boucles.html
[ 58%] Generating /home/gilles/Developpements/MMAGMA/fr/html/les-pistes.html
[ 64%] Generating /home/gilles/Developpements/MMAGMA/fr/html/les-accords.html
[ 70%] Generating /home/gilles/Developpements/MMAGMA/fr/html/le-rythme.html
[ 76%] Generating /home/gilles/Developpements/MMAGMA/fr/html/les-options-de-mma.html
[ 82%] Generating mmagma_index.md
[ 88%] Generating /home/gilles/Developpements/MMAGMA/fr/html/index.html
[ 88%] Built target html
[ 94%] Generating /home/gilles/Developpements/MMAGMA/fr/pdf/MMAGMA-fr.pdf
[ 94%] Built target pdf
[100%] Generating /home/gilles/Developpements/MMAGMA/fr/epub/MMAGMA-fr.epub
[100%] Built target epub
[100%] Built target makedoc
~~~


# Récupérer juse le fichier PDF de la dernière version de la documentation 

https://github.com/gillesmaire/MMAGMA/tree/main/fr/pdf/MMAGMA-fr.pdf

