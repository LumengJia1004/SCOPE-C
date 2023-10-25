#!bin/bash

for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
do
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1 | sort | uniq`

In=../cleandata/ValidPairs.bedpe/${species}/${batch}/${sample}.allValidPairs.bedpe
Peak=../tmpdata/preMICC-Input/${species}/${batch}/${sample}.narrowPeak.slop3000
Interactions=../cleandata/Interactions/${species}/${batch}/

mkdir -p ../tmpdata/MICC.out/${species}/${batch}/

Out=../tmpdata/MICC.out/${species}/${batch}/${sample}.MICC.out
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MICC.sh ${In} ${Peak} ${Interactions} ${Out}"

echo $CMD
done
