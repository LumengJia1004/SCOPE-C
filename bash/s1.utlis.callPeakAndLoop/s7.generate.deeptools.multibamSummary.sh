#for f in `find ../anchor -name '*bed'`
#do

#species=`echo ${f} | sed 's/\//\t/g' | cut -f3`
#batch=`echo ${f} | sed 's/\//\t/g' | cut -f4`
#mkdir -p ../allDE.bam.Deeptools.summary/${species}/${batch}
#mkdir -p ../allanchor.DE.Deeptools.summary
#sample=`echo ${f} | sed 's/\//\t/g' | cut -f5 | sed 's/\.RMD/\t/g' | cut -f1`
#sample=`echo ${f} | sed 's/\//\t/g' | cut -f3 | sed 's/.anchors.bed/\t/g' | cut -f1`
#anchor=../anchor/${sample}.anchors.bed

#bam=../allDE.bam/*/*/${sample}.RMD.DEPairs.bed.bam

#CMD="multiBamSummary BED-file --BED ${anchor} --bamfiles ${f} -o ../allDE.bam.Deeptools.summary/${species}/${batch}/${sample}.pp1000.mg500.5Kb-2Mb.GC.corrected.anchor.npz --outRawCounts ../allDE.bam.Deeptools.summary/${species}/${batch}/${sample}.pp1000.mg500.5Kb-2Mb.GC.corrected.anchor.readCounts.tab"

#CMD="multiBamSummary BED-file --BED ../../CleanData/MACS14.narrowPeak/OC.narrowPeak/macaca/data_20220110-9lane/allB.rmdDE.macs14.nomodel.peaks.bed --bamfiles ../../CleanData/allDE.bam/macaca/data_20220110-9lane/*bam -o ./macaca_data_20220110-9lane.DE.allBConsensusPeak.npz --outRawCounts ./macaca_data_20220110-9lane.DE.allBConsensusPeak.tab"

#CMD="multiBamSummary BED-file --BED ../../CleanData/MACS14.narrowPeak/OC.narrowPeak/macaca/data_20220110-9lane/allB.rmdDE.macs14.nomodel.peaks.bed --bamfiles ../../CleanData/allValidPairs.bam/macaca/data_20220110-9lane/*bam -o ./macaca_data_20220110-9lane.VL.allBConsensusPeak.npz --outRawCounts ./macaca_data_20220110-9lane.VL.allBConsensusPeak.tab"

CMD="multiBamSummary BED-file --BED ../../CleanData/MACS14.narrowPeak/OC.narrowPeak/macaca/data_20220110-9lane/allB-shuf.auto.rmdDE.macs14.nomodel.peaks.bed --bamfiles ../../CleanData/allDE.bam/macaca/data_20220110-9lane/*shuf.RMD.DEPairs.bed.bam -o ./macaca_data_20220110-9lane.DE.allshuf.ConsensusPeak.npz --outRawCounts ./macaca_data_20220110-9lane.DE.allshuf.ConsensusPeak.tab"

echo $CMD
#done
