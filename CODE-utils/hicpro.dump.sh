#!/bin/bash

if [ $# -lt 6 ];then
	    echo "Need 6 parameters! <method: observed/oe/ norm/expected> <norm: KR/VC/...> <input: .hic files> <chr: 1,2,3...X,Y> <RESolution: 100000/200000/500000> <output>"
		    exit
fi

method=$1
Norm=$2 ## white space, '.,\' are not allowed
input=$3
chr=$4
RES=$5
output=$6

if [[ ${method} = "observed" ]] || [[ ${method} = "oe" ]];then
 java -Xmx8g -jar /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.19.02.jar dump ${method} ${Norm} ${input} ${chr} ${chr} BP ${RES} ${output}
 elif [[ ${method} = "norm" ]] || [[ ${method} = "expected" ]];then
 java -Xmx8g -jar /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.19.02.jar dump ${method} ${Norm} ${input} ${chr} BP ${RES} ${output}
fi



