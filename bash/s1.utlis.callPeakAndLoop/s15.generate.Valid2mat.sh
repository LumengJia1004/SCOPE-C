#！/bin/bash


#for f in `find ../../Tmpdata/hichipper.input/mouse/pub.hic.mESC/ -name '*allValidPairs' | grep 'cis'`
for f in `find ../../Tmpdata/hichipper.input/human/human_humanNew-220516-PFCandV1-append/ -name '*allValidPairs'`
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f7`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6`
mkdir -p ../../CleanData/hicpro.mat/${species}/${batch}/
if [ ${species} = "human" ];then
 config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.hg19.txt
 elif [ ${species} = "mouse" ];then
 #config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.mm9.txt
 config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.mm10.txt
 elif [ ${species} = "macaca" ];then
 #config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/rheMac8.config.txt
 config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.rheMac10.txt
fi

CMD="/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.4/bin/HiC-Pro -i ../../Tmpdata/hichipper.input/${species}/${batch}/${sample}/hic_results/data/ -o ../../CleanData/hicpro.mat/${species}/${batch}/${sample} -c ${config} -s build_contact_maps"

echo $CMD
done



