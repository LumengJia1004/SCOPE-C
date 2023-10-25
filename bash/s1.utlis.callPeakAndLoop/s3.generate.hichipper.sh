#for f in `find ../hichipper.input/ -name '*validPairs*' | grep 'NSC' | grep '1M'`
#for f in `find ../hichipper.input/ -name '*hic_*' | grep '562' | grep -v 'NAW' | grep -v 'blood'` 
#for f in `find ../hichipper.input/human/1k-blood/ -name '*hic_*'`
#for f in `find ../hichipper.input/mouse/Dinglab-mESC.1M/ -name 'Dinglab-mESC.1M.merge'`
#for f in `find ../../Tmpdata/hichipper.input/macaca/macaca_data_20220111-append/ -name '*all*'`
for f in `find ../../Tmpdata/hichipper.input/macaca/data_20220110-9lane/ -name '*all*'`
#for f in `find ../../Tmpdata/hichipper.input/mouse/mouse_data_20220125sent-append/ -name '*all*'`
#for f in `find ../../Tmpdata/hichipper.input/human/humanBrain20220321/ -name '*All*'`
do
species=`echo "${f}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
batch=`echo "${f}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
sample=`echo "${f}" | sed 's/\//\t/g' | cut -f7 | sort | uniq`
ID=`echo "${sample}" | sed 's/\-/\t/g' | cut -f1 | sort | uniq`
#CMD1="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${batch}_${sample}.10kb-2Mb.nomerge.noresfragCorr.hichipper --skip-resfrag-pad --skip-background-correction -nm -l 150 -mi 10001 -ma 2000001 -pp 0 -mg 0 -z --macs2-genome mm ./yaml/${sample}.yaml"
#CMD2="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${batch}_${sample}.larger10kb.nomerge.noresfragCorr.hichipper --skip-resfrag-pad --skip-background-correction -nm -l 150 -mi 10001 -ma 200000000 -pp 0 -mg 0 -z --macs2-genome mm ./yaml/${sample}.yaml"
#CMD3="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${batch}_${sample}.larger2M.nomerge.noresfragCorr.hichipper --skip-resfrag-pad --skip-background-correction -nm -l 150 -mi 2000001 -ma 200000000 -pp 0 -mg 0 -z --macs2-genome mm ./yaml/${sample}.yaml"

if [ ${species} = "human" ];then
 Species=hs
 elif [ ${species} = "macaca" ];then
 Species=hs
 elif [ ${species} = "mouse" ];then
 Species=mm
fi

#CMD3="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${batch}_${sample}.5kb-2Mb.MACS14summitPeak.extAccTracLoop.hichipper -l 150 -mi 10000 -ma 2000000 -pp 0 -nm -z --macs2-genome ${Species} ./yaml/${sample}.narrowPeak.yaml.extAccTracLoop.yaml"
#CMD4="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${batch}_${sample}.5kb-200Mb.narrowPeak.pp500.MACS14.hichipper -l 150 -mi 5000 -ma 200000000 -pp 500 -mg 500 -z --macs2-genome ${Species} ./yaml/${sample}.narrowPeak.yaml"
CMD5="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${species}_${batch}_${sample}.5kb-2Mb.narrowPeak.pp500.mg500.MACS14.hichipper -l 150 -mi 5000 -ma 2000000 -pp 500 -mg 500 -z --macs2-genome ${Species} ./yaml/macaca.20220111append.${ID}.Macs2.peak.narrowPeak.yaml" 
#CMD6="/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/envs/py2/bin/hichipper -o ${batch}_${sample}.5kb-2Mb.narrowPeak.pp0.nm.MACS14.hichipper -l 150 -mi 5000 -ma 2000000 -pp 0 -nm -z --macs2-genome ${Species} ./yaml/mouse_data_20220125sent-append.${sample}.consensus.peak.narrowPeak.yaml"
#echo $CMD1
#echo $CMD2
#echo $CMD3
#echo $CMD4
echo $CMD5
#echo $CMD6
done
