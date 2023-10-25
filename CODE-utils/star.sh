#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <In1: *R1_astq.gz> <In2: *R2_fastq.gz> <ReferenceName: mm9/hg19/...> <OutputPrefix>"
		    exit
fi

Ina=$1
Inb=$2
Reference=$3
OutPrefix=$4
####--------select genome

if [ ${Reference} = "mm9" ];then
 Gdir=/home/lch3000_pkuhpc/lustre1/liuyt/genome/Mm9_STAR_Index
 elif [ ${Reference} = "hg19" ];then
 Gdir=/home/lch3000_pkuhpc/lustre1/liuyt/genome/Hg19_STAR_Index
fi


####-------run star

STAR --genomeDir ${Gdir} \
     --runThreadN 20 --outFileNamePrefix ${OutPrefix} --readFilesIn ${Ina} ${Inb}  --readFilesCommand zcat \
     --outSAMtype BAM Unsorted

