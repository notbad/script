#!/bin/bash

#set -x

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
