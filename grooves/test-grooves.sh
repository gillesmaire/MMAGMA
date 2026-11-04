#!/bin/sh

# Parcours des grooves MMA avec une progression d'accords.
# Debian / MMA 21.09 / FluidSynth ALSA port 128:0



REP=$(pwd)

if [ "${REP%/MMAGMA/grooves}" != "$REP" ]
then
    echo "Vous allez entendre tous les grooves et pour chacun d'eux entrer une note"
else
    echo "Erreur : ce script doit être lancé depuis MMAGMA/grooves"
    exit 1
fi

touch grooves.num  grooves.bad

trap 'rm -rf "$TMPDIR"' 0
trap 'exit 1' HUP INT TERM

ACCORDS='Gm Cm A D Gm Cm A D Gm Cm F Bb Gm Cm D Gm'

NBGROOVES=`ls /usr/share/mma/lib/* | grep -v : | grep -v ^$ | wc -l`
NB=0



command -v mma >/dev/null 2>&1 || {
    echo "Erreur : mma introuvable" >&2
    exit 1
}

command -v aplaymidi >/dev/null 2>&1 || {
    echo "Erreur : aplaymidi introuvable" >&2
    exit 1
}

grooves=`find  /usr/share/mma/lib/ -name '*.mma' | \
         sed "s;/usr/share/mma/lib/;;" | \
         cut -d. -f1 | \
         tr -s / : `

deja_teste()
{
    grep -Fxq "$1" "grooves.bad" ||  grep -Fxq "$1" "grooves.num"
}

for groove in ${grooves}
do
    NB=`expr $NB + 1`
    if deja_teste $groove ; then
     continue
    fi
    fichier="test-groove.mma"
    midi="test-groove.mid"
    printf 'Tempo 120\n' >$fichier
    printf 'Groove %s\n' "${groove}"  >> $fichier

    n=1
    for accord in $ACCORDS
        do
            echo "$n $accord" >> $fichier
            n=$((n + 1))
        done

    # Générer un MIDI dont le nom est connu.

    rm -f $midi22
    if ! mma -f "$midi" "$fichier" >/dev/null ; then
        echo "Échec de génération : $groove"
        break
    fi

    if [ ! -s "$midi" ]; then
        echo "Le fichier MIDI n'a pas été créé."
        break
    fi

    # Jouer sur le port FluidSynth relevé avec aconnect -l.

    fluidsynth -i "$midi" >/dev/null
    statut=$?

    if [ "$statut" -ne 0 ]; then
        echo "Erreur de lecture MIDI (code $statut)."
        printf 'Entrée pour continuer, q pour quitter : '
        IFS= read -r reponse
        [ "$reponse" = q ] && break
        continue
    fi

   while :
   do
   printf "[$NB/$NBGROOVES] Entrez une note de 0 à 9  pour ${groove} (r pour rejouer) : "
   read note
    case "$note" in
        [0-9]) break ;;
        [rR]) fluidsynth -i "$midi" >/dev/null ;;
        *) echo "Note incorrecte" ;;
   esac
   done
   echo "$note\t$groove" >> grooves.num
done

