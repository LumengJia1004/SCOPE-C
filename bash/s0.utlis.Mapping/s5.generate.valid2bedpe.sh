#!bin/bash

#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/GM-other/ -name '*gz*' | grep 'R1' | grep -v 'bulk'`
#for f in `find ../rawdata/OC/human/20201231.bulk/ -name '*gz*' | grep 'R1'`
#for f in `find ../../CleanData/allValidPairs/mouse/mouse_data_20220125sent-append/merged/ -name '*allValidPairs'`
#for f in `find ../../CleanData/allValidPairs/mouse/Dinglab-mESC.1k/ -name '*Ding*'`
#for f in `find ../../CleanData/allValidPairs/mouse/Dinglab-mNSC.1k/ -name '*merge*'`
for f in `find ../../CleanData/allValidPairs/mouse/Dinglab*append/ -name '*all*'`
do
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/\.allValidPairs/\t/g' | cut -f1 | sort | uniq`

In=../../CleanData/allValidPairs/${species}/${batch}/${sample}.allValidPairs*

mkdir -p ../../CleanData/allValidPairs.bedpe/${species}/${batch}/
Out=../../CleanData/allValidPairs.bedpe/${species}/${batch}/${sample}.allValidPairs.bedpe

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro2bedpe.sh ${In} ${Out}"

echo $CMD
done
