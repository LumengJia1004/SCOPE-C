#!/bin/bash

##--------Need 3 parameters! <input> <output> <Species>
#for f in `find ../../CleanData/allValidPairs/macaca/ -name '*.allValidPairs' | grep 'erge'`
#for f in `find ../../CleanData/allValidPairs/human/human_humanBrain20220321-append/ -name 'all.*allValidPairs' | grep 'iN'`
for f in `find ../../CleanData/peakRel.allValidPairs/mouse/ -name '*allValidPairs'`
#for f in `find ../../CleanData/allValidPairs/mouse/*1M*-append/ -name '*allValidPairs' | grep 'allmerge'`
do
dir=${f}
Group=`echo "${dir}" | sed 's/\//\t/g' | cut -f6`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/\./\t/g' |cut -f1`

input=`echo "${dir}"`
mkdir -p ../../CleanData/all.juicer/${Group}.peakFiltered/
output=../../CleanData/all.juicer/${Group}.peakFiltered/
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro2juicer.sh ${input} ${output} ${species}"
echo $CMD
done 




