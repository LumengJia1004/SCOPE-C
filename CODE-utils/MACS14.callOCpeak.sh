#!/bin/bash

if [ $# -lt 5 ];then
	    echo "Need 5 parameters! <InputDir> <sample> <Species> <Clean.np> <OutDir> "
		    exit
fi

DIR=$1
In=$2
Species=$3
Cleannp=$4
Out=$5

####--------run macs2
mkdir ${Out}/${In}

/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/macs14 callpeak -t ${DIR}/${In}.RMD.DEPairs.bed --keep-dup all --nomodel -g ${Species} -f BED -n ${Out}/${In}/${In}.rmdDE.macs14.nomodel 


mv ${Out}/${In}/*peaks.bed ${Cleannp}/${In}.rmdDE.macs14.nomodel.peaks.bed
