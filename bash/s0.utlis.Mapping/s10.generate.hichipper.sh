export PATH=/lustre1/lch3000_pkuhpc/jialm/Software/miniconda3/bin:$PATH

#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*.gz' | grep 'R1' | grep -v 'Under'`
#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*.gz' | grep 'R1' | grep -v 'Under'`
#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1' | grep 'GM01'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201218GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/blood-human/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/mouse/blood.mouse/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201231.bulk/ -name '*gz*' | grep 'R1'`
#for f in `find ../rawdata/OC/human/N2103049_JLM_80-618431544_SEQ/ -name '*.gz' | grep 'R1' | grep -v 'Under'`
#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*.gz' | grep 'R1' | grep -v 'Under'`
#for f in `find ../rawdata/OC/human/20210403-N2103934_JLM_80-632382547_SEQ/ -name '*.gz' | grep 'R1' | grep -v 'Unde' `
for f in `find ../tmpdata/hicpro.output/Hela/ -name '*allValidPairs'`
do
dir=${f}
#batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
#species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
#sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1 | sort | uniq| sed 's/-/\t/g' | cut -f1 | sort | uniq`
mkdir -p ../tmpdata/hichipper.out/${species}/${batch}

batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f3 | sort | uniq`
species=human
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`

Out=/lustre1/lch3000_pkuhpc/jialm/PROJECT/OCEAN-C2.0/tmpdata/hichipper.out/${species}/${sample}
#yaml=../annotation/hichipper.yaml/${species}/${batch}/hela.${sample}.AB.yaml
yaml=./yaml/${sample}.yaml

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hichipper.sh ${Out} ${yaml}"

echo $CMD
done
