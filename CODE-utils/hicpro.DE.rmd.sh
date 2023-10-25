#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <InputDir> <sample> <Group> <Clean>"
		    exit
fi

#####------sort first

DIR=$1
In=$2
Group=$3
Clean=$4


LANG=en; sort -T ${DIR}/${In}/tmp -k2,2V -k3,3n -k5,5V -k6,6n -o ${DIR}/${In}/hic_results/data/${In}/${In}_${Group}.cutadapt_genome.bwt2pairs.DEPairs \
${DIR}/${In}/hic_results/data/${In}/${In}_${Group}.cutadapt_genome.bwt2pairs.DEPairs

###------next, rmdup

LANG=en; sort -T ${DIR}/${In}/tmp -S 50% -k2,2V -k3,3n -k5,5V -k6,6n -m \
${DIR}/${In}/hic_results/data/${In}/${In}*.cutadapt_genome.bwt2pairs.DEPairs \
| awk -F"\t" 'BEGIN{c1=0;c2=0;s1=0;s2=0}(c1!=$2 || c2!=$5 || s1!=$3 || s2!=$6){print;c1=$2;c2=$5;s1=$3;s2=$6}' \
> ${Clean}/${In}.RMD.DEPairs


