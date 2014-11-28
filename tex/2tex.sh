#!/bin/bash

digit2() {
	str=`echo $1 | egrep '^[0-9]+\.[0-9]+$'`
	if [ "$str" = "$1" ]
	then
		if [ `echo $1 | cut -d '.' -f1` -gt 1000 ]; then
			str=`echo "scale=0; $1/1.0" | bc`
		elif [ `echo $1 | cut -d '.' -f1` -gt 100 ]; then
			str=`echo "scale=1; $1/1.0" | bc`
		else
			str=`echo "scale=2; $1/1.0" | bc`
		fi
	else
		str="$1"
	fi

	if [ "`echo $str | egrep '^\.[0-9]+$'`" != "" ]
	then
		echo "0$str"
	else
		echo "$str"
	fi
}

while read line
do
	out=""
	for item in `echo $line`
	do
		if [ "$out" != "" ]
		then
			out=`echo $out | sed 's/\_/\\\_/g'`
			echo -e -n "`digit2 $out` & "
		fi
		out=$item
	done
	echo "`digit2 $out` \\\\"
done <$1
