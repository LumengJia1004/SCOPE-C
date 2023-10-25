#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <mango> <commonComp> <protein> <Out>"
		    exit
fi

mango=$1 ## white space, '.,\' are not allowed
commonComp=$2
protein=$3
Out=$4

bedtools intersect -a ${mango} -b ${commonComp} -wa -wb | cut -f4- > ${commonComp}.tmp
bedtools intersect -a ${commonComp}.tmp -b ${commonComp} -wa -wb | cut -f9- | sort | uniq > ${Out}

rm -rf ${commonComp}.tmp
