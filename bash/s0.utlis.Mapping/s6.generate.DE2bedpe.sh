#!bin/bash

#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1'`
for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
do
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1 | sort | uniq`

In=../cleandata/RMD.DE/${species}/${batch}/${sample}.RMD.DEPairs

mkdir -p ../cleandata/RMD.DE.bedpe/${species}/${batch}/

Out=../cleandata/RMD.DE.bedpe/${species}/${batch}/${sample}.RMD.DEPairs.bedpe

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro2bedpe.sh ${In} ${Out}"

echo $CMD
done
