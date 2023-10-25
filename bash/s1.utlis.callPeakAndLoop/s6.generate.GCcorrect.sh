for f in `find ../../CleanData/allDE.bam/macaca/data_20220110-9lane/ -name '*shuf.RMD.DEPairs.bed.bam'` 
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f7 | sort | uniq`

if [[ ${species} = "human" ]];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Reference/hg19/Sequence/WholeGenomeFasta/genome.2bit
 elif [[ ${species} = "mouse" ]];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Reference/mm10/Sequence/WholeGenomeFasta/genome.2bit
 elif [[ ${species} = "macaca" ]];then
 Genome= /lustre1/lch3000_pkuhpc/jialm/Reference/rheMac10/rheMac10.2bit
fi

if [[ ${species} = "human" ]];then
 eG=2864785220
 elif [[ ${species} = "mouse" ]];then
 eG=2652783500
 
fi

mkdir -p ../allDE.bam.GCcorrected/${species}/${batch}
CMD="correctGCBias -b ${f} --effectiveGenomeSize ${eG} --genome ${Genome} --GCbiasFrequenciesFile ../allDE.bam.GCcorrected/${species}/${batch}/${sample}.freq_test.txt -o ../allDE.bam.GCcorrected/${species}/${batch}/${sample}.gc_corrected.bam"

echo $CMD
done
