#！/bin/bash

#Need 3 parameters! <BAM> <Species> <Out> 
for f in `find ../../CleanData/allDE.bam/human/human* -name '*.bam'`
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f7 | sed 's/\.bam//g' | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6`
mkdir -p ../../CleanData/deeptools.CPM.bw/${species}/${batch}/
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/bamCoverage.sh ${f} ${species} /lustre1/lch3000_pkuhpc/jialm/PROJECT/SCOPEC/CleanData/deeptools.CPM.bw/${species}/${batch}/${sample}.bw"

echo $CMD
done



