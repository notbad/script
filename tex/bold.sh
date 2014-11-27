#!/bin/sh

#set -x 
file=$1
n=$2
m=$3

while read line
do
    if [ "`echo $line | grep hline`" != "" ]
    then
        echo "\\"$line
        continue
    fi
    mmin="100000000"
    for v in `echo $line | sed 's/&//g' | sed 's/\([ ]\+\)/ /g' | cut -d ' ' -f$n-$m`
    do
        if [ "$v" != "-" ] && [ `echo "$mmin>$v" | bc` = "1" ]
        then
            mmin=$v
        fi
    done
#    echo $mmin
    echo $line"\\\\" | sed "s/$mmin/\\\\bf$mmin/g"
done<$file
