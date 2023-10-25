#!/bin/bash

if [ $# -lt 7 ];then
	    echo "Need 7 parameters! <InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir> <wheather adjust resf: Yes / No>"
		    exit
fi

DIR=$1
In=$2
Species=$3
Cleanbw=$4
Cleannp=$5
Out=$6
Adjust=$7

####--------run macs2
if [ ${Species} = "human" ];then
 species=hs
 elif [ ${Species} = "mouse" ];then
 species=mm
 elif [ ${Species} = "macaca" ];then
 species=hs
fi

mkdir -p ${Out}/${In}
#macs2 callpeak -t ${DIR}/${In}.RMD.DEPairs.bed  --keep-dup all -q 0.01 --extsize 147 --nomodel -g ${Species} -B -f BED --verbose 0 -n ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01
macs2 callpeak -t ${DIR}/${In}.RMD.DEPairs.bed  --keep-dup all -q 0.01 --extsize 200 --shift 100 --nomodel -g ${species} -B -f BED --verbose 0 -n ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01

###--------adjust resf
if [ ${Adjust} = "Yes" ];then
if [${Species} = "human"];then
Rscript /lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/lib/python2.7/site-packages/hichipper/lambdaProcess.R /lustre1/lch3000_pkuhpc/jialm/Annotation/enzyme_site/hg19_MboI_resfrag.bed.gz ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_control_lambda.bdg ${Out}/${In}/ 
#Rscript /lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/lib/python2.7/site-packages/hichipper/lambdaProcess.R /lustre1/lch3000_pkuhpc/jialm/Annotation/enzyme_site/hg19_MboI_resfrag.bed.gz ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bdg ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_control_lambda.bdg ${Out}/${In}/
macs2 bdgcmp -t ${Out}/${In}/adjustedTreatment.bdg.tmp -c ${Out}/${In}/adjustedBackground.bdg.tmp -m qpois -o ${Out}/${In}/hichipper_qvalue.bdg.tmp
#macs2 bdgpeakcall -i ${Out}/${In}/hichipper_qvalue.bdg.tmp -c 2 -l 147 -g 100 -o ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_hichipper_peaks.bed
macs2 bdgpeakcall -i ${Out}/${In}/hichipper_qvalue.bdg.tmp -c 2 -l 200 -g 100 -o ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_hichipper_peaks.bed
elif [ ${Species} = "mouse" ];then
Rscript /lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/lib/python2.7/site-packages/hichipper/lambdaProcess.R /lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/mm10_MboI_resfrag.bed.gz ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_control_lambda.bdg ${Out}/${In}/ 
macs2 bdgcmp -t ${Out}/${In}/adjustedTreatment.bdg.tmp -c ${Out}/${In}/adjustedBackground.bdg.tmp -m qpois -o ${Out}/${In}/hichipper_qvalue.bdg.tmp
macs2 bdgpeakcall -i ${Out}/${In}/hichipper_qvalue.bdg.tmp -c 2 -l 200 -g 100 -o ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_hichipper_peaks.bed
fi
elif [ ${Adjust} = "No" ];then
echo "Ignore resfrag adjustment"
fi

####-------bgd2bw
#sort -k1,1 -k2,2n ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bdg > ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bdg.sort
#grep -v 'chrM' ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bdg.sort | grep -vw 'chr' > ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bdg.sort.exo.chrM
if [ ${Species} = "human" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/chrom_mm10.sizes
 elif [ ${Species} = "macaca" ];then
 #Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/rheMac8.brief.chrom.sizes
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Reference/rheMac10/rheMac10.chrom.sizes
fi

bedtools slop -i ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg -g ${Gsize} -b 0 | bedClip stdin ${Gsize} ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg.clip
sort -k1,1 -k2,2n ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg.clip > ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg.sort
grep -v 'chrM' ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg.sort | grep -vw 'chr' > ${Out}/${In}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bdg.sort.exo.chrM

#bedGraphToBigWig ${Out}/${In}/${In}*treat_pileup.bdg.sort.exo.chrM ${Gsize} ${Cleanbw}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bw
bedGraphToBigWig ${Out}/${In}/${In}*treat_pileup.bdg.sort.exo.chrM ${Gsize} ${Cleanbw}/${In}.rmdDE.macs2.ext200.shift100.0.01_treat_pileup.bw
####-------clean

rm -rf ${Out}/${In}/*bdg*
rm -rf ${Out}/${In}/*tmp
#mv ${Out}/${In}/*narrowPeak* ${Cleannp}/${In}.rmdDE.macs2.ext147.0.01.narrowPeaks
mv ${Out}/${In}/*narrowPeak* ${Cleannp}/${In}.rmdDE.macs2.ext200.shift100.0.01.narrowPeaks
