#!/bin/bash

######------------Need 6 parameters! <method: observed/oe/ norm/expected> <norm: KR/VC/...> <input: .hic files> <chr: 1,2,3...X,Y> <RESolution: 100000/200000/500000> <output>
for dir in `find ../all.juicer/ -name '*.hic' | grep -v 'merge' | grep 'ES' | grep -v 'NSC'`
#for dir in `find ../all.juicer/ -name '*.hic' | grep -v 'merge' | grep -v 'GM' | grep -v 'ela' | grep -v '562' | grep -v 'NSC' | grep -v 'Gm' | grep -v 'Merge' | grep -v 'sc'`
#for dir in `find ../all.juicer/ -name '*.hic' | grep -v 'merge' | grep 'sc'`
#for dir in `find ../../../OCEAN-C2.0/publicData/HiC/human/ -name '*hic' | grep 'GSM4889375'`
do
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f3`
#norm=NONE
norm=KR
mkdir -p ../${norm}.mat/${sample}
Res=1000
#method=expected
method=oe
#method=observed
for i in `seq 1 1 19` "X" "Y" "M"
do
output=../${norm}.mat/${sample}/${sample}.${method}.${norm}.${Res}.chr${i}.txt
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro.dump.sh ${method} ${norm} ${dir} ${i} ${Res} ${output}"
echo $CMD
done
done


