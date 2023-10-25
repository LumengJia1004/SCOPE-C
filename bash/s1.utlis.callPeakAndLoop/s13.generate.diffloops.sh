#！/bin/bash

#Need 3 parameters! Indir <- args[1]; sample <- args[2] # end up with .filt.intra; Outdir <- args[3]

#for f in `find ../../CleanData/DE.VL.RawCounts/human/humanBrain20220321-append/ -name 'all*.loop_counts.bedpe'`
for f in `find ../../CleanData/DE.VL.RawCounts/mouse/mESC.NSC.1k/mESC.NSC.1k.merge.narrowPeaks/*bedpe`
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f8 | sed 's/\.loop_counts.bedpe//g' | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6`
mkdir -p ../../CleanData/PeakXOR.mango/${species}/${batch}/
CMD="Rscript /lustre1/lch3000_pkuhpc/jialm/CODE-utils/diffloop.R /lustre1/lch3000_pkuhpc/jialm/PROJECT/SCOPEC/CleanData/DE.VL.RawCounts/${species}/${batch}/ ${sample} /lustre1/lch3000_pkuhpc/jialm/PROJECT/SCOPEC/CleanData/PeakXOR.mango/${species}/${batch}"

echo $CMD
done



