#! /bin/sh

ListExemplesMMA="../Examples-mma-songs-25.05.0"

echo " Cette commande va balayer l'ensemble des exemples présent dans ../Examples-mma-songs-..\n" "et vous devrez pour chacun des morceaux donner des mots clés décrivant le style.\n" "Le processus est assez long mais vous pourrez arrêter ce script (^C) et le recommencer plus tard !\n"
echo "Voulez-vous continuer ? [O/N]"
read rep
case "$rep" in
    [yYoO])
        printf '\033[A\r\033[KOui\n'
        ;;
    *)
        printf  '\033[A\r\033[KNon\n'
        exit 1
        ;;
esac

List=`ls ${ListExemplesMMA}/*.mma`
cat 0 > .lastMusic
for song in ${List}
do
PID=`cat .lastMusic`
if [ $PID -ne 0 ]  ; then
kill -9 $PID
fi
MMAFile=`echo  ${song} | sed s/\.mma$//`
../../play ${MMAFile} &
read Keys
done



