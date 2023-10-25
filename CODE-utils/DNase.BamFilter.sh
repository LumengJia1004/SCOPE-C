#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <input> <output>"
		    exit
fi

input=$1 
output=$2 

####-----------unique.map
samtools view -@ 20 -bS -q 10 $input | samtools sort > $input.q10.bam

####-----------rmd dup
java -jar /home/lch3000_pkuhpc/lustre1/liuyt/software/picard-tools-1.118/MarkDuplicates.jar INPUT=$input.q10.bam OUTPUT=${output} VALIDATION_STRINGENCY=SILENT  REMOVE_DUPLICATES=true METRICS_FILE=${input}.tmp







