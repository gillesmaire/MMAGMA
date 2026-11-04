#!/bin/sh

if [ $# -eq 0 ] ; then
 echo "Syntax is $0 groovename"
 exit 0
fi

echo $1 >> grooves.bad
./test-grooves.sh

