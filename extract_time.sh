#!/bin/sh 

set -x

category=`echo $1 | sed 's/\.log//g'`
log=$1

grep better $log | cut -d ' ' -f7,8 > time.tmp
grep better $log | cut -d ' ' -f2 | rev | cut -d '/' -f1 |rev| sed 's/\.clq//g' > ins.tmp
paste  ins.tmp time.tmp > "$category"_time.res
rm -fr *.tmp
