#!/bin/bash
if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <Input path and prefix> <Out path and prefix> <Genome:mm9/hg19> <extend length to the right of reads>"
		    exit
fi

In=$1
Out=$2
G=$3
E=$4

if [ ${G} = "hg19" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${G} = "mm9" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
fi

cat ${In}* | awk '{print $2"\t"$3"\t"($3+1)"\t"$5"\t"$6"\t"($6+1)"\t"$1"\t"".""\t"$4"\t"$7}' | bedtools slop -l 0 -r ${E} -g ${Gsize} | awk '{print $4"\t"$5"\t"$6"\t"$1"\t"$2"\t"$3"\t"$7"\t"$8"\t"$9"\t"$10}' | bedtools slop -l 0 -r ${E} -g ${Gsize} | awk '{print $4"\t"$5"\t"$6"\t"$1"\t"$2"\t"$3"\t"$7"\t"$8"\t"$9"\t"$10}' > ${Out}.allvalid.ext${E}.bedpe

 






