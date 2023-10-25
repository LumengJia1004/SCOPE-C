#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <Input> <Output>"
		    exit
fi

#####------sort first

In=$1
Out=$2
mkdir TEMP

TMP_DIR=TEMP

LANG=en; sort -T ${TMP_DIR} -S 50% -k2,2V -k3,3n -k5,5V -k6,6n -m ${In} | \
awk -F"\t" 'BEGIN{c1=0;c2=0;s1=0;s2=0}(c1!=$2 || c2!=$5 || s1!=$3 || s2!=$6){print;c1=$2;c2=$5;s1=$3;s2=$6}' > ${Out}

