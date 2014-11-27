#/bin/sh

#set -x

grep better $1 | awk '{print $2}' | rev | cut -d '/' -f1 | rev | awk -F'_' '{print $1"_"$2"_"$3}' | sort | uniq > category.tmp

while read line
do
  cnt=`grep "$line""_" $1 | wc -l | tr -d ' '`;
  if [ "$cnt" -gt 25 ]
  then
    grep "$line""_" $1 | cut -d ' ' -f2,7,8 | sort -n -k3 | head -26 | tail -1 
  fi
done <category.tmp
