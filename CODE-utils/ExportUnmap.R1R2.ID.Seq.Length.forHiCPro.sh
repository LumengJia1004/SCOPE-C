#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <Input> <Output>"
		    exit
fi

Input=$1
Output=$2

if [ -f ${Output} ];then
 echo "!!! Warning !!! File Exists !!! Please check whether need to eemove ${Output} \n This warning may also caused by multi inputs >> to a unique output"
fi

samtools view ${Input} | awk '{if ($3 == "*") print $0}' | awk '{print $1"\t"$10}' | awk '{print $1"\t"length($2)"\t"$2;}' >> ${Output}
