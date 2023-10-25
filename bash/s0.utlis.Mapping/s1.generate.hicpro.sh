
#####---------for human,mouse,macaque genome (hg19,mm10,rhe10)
#for f in `find ../rawdata/OC/human/blood-human/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/mouse/blood-20190530/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/GM-other/ -name '*.gz' | grep 'R1' | grep -v 'Linker' | grep -f re.GM-other.list`
#for f in `find ../rawdata/OC/human/succeed.GM/ -name '*.gz'| grep 'R1' | grep -v 'Gm' | grep -v 'GM01'`
#for f in `find ../rawdata/OC/mouse/blood.mouse/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/humanblood/ -name '*.gz' | grep 'h-mlp' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20201218GM/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/DNase/human/20201218NAWALMA/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20201231.bulk/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/human/N2103049_JLM_80-618431544_SEQ/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/human/20200323.hela.oc/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/human/20210403-N2103934_JLM_80-632382547_SEQ/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/human/20210516-N2105530_80-657810265_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Unde'`
#for f in `find ../rawdata/OC/human/N2103049_JLM_80-618431544_SEQ.OC.NAW.210308sent/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/20210422-N2104587_JLM_80-642752608_SEQ.0412sent.OC.NAW.6rep.GM-K562.titrition/ -name '*.gz' | grep 'R1' | grep -v 'Un' | grep -v '210416-X4A_L00' | grep -v 'N-'`
#for f in `find ../publicData/DNase/fastq/Hela/ -name '*.gz'`
#for f in `find ../publicData/DNase/fastq/NAMALWA/ -name '*.gz'`
#for f in `find ../rawdata/OC/mouse/mESC/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/210405.NAW.6rep.B.OC2/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/mouse/210629.mESC.1k.and.sc/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/210629-hela-k562-replicates/  -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/human/20210705-N2108115_80-695325145_Lib/ -name '*.gz' | grep 'R1'`
#for f in `find ../rawdata/OC/mouse/210712-N2108415_80-700112557_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../publicData/HiChIP/human/Hela/ -name '*R1.cutadapt.fastq.gz'`
#for f in `find ../rawdata/OC/human/20210729-hela-bulkOC2-append-N2109301_80-715529729_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/human/20210810-N2109472_80-719397558_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/mouse/20210818-N2110057_80-729267814_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ -name '*.gz' | grep 'R1' | grep -v 'Un'`
#for f in `find ../rawdata/OC/macaca/data_20211212/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/macaca/data_20211212/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/mouse/data_20211223/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220110-9lane/  -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/mouse/data_20220125sent/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111-append/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/mouse/data_20220125sent-append/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220321/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un' | grep 'A'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220321-append/ -name '*.gz' | grep '_1' | grep -v 'Un' | grep 'iPC-4A'`
#for f in `find ../../Rawdata/OC/macaca/data_20220111-append-bulk/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220407sent-mousebulkAppend/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/human/humanBrain20220411V1-1kandBulk/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/human/humanNew-220516-PFCandV1/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/macaca/macaca-iPC-append-220513/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
#for f in `find ../../Rawdata/OC/human/humanNew-220516-PFCandV1-append/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un' | grep -f ../../Tmpdata/hicpro.output/human_humanNew-220516-PFCandV1-append/re.list`
for f in `find ../../Rawdata/OC/human/humanBrain20220411V1-1k-append/ -name '*.gz' | grep '_1' | grep -v 'un' | grep -v 'Un'`
do
dir=${f}
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5`
group=`echo "${dir}" | sed 's/\//\t/g' | cut -f6`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_/\t/g' | cut -f1`
#sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/_1/\t/g' | cut -f1`
mkdir -p ../../Tmpdata/hicpro.output/${species}_${group}/

if [ ${species} = "human" ];then
 config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.hg19.txt
 elif [ ${species} = "mouse" ];then
 #config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.mm9.txt
 config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.mm10.txt
 elif [ ${species} = "macaca" ];then
 #config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/rheMac8.config.txt
 config=/lustre1/lch3000_pkuhpc/jialm/Annotation/hicpro/config-hicpro.rheMac10.txt
fi

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/hicpro.sh ${config} ../../Tmpdata/hicpro.input/${species}_${group}/${sample} ../../Tmpdata/hicpro.output/${species}_${group}/${sample}"

echo $CMD
done


