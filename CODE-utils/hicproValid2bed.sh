#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <InputPairs> <Outputbed>"
		    exit
fi

In=$1
Out=$2

awk '{print $2"\t"$3"\t"($3+150)}' ${In} > ${In}.bed1 
awk '{print $5"\t"$6"\t"($6+150)}' ${In} > ${In}.bed2
cat ${In}.bed1 ${In}.bed2 | awk '{print $0"\t"NR"\t"".""\t""."}' > ${Out}
rm -rf ${In}.bed1
rm -rf ${In}.bed2 

