#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <BAM> <Species> <Out>"
		    exit
fi

BAM=$1
Species=$2
Out=$3

####--------run bed2bam

if [ ${Species} = "human" ];then
 Gsize=2864785220
 elif [ ${Species} = "mouse" ];then
 Gsize=2652783500
 elif [ ${Species} = "macaca" ];then
 Gsize=2864785220
fi

samtools index ${BAM}
bamCoverage --bam ${BAM} -o ${Out} \
    --binSize 1 \
    --normalizeUsing CPM \
    --effectiveGenomeSize ${Gsize} \
    --ignoreForNormalization chrX chrY chrM -e 0

