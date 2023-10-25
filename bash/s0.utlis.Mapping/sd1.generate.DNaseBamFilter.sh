
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/DNase/human/N2100345_JLM_80-587472163_SEQ/ -name '*.gz' | grep 'R1' | grep '201226'`
#for f in `find ../rawdata/N2101511_JLM_80-599940235_SEQ/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/DNase/human/N2101836_JLM_80-602730063_SEQ/  -name '*.gz' | grep 'R1' | grep -v 'Un'`
for f in `find ../rawdata/DNase/human/N2103346_JLM_80-623006969_SEQ/  -name '*.gz' | grep 'R1' | grep -v 'Un'`
do
dir=${f}
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4`
#species=human
group=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1`
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f2`

mkdir -p ../tmpdata/DNaseMACS2.input/${species}/${group}/

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/DNase.BamFilter.sh ../tmpdata/DNaseBowtie2.output/${species}/${group}/${group}.${sample}.sam ../tmpdata/DNaseMACS2.input/${species}/${group}/${group}.${sample}.bam"

echo $CMD
done


