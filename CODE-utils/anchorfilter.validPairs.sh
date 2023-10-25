#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <InputPairs> <mango> <Outputbedpe>"
		    exit
fi

In=$1
mango=$2
out=$3

awk '{print $2"\t"$3"\t"($3+150)"\t"$5"\t"$6"\t"($6+150)"\t"$0}' ${In} > ${In}.bedpe
cut -f1-3 ${mango} > ${mango}.bed1
cut -f4-6 ${mango} > ${mango}.bed2
cat ${mango}.bed1 ${mango}.bed2 | bedtools sort | uniq > ${mango}.bed3

rm -rf ${mango}.bed1
rm -f ${mango}.bed2


bedtools pairtobed -a ${In}.bedpe -b ${mango}.bed3 -type both | cut -f7-18 | sort | uniq > ${out}
rm -rf ${In}.bedpe
rm -rf ${mango}.bed3


