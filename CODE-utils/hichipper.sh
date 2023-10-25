#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <OutDir> <yaml>"
		    exit
fi

#####------sort first
Out=$1
yaml=$2

#hichipper -o ${Out} -z -k -l 150 -mi 1000 -ma 2000000 --macs2-genome hs -mu -mw --basic-qc --r-path /lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/bin/R ${yaml}
hichipper -o ${Out} -l 150 -mi 1000 -ma 200000000 --macs2-genome hs --r-path /lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/bin/R ${yaml}
