#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <In:sra files> <OutDir: just path> "
		    exit
fi

In=$1 ## white space, '.,\' are not allowed 
Outdir=$2 

fastq-dump --gzip --split-3 ${In} -O ${Outdir}


