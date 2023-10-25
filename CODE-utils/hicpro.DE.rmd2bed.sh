#!/bin/bash

if [ $# -lt 4 ];then
	    echo "Need 5 parameters! <InputDir> <sample> <Clean> <OutDir>"
		    exit
fi

#####------sort first

DIR=$1
In=$2
Clean=$3
Out=$4



LANG=en; sort -T ${DIR}/${In}/tmp -k2,2V -k3,3n -k5,5V -k6,6n -o ${DIR}/${In}/hic_results/data/${In}/${In}_*.cutadapt*.bwt2pairs.DEPairs.sort \
${DIR}/${In}/hic_results/data/${In}/*cutadapt*.bwt2pairs.DEPairs

###------next, rmdup

LANG=en; sort -T ${DIR}/${In}/tmp -S 50% -k2,2V -k3,3n -k5,5V -k6,6n -m \
${DIR}/${In}/hic_results/data/${In}/${In}_*.cutadapt*.bwt2pairs.DEPairs.sort \
| awk -F"\t" 'BEGIN{c1=0;c2=0;s1=0;s2=0}(c1!=$2 || c2!=$5 || s1!=$3 || s2!=$6){print;c1=$2;c2=$5;s1=$3;s2=$6}' \
> ${Clean}/${In}.RMD.DEPairs

###------finally, transfer hicpro2bed formate

awk '{if ($8 <=100) print $0}' ${Clean}/${In}.RMD.DEPairs | awk '{print $2"\t"($3-1)"\t"($3+$8-1)"\t"$1"\t"$11"\t"$4}' > ${Out}/${In}.RMD.DEPairs.bed1
awk '{if ($8 <=100) print $0}' ${Clean}/${In}.RMD.DEPairs | awk '{print $5"\t"($6-$8-1)"\t"($6-1)"\t"$1"\t"$12"\t"$7}' > ${Out}/${In}.RMD.DEPairs.bed2

mkdir -p ${Out}/tmp

awk '{if ($8 >100) print $0}' ${Clean}/${In}.RMD.DEPairs | awk '{print $2"\t"($3-1)"\t"($3+149)"\t"$1"\t"$11"\t"$4}' > ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed1
awk '{if ($8 >100) print $0}' ${Clean}/${In}.RMD.DEPairs | awk '{print $5"\t"($6-149)"\t"($6-1)"\t"$1"\t"$12"\t"$7}' > ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed2

#awk '{if ($8 <50) print $0}' ${Clean}/${In}.RMD.DEPairs | awk '{print $2"\t"($3-1)"\t"($3+$8-1)"\t"$1"\t"$11"\t"$4}' > ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed1
#awk '{if ($8 <50) print $0}' ${Clean}/${In}.RMD.DEPairs | awk '{print $5"\t"($6-$8-1)"\t"($6-1)"\t"$1"\t"$12"\t"$7}' > ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed2

#awk '{print $2"\t"$3"\t"($3+1)"\t"$1"\t"".""\t"$4}' ${Clean}/${In}.RMD.DEPairs > ${Out}/${In}.RMD.DEPairs.bed1
#awk '{print $5"\t"$6"\t"($6+1)"\t"$1"\t"".""\t"$7}' ${Clean}/${In}.RMD.DEPairs > ${Out}/${In}.RMD.DEPairs.bed2

cat ${Out}/${In}.RMD.DEPairs.bed1  ${Out}/${In}.RMD.DEPairs.bed2 >  ${Out}/${In}.RMD.DEPairs.bed

cat  ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed1 ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed2 > ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed
#cat ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed1 ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed2 > ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed

rm -rf ${Out}/${In}.RMD.DEPairs.bed1
rm -rf ${Out}/${In}.RMD.DEPairs.bed2
rm -rf ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed1
rm -rf ${Out}/tmp/${In}.larger100.RMD.DEPairs.bed2
#rm -rf ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed1
#rm -rf ${Out}/tmp/${In}.smaller50.RMD.DEPairs.bed2

