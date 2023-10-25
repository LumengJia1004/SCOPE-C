#!/bin/bash

##--------Need 3 parameters! <input> <output> <Species>
for f in `find ../tmpdata/hicpro.output/20210810-N2109472_80-719397558_Lib/ -name '*allValidPairs'`
do
dir=${f}
Group=`echo "${dir}" | sed 's/\//\t/g' | cut -f4`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sed 's/\./\t/g' |cut -f1`

input=`echo "${dir}"`
mkdir -p ../cleandata/juicer/${Group}
output=../cleandata/juicer/${Group}
species=mouse

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro2juicer.sh ${input} ${output} ${species}"
echo $CMD
done 




