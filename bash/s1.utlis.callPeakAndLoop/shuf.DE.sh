for f in `ls ../../CleanData/allDE/macaca/data_20220110-9lane/*B.RMD.DEPairs.bed.auto | grep -v 'all-' | grep -v 'allB'`
do
bedtools sample -n 2405894 -i ${f} > ${f}.shufminB.bed & 
done
