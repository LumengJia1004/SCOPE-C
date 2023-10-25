#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <bedpe> <species>"
		    exit
fi

bedpe=$1 ## white space, '.,\' are not allowed 
species=$2

if [ ${species} = "human" ];then
 bin=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomeBin/hg19.5kb.bin
 elif [ ${species} = "mouse" ];then
 bin=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomeBin/mm10.5kb.bin
 elif [ ${species} = "macaca" ];then
 bin=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomeBin/rheMac10.5kb.bin
fi


bedtools intersect -a ${bedpe} -b ${bin} -wa -wb | cut -f4- > ${bedpe}.tmp
bedtools intersect -a ${bedpe}.tmp -b ${bin} -wa -wb | cut -f8- | sort | uniq -c | awk '{if ($1 >0) print $2,$3+1,$4,$5,$6+1,$7,".",$1}' > ${bedpe}.5kb.filt.intra.loop_counts.bedpe
rm -rf ${bedpe}.tmp


