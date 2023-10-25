mkdir -p ../tmpdata/Mac2.Input/

for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*gz*'| grep 'R1'`
do

dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1 | sort | uniq`

R1=../tmpdata/hicpro.output/${batch}/${sample}/bowtie_results/bwt2/${sample}/${sample}_combined_R1.cutadapt_genome.bwt2merged.bam
R2=../tmpdata/hicpro.output/${batch}/${sample}/bowtie_results/bwt2/${sample}/${sample}_combined_R2.cutadapt_genome.bwt2merged.bam

mkdir -p ../tmpdata/Mac2.Input/${species}/${batch}/
#<R1> <R2> <OutDir>

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/bwt2sington.sh ${R1} ${R2} ../tmpdata/Mac2.Input/${species}/${batch}/${sample}.rmd.singleton.bed"

echo $CMD
done
