#!/bin/bash

if [ $# -lt 5 ];then
	    echo "Need 5 parameters! <norm: KR/VC/...> <input: .hic files> <chr: 1,2,3...X,Y> <RESolution: 100000/200000/500000> <output>"
		    exit
fi

Norm=$1 ## white space, '.,\' are not allowed
input=$2
chr=$3
RES=$4
output=$5

java -Xmx8g -jar /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.19.02.jar eigenvector ${Norm} ${input} ${chr} BP ${RES} -p ${output}
