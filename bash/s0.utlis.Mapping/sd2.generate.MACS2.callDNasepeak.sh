
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/DNase/human/N2100345_JLM_80-587472163_SEQ/ -name '*.gz' | grep 'R1' | grep '201226'`
#for f in `find ../rawdata/N2101511_JLM_80-599940235_SEQ/ -name '*.gz' | grep 'R1' | grep 'Dnaseseq' | grep -v '0.bam'`
#for f in `find ../rawdata/DNase/human/N2101836_JLM_80-602730063_SEQ/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/DNase/human/N2103346_JLM_80-623006969_SEQ/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
for f in `find ../rawdata/OC/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ -name '*gz*'| grep 'R1' | grep 'Un'`
do

#<InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir>

dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
#species=human
if [ ${species} = "human" ];then
 Species=hs
 elif [ ${species} = "mouse" ];then
 Species=mm
fi

sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f1 | sort | uniq`
#control=../tmpdata/DNaseMACS2.input/human/N2101511_JLM_80-599940235_SEQ/N2101511_JLM_80-599940235_SEQ.210114-1-Dnaseseq-0.bam
In=../tmpdata/DNaseMACS2.input/${species}/${batch}
mkdir -p ../cleandata/OC.rmdDE.bw/${species}/${batch}/
mkdir -p ../cleandata/OC.narrowPeak/${species}/${batch}
mkdir -p ../tmpdata/Macs14.Output/${species}/${batch}/

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS2.callDNasepeak.sh ${In} ${batch}.${sample} ${Species} ../cleandata/OC.rmdDE.bw/${species}/${batch} ../cleandata/OC.narrowPeak/${species}/${batch} ../tmpdata/Macs14.Output/${species}/${batch}"

echo $CMD
done
