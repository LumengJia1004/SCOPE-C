for f in `find ../allDE/ -name '*bed' | grep -v 'control'`
do

#dir=../allDE/mouse/${f}
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f3 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq | sed 's/.RMD.DEPairs.bed//g'`
if [ ${species} = "human" ];then
 Species=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${species} = "mouse" ];then
 Species=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/chrom_mm10.sizes
fi

In=../allDE/${species}/${batch}/${sample}.RMD.DEPairs.bed

CMD="bedtools slop -l 0 -r 35 -s -i ${In} -g ${Species} > ../allDE/${species}/${batch}/${sample}.slopsr35.RMD.DEPairs.bed"
echo ${CMD}
done
