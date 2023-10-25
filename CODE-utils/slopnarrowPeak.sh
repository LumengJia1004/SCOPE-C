#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <InputPeak> <Species hs/mm...> <Extend length> <OutputPeak>"
		    exit
fi

In=$1
Species=$2
Extlength=$3
Out=$4

####--------slop and merge

if [ ${Species} = "human" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
 elif [ ${Species} = "macaca" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/rheMac8.brief.chrom.sizes
fi

bedtools slop -i $In -g $Gsize -b $Extlength | bedtools merge -d 256 > ${Out}.tmp


####-------add name 

awk 'BEGIN{OFS="\t";i=1}{print $1,$2,$3,"peak_"i;i=i+1}' ${Out}.tmp > $Out
rm -rf ${Out}.tmp


