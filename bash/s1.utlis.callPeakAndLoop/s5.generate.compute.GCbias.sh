for f in `find ../allDE.bam/ -name '*bed.bam'` 
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f3 | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`

if [[ ${species} = "human" ]];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Reference/hg19/Sequence/WholeGenomeFasta/genome.2bit
 eG=2864785220
 elif [[ ${species} = "mouse" ]];then
 Genome=/lustre1/lch3000_pkuhpc/jialm/Reference/mm10/Sequence/WholeGenomeFasta/genome.2bit
 eG=2652783500
fi


mkdir -p ../allDE.bam.GCcorrected/${species}/${batch}
CMD="computeGCBias -b ${f} --effectiveGenomeSize ${eG} -g ${Genome} -l 200 --GCbiasFrequenciesFile ../allDE.bam.GCcorrected/${species}/${batch}/${sample}.freq_test.txt"

echo $CMD
done
