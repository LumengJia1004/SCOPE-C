mkdir -p ../tmpdata/Mac2.Input/

#for f in `find ../rawdata/OC/human/*/ -name '*gz*'| grep 'R1' | grep -v 'bulk' | grep -v 'other' | grep -v '20201218GM' | grep -v '562'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201218GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/blood-human/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/mouse/*/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/mouse/blood.mouse/ -name '*.gz' | grep 'R1' | grep 'combine' | grep -v 'r2'`
#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*gz*'| grep 'R1'`
for f in `find ../rawdata/OC/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
do
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1 | sort | uniq`
Group=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f2 | sort | uniq`
In=../tmpdata/hicpro.output/${batch}
Clean=../cleandata/RMD.DE.pairs/${species}/${batch}
mkdir -p ../cleandata/RMD.DE.pairs/${species}/${batch}
#<InputDir> <sample> <Group> <OutDir>

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro.DE.rmd.sh ${In} ${sample} ${Group} ${Clean}"

echo $CMD
done
