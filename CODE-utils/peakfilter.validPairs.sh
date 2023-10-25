#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <InputPairs> <peak> <Outputbedpe>"
		    exit
fi

In=$1
peak=$2
out=$3

awk '{print $2"\t"$3"\t"($3+150)"\t"$5"\t"$6"\t"($6+150)"\t"$0}' ${In} > ${In}.bedpe


bedtools pairtobed -a ${In}.bedpe -b ${peak} -type either | cut -f7-18 | uniq > ${out}


