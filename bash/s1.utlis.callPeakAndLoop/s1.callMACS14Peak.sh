#for f in `find ../../tmpdata/Mac2.Input/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ -name '*RMD.DEPairs.bed'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20211212/ -name '*RMD.DEPairs.bed' | grep -v 'A'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/data_20211223/ -name '*RMD.DEPairs.bed'`
#for f in `find ../../CleanData/allDE/macaca/data_20220110-9lane/ -name '*.bed' | grep 'all' | grep -v 'allB'`
#for f in `find ../../CleanData/allDE/macaca/data_20220110-9lane/ -name 'allB-*'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/data_20220125sent-append/ -name 'all.RG.eN.iN.adjustCounts.RMD.DEPairs.bed'`
for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220321/ -name '*RMD.DEPairs.bed' | grep 'mergeAll'`
do

#<InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir> <wheather adjust: Yes / No>
#Need 5 parameters! <InputDir> <sample> <Species> <Clean.np> <OutDir>

dir=${f}

batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`

if [ ${species} = "human" ];then
 Species=hs
 elif [ ${species} = "mouse" ];then
 Species=mm
 elif [ ${species} = "macaca" ];then
 Species=hs
fi

sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/\.RMD/\t/g' | cut -f1 | sort | uniq`

#In=../../CleanData/allDE/${species}/${batch}/
In=../../Tmpdata/Mac2.Input/${species}/${batch}/
mkdir -p ../../CleanData/MACS14.narrowPeak/OC.narrowPeak/${species}/${batch}
mkdir -p ../../Tmpdata/Mac2.Output/${species}/${batch}/${sample}
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS14.callOCpeak.sh ${In} ${sample} ${Species} ../../CleanData/MACS14.narrowPeak/OC.narrowPeak/${species}/${batch}/ /lustre1/lch3000_pkuhpc/jialm/PROJECT/SCOPEC/Tmpdata/Mac2.Output/${species}/${batch}/${sample}"

echo $CMD
done
