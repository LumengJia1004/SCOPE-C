#!/bin/bash

if [ $# -lt 6 ];then
	    echo "Need 6 parameters! <mm9/hg19...> <gff> <treat.bam> <input.bam> <Out> <switchSize>"
		    exit
fi
echo "full path is required"
Genome=$1 ## white space, '.,\' are not allowed
gff=$2
Tbam=$3
Bbam=$4
Out=$5
s=$6
ROSE=/lustre1/lch3000_pkuhpc/jialm/Software/rose/
cd $ROSE
/lustre1/lch3000_pkuhpc/software/anaconda2/bin/python ./ROSE_main.py -g $Genome -i $gff -r $Tbam -c $Bbam -o $Out -s $6 -t 0

