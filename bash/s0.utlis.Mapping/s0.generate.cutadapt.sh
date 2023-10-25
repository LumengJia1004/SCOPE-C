#!/bin/bash/

for f in `find ../../Rawdata/OC/human/humanNew-220516-PFCandV1-append/ -name '*.gz' | grep -v 'Un' | grep '_1' | grep -f ../../Tmpdata/hicpro.output/human_humanNew-220516-PFCandV1-append/re.list`

do
dir=${f}
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`
group=`echo "${dir}" | sed 's/\//\t/g' | cut -f6`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_/\t/g' | cut -f1`
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_/\t/g' | cut -f2`
exp=`echo "${dir}" | sed 's/\//\t/g' | cut -f4`
if [ "$exp"x = "OC"x ]; 
then
mkdir -p ../../Tmpdata/hicpro.input/${species}_${group}/${sample}/${sample}
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/cutadapter.OC.sh 1 5 \
../../Tmpdata/hicpro.input/${species}_${group}/${sample}/${sample}/${sample}_${batch}_R1.cutadapt.fastq.gz \
../../Tmpdata/hicpro.input/${species}_${group}/${sample}/${sample}/${sample}_${batch}_R2.cutadapt.fastq.gz \
../../Rawdata/OC/${species}/${group}/${sample}_${batch}_1.fq.gz \
../../Rawdata/OC/${species}/${group}/${sample}_${batch}_2.fq.gz"
elif [ "$exp"x = "DNase"x ];
then
mkdir -p ../tmpdata/DNaseBowtie2.input/${species}/${group} 
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/cutadapter.DNase.sh 20 5 \
../tmpdata/DNaseBowtie2.input/${species}/${group}/${sample}_${batch}_R1.cutadapt.fastq.gz \
../tmpdata/DNaseBowtie2.input/${species}/${group}/${sample}_${batch}_R2.cutadapt.fastq.gz \
../rawdata/${exp}/${species}/${group}/${sample}_${batch}_R1.fastq.gz \
../rawdata/${exp}/${species}/${group}/${sample}_${batch}_R2.fastq.gz"
else
echo "Experiment is error !!!!! only OC and DNase are supported now !!!!!"
echo "Now, \$experiment = $exp"
fi

echo $CMD

done 

