#!/bin/bash

if [ $# -lt 6 ];then
	    echo "Need 6 parameters! <core> <minLen> <outR1> <outR2> <inR1> <inR2>"
		    exit
fi

core=$1 ## white space, '.,\' are not allowed 
minLen=$2 
outR1=$3 
outR2=$4
inR1=$5
inR2=$6


cutadapt --pair-filter any -j ${core} -q 20,15 -m ${minLen} \
-a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A AGATCGGAAGAGCGTCGTGTAGGGAAA -o ${outR1} -p ${outR2} ${inR1} ${inR2}




