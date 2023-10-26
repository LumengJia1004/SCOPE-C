#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <index> <R1> <R2> <output>"
		    exit
fi

index=$1 
R1=$2 
R2=$3
output=$4 


bowtie2 -p 20 --sensitive -x ${index} -1 ${R1} -2 ${R2} -S ${output} -X 2000



