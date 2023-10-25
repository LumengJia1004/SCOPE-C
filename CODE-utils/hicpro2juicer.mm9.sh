#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <input> <output> <Species>"
		    exit
fi

In=$1 ## white space, '.,\' are not allowed 
Out=$2 
Species=$3

if [ ${Species} = "human" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
 elif [ ${Species} = "macaca" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/rheMac10.chrom.sizes
fi

mkdir tmp

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.4/bin/utils/hicpro2juicebox.sh -i ${In} -g ${Gsize} -j /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.22.01.jar -t ./tmp -o ${Out}


