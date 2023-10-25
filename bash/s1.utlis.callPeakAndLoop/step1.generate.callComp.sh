#!/bin/bash

######------------Need 5 parameters! <norm: KR/VC/...> <input: .hic files> <chr: 1,2,3...X,Y> <RESolution: 100000/200000/500000> <output>

for dir in `find ../../CleanData/all.juicer/human_humanBrain20220321-append/ -name '*.hic'`
do
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/\./\t/g' | cut -f2`
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`
mkdir -p ../../CleanData/eigenVector/${batch}/
norm=KR
Res=100000

for i in `seq 1 1 22` "X"
do
output=../../CleanData/eigenVector/${batch}/${sample}.${Res}.chr${i}.pc1.txt
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/juicer.callComp.sh ${norm} ${dir} ${i} ${Res} ${output}"
echo $CMD
done
done


