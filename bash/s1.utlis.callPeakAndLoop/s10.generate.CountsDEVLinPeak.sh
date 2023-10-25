#！/bin/bash


#Need 7 parameters! <Species> <OutDir> <VaildIn:dir+sample> <VaildOut:only sample name> <DEIn:dir+sample name> <DEOut:only sample name> <Peaks>
#Peak=../../Tmpdata/Macs2.narrowPeak/macaca/data_20220110-11-1kmerge/all.consensusPeaks
#Peak=../../Tmpdata/Macs2.narrowPeak/human/humanBrain20220321-append/RG.iPC.eN.iN.merged.peaks
#Peak=../../Tmpdata/Macs2.narrowPeak/mouse/mESC.NSC.1k/mESC.NSC.1k.merge.narrowPeaks
Peak=../../Tmpdata/Macs2.narrowPeak/human/humanNew-220516-PFCandV1-append/all.merged.consensus.peaks
PN=`echo "$Peak" | sed 's/\//\t/g' | cut -f7 | sort | uniq`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220321-append/ -name '*RMD.DEPairs.bed' | grep -v 'tmp' | grep -v 'merge'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220111-append-bulk/ -name 'all*RMD.DEPairs.bed' | grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220111-append/ -name '*RMD.DEPairs.bed' | grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220110-9lane/ -name '5x*RMD.DEPairs.bed' | grep -v 'tmp' | grep -v 'split'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220110-11-1kmerge/ -name 'all.2batch*'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/mESC.NSC.1k/ -name '*.RMD.DEPairs.bed'`
for f in `find ../../Tmpdata/Mac2.Input/human/humanNew-220516-PFCandV1-append/ -name '*merge.AB*.RMD.DEPairs.bed'`
do
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f7 | sed 's/\.RMD.DEPairs.bed/\t/g' | cut -f1 | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6`
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5`
mkdir -p ../../CleanData/DE.VL.RawCounts/${species}/${batch}/${PN}

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/CountsDEVLinPeak.sh ${species} ../../CleanData/DE.VL.RawCounts/${species}/${batch}/${PN}/ ../../CleanData/allValidPairs/${species}/${species}_${batch}/${sample}.allValidPairs ${sample}.allValidPairs.bedpe ${f} ${sample} ${Peak}"

echo ${CMD}
done



