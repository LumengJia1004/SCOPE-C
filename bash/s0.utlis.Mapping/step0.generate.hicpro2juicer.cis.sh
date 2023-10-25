#!/bin/bash

##--------Need 5 parameters! <input1> <input2> <output1> <output2> <Species>

#dir=`find ../data/ -name '*S13*' | grep -v 'cis' | grep -v 'shuf' | grep 'all.all'`
#dir=`find ../data/ -name '*SCC1*' | grep -v 'cis' | grep -v 'shuf'`
dir=`find ../data/ -name '*CTCF*' | grep -v 'cis' | grep -v 'shuf'`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f3 | sed 's/\./\t/g' |cut -f2`

input1=`echo "${dir}" | head -1`
input2=`echo "${dir}" | tail -1`
sample1=`echo "${dir}" | sed 's/\//\t/g' | cut -f3 | sed 's/\./\t/g' |cut -f2 | head -1`
sample2=`echo "${dir}" | sed 's/\//\t/g' | cut -f3 | sed 's/\./\t/g' |cut -f2 | tail -1`
mkdir -p ../../../cleandata/juicer/
output1=../../../cleandata/juicer/
output2=../../../cleandata/juicer/
species=mouse


CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro2juicer.sh ${input1} ${input2} ${output1} ${output2} ${species}"

echo $CMD




