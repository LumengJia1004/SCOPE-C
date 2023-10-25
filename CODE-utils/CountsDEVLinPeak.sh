#！/bin/bash

if [ $# -lt 7 ];then
	    echo "Need 7 parameters! <Species> <OutDir> <VaildIn:dir+sample> <VaildOut:only sample name> <DEIn:dir+sample name> <DEOut:only sample name> <Peaks>"
		    exit
fi

Species=$1
OutDir=$2
VaildIn=$3
VaildOut=$4
DEIn=$5
DEOut=$6
PEAK=$7

if [ ${Species} = "human" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/chrom_mm10.sizes
 elif [ ${Species} = "macaca" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Reference/rheMac10/rheMac10.chrom.sizes
fi

###Valid2bedpe
/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro2bedpe.sh ${VaildIn} ${OutDir}/${VaildOut}

###DistanceFilterBEDPE
awk '{if ($1==$4) print $0}' ${OutDir}/${VaildOut} > ${OutDir}/${VaildOut}.cis
rm -rf ${OutDir}/${VaildOut}

###PeakFilterForValidPairs
bedtools pairtobed -a ${OutDir}/${VaildOut}.cis -b ${PEAK} -type either | cut -f1-10 | sort | uniq > ${OutDir}/${VaildOut}.cis.PeakFiltered
rm -rf ${OutDir}/${VaildOut}.cis

###PeakFilterForValidPairs2bed
cut -f1-3 ${OutDir}/${VaildOut}.cis.PeakFiltered > ${OutDir}/${VaildOut}.cis.PeakFiltered.bed1
cut -f4-6 ${OutDir}/${VaildOut}.cis.PeakFiltered > ${OutDir}/${VaildOut}.cis.PeakFiltered.bed2
cat ${OutDir}/${VaildOut}.cis.PeakFiltered.bed1 ${OutDir}/${VaildOut}.cis.PeakFiltered.bed2 > ${OutDir}/${VaildOut}.cis.PeakFiltered.bed
bedtools intersect -a ${PEAK} -b ${OutDir}/${VaildOut}.cis.PeakFiltered.bed -wa -c > ${OutDir}/${VaildOut}.cis.PeakFilteredCounts.sta
rm -rf ${OutDir}/${VaildOut}.cis.PeakFiltered.bed1
rm -rf ${OutDir}/${VaildOut}.cis.PeakFiltered.bed2
rm -rf ${OutDir}/${VaildOut}.cis.PeakFiltered.bed

#PeakFilterForDE
bedtools intersect -a ${PEAK} -b ${DEIn} -wa -c > ${OutDir}/${DEOut}.DEinPeakCounts.sta



