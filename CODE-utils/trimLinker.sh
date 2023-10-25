#!/bin/bash

if [ $# -lt 5 ];then
	    echo "Need 5 parameters! <core> <out> <name> <inR1> <inR2>"
		    exit
fi

core=$1 ## white space, '.,\' are not allowed 
out=$2
name=$3
inR1=$4
inR2=$5

/lustre1/lch3000_pkuhpc/jialm/Software/bin/ChIA-PET2_0.9.3/bin/trimLinker -t 12 -m 1 -k 1 -l 16 -o $out -n $name -A ACGCGATATCTTATC -B AGTCAGATAAGATAT $inR1 $inR2 





