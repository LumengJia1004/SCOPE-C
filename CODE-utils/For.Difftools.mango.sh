#!/bin/bash

if [ $# -lt 5 ];then
	    echo "Need 5 parameters! <rmdBedpe> <intra> <xgi> <output> <resolution>"
		    exit
fi

rmdBedpe=$1 ## white space, '.,\' are not allowed 
intra=$2 
xgi=$3
output=$4 
resolution=$5

#########----make bedpe6

cut -f1-6 ${rmdBedpe} | grep -v '*' | awk '{if ($1 == $4) print $0}' > ${rmdBedpe}.bedpe6

cut -f1-6 ${intra} > ${intra}.bedpe6

cut -f1-3 ${intra}.bedpe6 > ${intra}.bed3.1
cut -f4-6 ${intra}.bedpe6 > ${intra}.bed3.2
cat ${intra}.bed3.1 ${intra}.bed3.2 | bedtools sort | uniq > ${intra}.bed3

rm -rf ${intra}.bed3.1
rm -rf ${intra}.bed3.2

bedtools pairtopair -a ${rmdBedpe}.bedpe6 -b ${intra}.bedpe6 -type both | cut -f1-6 | sort | uniq > ${rmdBedpe}.intractions.inter
bedtools intersect -a ${rmdBedpe}.bedpe6 -b ${intra}.bed3 -wa -wb | awk '{print $4"\t"$5"\t"$6"\t"$0}' > ${rmdBedpe}.self.tmp
bedtools intersect -a ${rmdBedpe}.self.tmp -b ${intra}.bed3 -wa -wb | cut -f4- | awk '{if (($1 == $4)&&($8 == $11)) print $0}' | cut -f1-6 | sort | uniq > ${rmdBedpe}.intractions.self

cat ${rmdBedpe}.intractions.inter ${rmdBedpe}.intractions.self > ${rmdBedpe}.intractions

rm -rf ${rmdBedpe}.intractions.inter
rm -rf ${rmdBedpe}.intractions.self
rm -rf ${intra}.bed3
rm -rf ${rmdBedpe}.*.tmp
rm -rf ${intra}.*.tmp
bedtools intersect -a ${rmdBedpe}.intractions -b ${xgi} -wa -wb | cut -f4- > ${rmdBedpe}.intractions.${resolution}.tmp

bedtools intersect -a ${rmdBedpe}.intractions.${resolution}.tmp -b  ${xgi} -wa -wb | cut -f4- | sort | uniq -c |awk '{print $2,$3,$4,$6,$7,$8,".",$1}' > ${output}

rm -rf ${rmdBedpe}.intractions
rm -rf ${rmdBedpe}.*.bedpe6



