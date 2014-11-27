#!/bin/sh 

set -x

category=`echo $1 | sed 's/\.log//g'`
log=$1

 grep better $log | cut -d ' ' -f39,43,47 > better_size.tmp
 grep better $log | cut -d ' ' -f41,45,49 > better_lev.tmp
 grep better $log | cut -d ' ' -f27,31,35 > cut_size.tmp
 grep better $log | cut -d ' ' -f29,33,37 > cut_lev.tmp
 grep better $log | cut -d ' ' -f19,21,23 > cut.tmp
 grep better $log | cut -d ' ' -f13,15,17  > better.tmp
 paste better.tmp better_size.tmp better_lev.tmp  | awk '{if ($1 != 0) {print $1,$4/$1,$7/$1,$2,$5/$2,$8/$2,$3,$6/$3,$9/$3} else {print 0,0,0,$2,$5/$2,$8/$2,$3,$6/$3,$9/$3}}' > better_res.tmp
 paste cut.tmp cut_size.tmp cut_lev.tmp  | awk '{if ($1 != 0) {print $1,$4/$1,$7/$1,$2,$5/$2,$8/$2,$3,$6/$3,$9/$3} else {print 0,0,0,$2,$5/$2,$8/$2,$3,$6/$3,$9/$3}}' > cut_res.tmp 
 grep better $log | cut -d ' ' -f2 | rev | cut -d '/' -f1 |rev| sed 's/\.clq//g' > ins.tmp
paste ins.tmp better_res.tmp > "$category"_better.res
paste  ins.tmp cut_res.tmp > "$category"_cut.res
rm -fr *.tmp
