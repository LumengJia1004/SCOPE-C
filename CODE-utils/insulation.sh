#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <mat> <is> <ids>"
		    exit
fi

mat=$1 ## white space, '.,\' are not allowed 
is=$2 
ids=$3

perl /lustre1/lch3000_pkuhpc/jialm/Software/bin/matrix2insulation.pl -i $mat -is ${is} -ids ${ids} -im mean  -nt 0.25 -v




