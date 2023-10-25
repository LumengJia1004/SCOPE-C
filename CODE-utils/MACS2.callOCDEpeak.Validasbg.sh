#!/bin/bash

if [ $# -lt 8 ];then
	    echo "Need 8 parameters! <InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir> <wheather adjust resf: Yes / No> <GG: valid pairs>"
		    exit
fi

DIR=$1
In=$2
Species=$3
Cleanbw=$4
Cleannp=$5
Out=$6
Adjust=$7
BG=$8

####--------run macs2

mkdir -p ${Out}/${In}
macs2 callpeak -t ${DIR}/${In}.RMD.DEPairs.bed  -c ${BG} --keep-dup all -q 0.01 --extsize 147 --nomodel -g ${Species} -B -f BED --verbose 0 -n ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01.validasBG

###--------adjust resf
if [ ${Adjust} = "Yes" ];then

Rscript /lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/lib/python2.7/site-packages/hichipper/lambdaProcess.R /lustre1/lch3000_pkuhpc/jialm/Annotation/enzyme_site/hg19_MboI_resfrag.bed.gz ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_treat_pileup.bdg ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01_control_lambda.bdg ${Out}/${In}/
macs2 bdgcmp -t ${Out}/${In}/adjustedTreatment.bdg.tmp -c ${Out}/${In}/adjustedBackground.bdg.tmp -m qpois -o ${Out}/${In}/hichipper_qvalue.bdg.tmp
macs2 bdgpeakcall -i ${Out}/${In}/hichipper_qvalue.bdg.tmp -c 2 -l 147 -g 100 -o ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01validasBG_hichipper_peaks.bed
 elif [ ${Adjust} = "No" ];then
 echo "Ignore resfrag adjustment"
fi

####-------bgd2bw
sort -k1,1 -k2,2n ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01.validasBG_treat_pileup.bdg > ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01.validasBG_treat_pileup.bdg.sort
grep -v 'chrM' ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01.validasBG_treat_pileup.bdg.sort | grep -vw 'chr' > ${Out}/${In}/${In}.rmdDE.macs2.ext147.0.01.validasBG_treat_pileup.bdg.sort.exo.chrM

if [ ${Species} = "hs" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mm" ];then
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
fi

bedGraphToBigWig ${Out}/${In}/${In}*treat_pileup.bdg.sort.exo.chrM ${Gsize} ${Cleanbw}/${In}.rmdDE.macs2.ext147.0.01.validasBG_treat_pileup.bw

####-------clean

rm -rf ${Out}/${In}/*bdg*
rm -rf ${Out}/${In}/*tmp
mv ${Out}/${In}/*narrowPeak* ${Cleannp}/${In}.rmdDE.macs2.ext147.0.01.validasBG.narrowPeaks

