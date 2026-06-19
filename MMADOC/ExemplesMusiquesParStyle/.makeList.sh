#! /bin/sh

ListExemplesMMA="../Examples-mma-songs-25.05.0"

echo " Cette commande  balaye l'ensemble des exemples présents dans le répertoire ../Examples-mma-songs-..\n" "et contruit pour chacun des morceaux  mots clés décrivant le style.\n" "Le processus est assez long mais vous pourrez arrêter ce script (^C) et le continuer plus tard !\n"
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



