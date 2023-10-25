#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <config> <input> <output>"
		    exit
fi

config=$1 ## white space, '.,\' are not allowed 
input=$2 
output=$3 

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.4/bin/HiC-Pro -c ${config} -i ${input} -o ${output}



