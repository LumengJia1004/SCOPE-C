
#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1' | grep 'Gm1002'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201218GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201231.bulk/ -name '*gz*' | grep -v 'Unde' | grep 'R1'`
#for f in `find ../rawdata/OC/human/N2103049_JLM_80-618431544_SEQ/ -name '*gz*' | grep -v 'Unde' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*gz*' | grep -v 'Unde' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20210403-N2103934_JLM_80-632382547_SEQ/ -name '*gz*' | grep -v 'Unde' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20210422-N2104587_JLM_80-642752608_SEQ.0412sent.OC.NAW.6rep.GM-K562.titrition/ -name '*.gz' | grep 'R1' | grep -v 'Un' | grep -v '210416-X4A_L00'`
#for f in `find ../rawdata/OC/human/20210516-N2105530_80-657810265_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/mouse/mESC/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/210515.NAW.bulk.OC2/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/210405.NAW.6rep.B.OC2/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/mouse/210629.mESC.1k.and.sc/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/210629-hela-k562-replicates/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20210705-N2108115_80-695325145_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../tmpdata/Mac2.Input/human/Hela.CTCFhichip/ -name 'SRR*'`
#for f in `find ../tmpdata/Mac2.Input/mouse/20210818-N2110057_80-729267814_Lib/ -name '*RMD.DEPairs.bed'`
#for f in `find ../rawdata/OC/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/macaca/data_20211212/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/mouse/data_20211223/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110-9lane/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/mouse/data_20220125sent/ -name '*.gz' | grep '_1' | grep -v 'un' | grep 'B'`
for f in `find ../../Rawdata/OC/macaca/data_20220111-append/ -name '*.gz' | grep '_1' | grep -v 'un' | grep 'B'`
do

#<InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir> <wheather adjust: Yes / No>

dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`

if [ ${species} = "human" ];then
 Species=human
 elif [ ${species} = "mouse" ];then
 Species=mouse
 elif [ ${species} = "macaca" ];then
 Species=macaca
fi

sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_/\t/g' | cut -f1 | sort | uniq`
#sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/\.RMD/\t/g' | cut -f1 | sort | uniq`

In=../../Tmpdata/Mac2.Input/${species}/${batch}/
mkdir -p ../../CleanData/MACS2.rmdDE.bw/${species}/${batch}
mkdir -p ../../CleanData/MACS2.narrowPeak/${species}/${batch}
mkdir -p ../../Tmpdata/Mac2.Output/${species}/${batch}/${sample}
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS2.callOCpeak.sh ${In} ${sample} ${Species} ../../CleanData/MACS2.rmdDE.bw/${species}/${batch}/ ../../CleanData/MACS2.narrowPeak/${species}/${batch} ../../Tmpdata/Mac2.Output/${species}/${batch}/${sample} No"

#In=../cleandata/ValidPairs.bed/${species}/${batch}/
#mkdir -p ../cleandata/OC.rmdDE.bw/${species}/${batch}.valid
#mkdir -p ../cleandata/OC.narrowPeak/${species}/${batch}.valid
#mkdir -p ../tmpdata/Mac2.Output/${species}/${batch}.valid
#CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS2.callOCpeak.valid.sh ${In} ${sample} ${Species} ../cleandata/OC.rmdDE.bw/${species}/${batch}.valid/ ../cleandata/OC.narrowPeak/${species}/${batch}.valid/ ../tmpdata/Mac2.Output/${species}/${batch}.valid/"

echo $CMD
done
