#!bin/bash

#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/GM-other/ -name '*gz*' | grep 'R1' | grep -v 'bulk'`
#for f in `find ../rawdata/OC/human/20201231.bulk/ -name '*gz*' | grep 'R1'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110-9lane/ -name '*.gz' | grep '_1'`
for f in `find ../../Rawdata/OC/macaca/data_20220110-9lane/ -name '*.gz' | grep '_1' | grep -v 'ndete'`
do
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_/\t/g' | cut -f1 | sort | uniq`

In=../../Tmpdata/hicpro.output/macaca_${batch}/${sample}/hic_results/data/${sample}/${sample}.allValidPairs

mkdir -p ../../CleanData/allValidPairs.bed/${species}/${batch}/
Out=../../CleanData/allValidPairs.bed/${species}/${batch}/${sample}.allValidPairs.bed

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicproValid2bed.sh ${In} ${Out}"

echo $CMD
done
