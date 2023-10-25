#!/bin/bash

if [ $# -lt 5 ];then
	    echo "Need 5 parameters! <R1> <R2> <Output: folder name> <Prefix of files> <Species>"
		    exit
fi

R1=$1 ## white space, '.,\' are not allowed 
R2=$2 
Output=$3 
Prefix=$4
Species=$5

if [ ${Species} = "human" ];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Reference/hg19/Sequence/BWAIndex/genome.fa
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size 
 elif [ ${Species} = "mouse" ];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Reference/mm9/Mus_musculus/UCSC/mm9/Sequence/BWAIndex/genome.fa
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
fi

/lustre1/lch3000_pkuhpc/jialm/Software/bin/ChIA-PET2_0.9.3/bin/ChIA-PET2 -g ${Genome} -b ${Gsize} -f ${R1} -r ${R2} -A ACGCGATATCTTATC -B AGTCAGATAAGATAT -o ${Output} -n ${Prefix} -t 20 -k 1 -C 1 -m 1

