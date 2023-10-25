#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <InputPeak> <resfrags> <HiCPro.OutDir> <yaml.Out>"
		    exit
fi

#####------sort first

peak=$1
resf=$2
Out=$3
yaml=$4

echo "peaks:
  - \${peak}
resfrags:
  - \${resf}
hicpro_output:
  - \${Out}" > ${yaml}


"
