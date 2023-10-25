#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <InputPairs> <Outputbedpe>"
		    exit
fi

In=$1
Out=$2

awk '{print $2"\t"$3"\t"($3+150)"\t"$5"\t"$6"\t"($6+150)"\t"$1"\t"".""\t"$4"\t"$7}' ${In} > ${Out}


