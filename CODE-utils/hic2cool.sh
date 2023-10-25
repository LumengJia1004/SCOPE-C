#!/bin/bash

if [ $# -lt 2 ];then
	    echo "Need 2 parameters! <input : .hic files> <output: .cool files>"
		    exit
fi

In=$1 ## white space, '.,\' are not allowed 
Out=$2 

/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/bin/hic2cool convert ${In} ${Out}


