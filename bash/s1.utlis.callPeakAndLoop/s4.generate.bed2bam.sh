#for f in `find ../../CleanData/allDE/macaca/data_20220110-9lane/ -name '*bed'` 
#for f in `find ../../CleanData/allValidPairs.bed/macaca/data_20220110-9lane/ -name '*AB.allValidPairs.bed'`
#for f in `find ../../CleanData/allDE/macaca/data_20220110-9lane/ -name '*RMD.DEPairs.bed.auto' | grep -v 'shuf'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/ -name '*RMD.DEPairs.bed' | grep -v 'all' | grep -v 'merge' | grep -v 'shuf' | grep 'B'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220407sent-mousebulkAppend/ -name '*RMD.DEPairs.bed' | grep 'AB'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220411V1-1kandBulk/ -name '*RMD.DEPairs.bed' | grep 'AB'`
for f in `find ../../Tmpdata/Mac2.Input/human/humanNew-220516-PFCandV1/ -name '*RMD.DEPairs.bed' | grep 'AB'`
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f7 | sort | uniq`

#Need 4 parameters! <BED> <Species> <tmp> <Out>
mkdir -p ../../CleanData/allDE.bam/${species}/${batch}
#mkdir -p ../../CleanData/allValidPairs.bam/${species}/${batch}
#CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/bed2bam.sh ${f} ${species} ./${sample}.tmp ../../CleanData/allValidPairs.bam/${species}/${batch}/${sample}.bam"
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/bed2bam.sh ${f} ${species} ./${sample}.tmp ../../CleanData/allDE.bam/${species}/${batch}/${sample}.bam"
echo $CMD
done
