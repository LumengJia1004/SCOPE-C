#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <bdg> <Species> <Out>"
		    exit
fi

bdg=$1
Species=$2
Out=$3

if [ ${Species} = "human" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
 elif [ ${Species} = "macaca" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/rheMac8.brief.chrom.sizes
fi

bedtools slop -i ${bdg} -g ${Gsize} -b 0 | bedClip stdin ${Gsize} ${bdg}.clip

LC_COLLATE=C sort -k1,1 -k2,2n ${bdg}.clip > ${bdg}.sort.clip

bedGraphToBigWig ${bdg}.sort.clip ${Gsize} ${Out}

rm -f ${bdg}.clip ${bdg}.sort.clip


