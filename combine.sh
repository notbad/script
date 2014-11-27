#!/bin/bash

<<<<<<< HEAD

=======
>>>>>>> cfd647b7419d2a7d30eb784889814859077fb388
while read ins
do
  echo -n `echo $ins | awk -F '_' '{print $2" "$3" "}'`
  while read file
  do
    res=`grep $ins $file`
    if [ "$res" != "" ]
    then
      echo -n ' '`echo $res | awk '{print $2" "$3}'`
    else
      echo -n " - -"
    fi
  done <$2
  echo
done <$1
