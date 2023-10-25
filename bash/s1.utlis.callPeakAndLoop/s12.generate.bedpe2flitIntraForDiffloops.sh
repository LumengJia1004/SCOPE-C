#！/bin/bash

#Need 2 parameters! <bedpe> <species>
#for f in `find ../../CleanData/DE.VL.RawCounts/human/humanBrain20220321-append/RG.iPC.eN.iN.merged.peaks/ -name '*cis.PeakFiltered' `
#for f in `find ../../CleanData/DE.VL.RawCounts/macaca/data_20220111-append/all.RG.iPC.eN.iN.consensusPeaks/ -name '*cis.10kbTo1Mb.PeakFiltered'`
#for f in `find ../../CleanData/DE.VL.RawCounts/macaca/data_20220111-append-bulk/all.RG.eN.iN.consensus.peaks/ -name '*cis.10kbTo1Mb.PeakFiltered'`
#for f in `find ../../CleanData/DE.VL.RawCounts/macaca/data_20220110-9lane/all.RG.eN.iN.1k.consensusPeak.narrowPeaks/ -name '*cis.10kbTo1Mb.PeakFiltered'`
#for f in `find ../../CleanData/DE.VL.RawCounts/macaca/data_20220110-11-1kmerge/all.consensusPeaks/ -name '*cis.1bpTo1Mb.PeakFiltered'`
#for f in `find ../../CleanData/DE.VL.RawCounts/mouse/mESC.NSC.1k/mESC.NSC.1k.merge.narrowPeaks/ -name '*cis.PeakFiltered'`
for f in `find ../../CleanData/DE.VL.RawCounts/human/humanNew-220516-PFCandV1-append/ -name '*cis.PeakFiltered'`
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5`

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/bedpe2flitIntraForDiffloops.sh ${f} ${species}"

echo $CMD
done



