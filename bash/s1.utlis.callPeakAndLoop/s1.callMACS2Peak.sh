#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220110-11-1kmerge/ -name 'all.2batch*'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220110-9lane/ -name '*.RMD.DEPairs.bed' | grep -v 'tmp'| grep -v 'split'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220111-append/ -name '*.RMD.DEPairs.bed' | grep 'mergeAll'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/data_20220125sent-append/ -name '*.RMD.DEPairs.bed'| grep 'mergeAll'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220321/ -name '*.RMD.DEPairs.bed' | grep 'mergeAll'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/20211101-mNSC-scopec-N2113162_80-787700753_Lib/ | grep 'AB'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/20210818-mESC-N2110057_80-729267814_Lib/ | grep 'AB'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/*bulk* | grep 'bed'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220321-append/ -name '*bed' | grep -v 'tmp' | grep 'append' | grep 'iPC'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/data_20220125sent-append/ -name '*bed' | grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220111-append/ -name 'all*'| grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/macaca/data_20220111-append-bulk/ -name '*bed' | grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220407sent-mousebulkAppend/ -name '*bed'| grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanBrain20220411V1-1kandBulk/ -name 'merge*'| grep -v 'tmp'`
#for f in `find ../../Tmpdata/Mac2.Input/mouse/*.bulk.append/ -name '*shuf*'`
#for f in `find ../../Tmpdata/Mac2.Input/human/humanNew-220516-PFCandV1/ -name '*bed'| grep -v 'tmp' | grep 'AB'`
for f in `find ../../Tmpdata/Mac2.Input/human/humanNew-220516-PFCandV1-append/ -name '*bed'| grep -v 'tmp' | grep 'merge.AB'`
do


#<InputDir> <sample> <Species> <Clean.bw> <Clean.np> <OutDir> <wheather adjust: Yes / No>

dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f7 | sed 's/\.RMD/\t/g' | cut -f1 | sort | uniq`
#sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f8 | sed 's/\.RMD/\t/g' | cut -f1 | sort | uniq`

In=../../Tmpdata/Mac2.Input/${species}/${batch}
#In=../../Tmpdata/Mac2.Input/${species}/${batch}/tmp
mkdir -p ../../CleanData/MACS2.rmdDE.bw/${species}/${batch}
mkdir -p ../../Tmpdata/Macs2.narrowPeak/${species}/${batch}
mkdir -p ../../Tmpdata/Mac2.Output/${species}.MACS2/${batch}/${sample}
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS2.callOCpeak.sh ${In} ${sample} ${species} ../../CleanData/MACS2.rmdDE.bw/${species}/${batch} ../../Tmpdata/Macs2.narrowPeak/${species}/${batch} ../../Tmpdata/Mac2.Output/${species}.MACS2/${batch}/${sample}/ No"

echo $CMD
done

