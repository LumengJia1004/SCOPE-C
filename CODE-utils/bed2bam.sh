#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <BED> <Species> <tmp> <Out>"
		    exit
fi

BED=$1
Species=$2
tmp=$3
Out=$4

####--------run bed2bam

if [ ${Species} = "human" ];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
 elif [ ${Species} = "macaca" ];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/rheMac10.chrom.sizes
fi
grep -v 'Un' ${BED} | grep -v 'random' > ${BED}.auto
bedtools bedtobam -i ${BED}.auto -g ${Genome} > ${tmp}

####--------run bamSort

samtools sort -@ 1 -T ${tmp}.sortTmp -O bam -o ${Out} ${tmp}

###---------clean 

#rm ${tmp}
#rm ${tmp}.sortTmp 


