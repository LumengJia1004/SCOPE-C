#!/bin/bash

if [ $# -lt 6 ];then
	    echo "Need 6 parameters! <InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir>"
		    exit
fi

DIR=$1
In=$2
Species=$3
Cleanbw=$4
Cleannp=$5
Out=$6

####--------run macs2
mkdir -p ${Out}/${In}
macs2 callpeak -t ${DIR}/${In}.bam -q 0.01 --extsize 147 --nomodel -g ${Species} -B -f BAM --verbose 0 -n ${Out}/${In}/${In}.macs2.ext147.0.01

####-------bgd2bw
sort -k1,1 -k2,2n ${Out}/${In}/${In}.macs2.ext147.0.01_treat_pileup.bdg > ${Out}/${In}/${In}.macs2.ext147.0.01_treat_pileup.bdg.sort
grep -v 'chrM' ${Out}/${In}/${In}.macs2.ext147.0.01_treat_pileup.bdg.sort |  grep -vw 'chr' > ${Out}/${In}/${In}.macs2.ext147.0.01_treat_pileup.bdg.sort.exo.chrM

if [ ${Species} = "hs" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mm" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
fi

bedGraphToBigWig ${Out}/${In}/${In}*treat_pileup.bdg.sort.exo.chrM ${Gsize} ${Cleanbw}/${In}.macs2.ext147.0.01_treat_pileup.bw

####-------clean

rm -rf ${Out}/${In}/*.bdg
mv ${Out}/${In}/*narrowPeak* ${Cleannp}/${In}.macs2.ext147.0.01.narrowPeaks

