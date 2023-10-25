#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 4 parameters! <BEDPE> <SlopPeak> <Tmp> <Out>"
		    exit
fi

BEDPE=$1
SlopPeak=$2
Tmp=$3
Out=$4

####-------bulidtagAlign

/lustre1/lch3000_pkuhpc/jialm/Software/ChIA-PET2-master/bin/buildTagAlign ${BEDPE} ${BEDPE}.rmdup.bedpe.tag

####-------detect interactions
#sort -k1,1V -k2,2n ${BEDPE}.rmdup.bedpe.tag >  ${BEDPE}.rmdup.bedpe.tag.sort
bedtools sort -i ${BEDPE}.rmdup.bedpe.tag > ${BEDPE}.rmdup.bedpe.tag.sort
bedtools coverage -sorted -b ${BEDPE}.rmdup.bedpe.tag.sort -a ${SlopPeak} -counts > ${BEDPE}.rmdup.bedpe.slopPeak.depth
pairToBed -a ${BEDPE} -b ${BEDPE}.rmdup.bedpe.slopPeak.depth -type both > ${BEDPE}.interSlopPeak
/lustre1/lch3000_pkuhpc/jialm/Software/ChIA-PET2-master/bin/bedpe2Interaction ${BEDPE}.interSlopPeak ${BEDPE}.interSlopPeak.interactions ${BEDPE}.interSlopPeak.stat

####-------runMICC
Rscript /lustre1/lch3000_pkuhpc/jialm/Software/ChIA-PET2-master/bin/MICC2.R ${BEDPE}.interSlopPeak.interactions.intra.bedpe ${BEDPE}.interSlopPeak.interactions.inter.bedpe ${Out} 

#rm -rf ${BEDPE}.interSlopPeak
#rm -rf ${BEDPE}.rmdup.bedpe.slopPeak.depth 
#rm -rf ${BEDPE}.rmdup.bedpe.tag
#rm -rf ${BEDPE}.rmdup.bedpe.tag.sort
mv ${BEDPE}.interSlopPeak.interactions* ./${Tmp}/

mkdir -p ./${Tmp}/intra-inter-sta/
mv ${BEDPE}.interSlopPeak.stat ./${Tmp}/intra-inter-sta/



