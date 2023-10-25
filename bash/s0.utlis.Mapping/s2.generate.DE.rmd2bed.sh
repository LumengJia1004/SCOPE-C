#mkdir -p ../tmpdata/Mac2.Input/

#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*gz*'| grep 'R1' | grep 'GM01'`
#for f in `find ../rawdata/OC/human/hela/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201218GM/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/blood-human/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/mouse/blood.mouse/ -name '*gz*'| grep 'R1'`
#for f in `find ../rawdata/OC/human/20201231.bulk/ -name '*gz*' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*.gz' | grep 'R1' | grep -v 'Under'`
#for f in `find ../rawdata/OC/human/20210403-N2103934_JLM_80-632382547_SEQ.210326.OC.NAW.hela.append/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/human/20210422-N2104587_JLM_80-642752608_SEQ.0412sent.OC.NAW.6rep.GM-K562.titrition/ -name '*.gz' | grep 'R1' | grep -v 'Un' | grep -v '210416-X4A_L00' | grep -v 'N-'`
#for f in `find ../rawdata/OC/human/N2103049_JLM_80-618431544_SEQ.OC.NAW.210308sent/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/20210516-N2105530_80-657810265_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Unde' | grep '21425-N'`
#for f in `find ../rawdata/OC/mouse/mESC/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/210515.NAW.bulk.OC2/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/210405.NAW.6rep.B.OC2/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/mouse/210629.mESC.1k.and.sc/ -name '*.gz' | grep 'R1' `
#for f in `find ../rawdata/OC/human/210629-hela-k562-replicates/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20210705-N2108115_80-695325145_Lib/ -name '*.gz' | grep 'R1'`
#for f in `find ../tmpdata/hicpro.output/Hela/ -name '*.DEPairs'`
#for f in `find ../../Rawdata/OC/mouse/20210818-N2110057_80-729267814_Lib/ -name '*.gz' | grep 'R1' | grep -v 'ulk'`
#for f in `find ../rawdata/OC/human/20210810-N2109472_80-719397558_Lib/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20210729-hela-bulkOC2-append-N2109301_80-715529729_Lib/ -name '*.gz' | grep 'R1'`
#for f in `find ../../Rawdata/OC/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un' | grep -v 'ulk' | grep '5'`
#for f in `find ../rawdata/OC/macaca/data_20211212/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20211212/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/mouse/data_20211223/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110-9lane/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/mouse/data_20220125sent/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111-append/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/mouse/data_20220125sent-append/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220321/ -name '*.gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220321-append/ -name '*gz' | grep '_1' | grep -v 'un' | grep 'iPC'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111-append-bulk/ -name '*gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220411V1-1kandBulk/ -name '*gz' | grep '_1' | grep -v 'un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220407sent-mousebulkAppend/ -name '*gz' | grep '_1' | grep -v 'un' | grep 'iPC'`
#for f in `find ../../Rawdata/OC/human/humanNew-220516-PFCandV1/ -name '*gz' | grep '_1' | grep -v 'Un'`
for f in `find ../../Rawdata/OC/human/humanNew-220516-PFCandV1-append/ -name '*gz' | grep '_1' | grep -v 'Un'`
do
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
#species=human
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_/\t/g' | cut -f1 | sort | uniq`
#sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`
#Group=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sed 's/_/\t/g' | cut -f2 | sort | uniq`
In=../../Tmpdata/hicpro.output/${species}_${batch}
Clean=../../CleanData/RMD.DE/${species}/${batch}
mkdir -p ../../Tmpdata/Mac2.Input/${species}/${batch}
mkdir -p ../../CleanData/RMD.DE/${species}/${batch}
#<InputDir> <sample> <Group> <OutDir>

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro.DE.rmd2bed.sh ${In} ${sample} ${Clean} ../../Tmpdata/Mac2.Input/${species}/${batch}/"

echo $CMD
done
