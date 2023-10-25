#for f in `find ../allDE/human/1k-K562/ -name '*bed'`
for f in `find ../allDE/mouse/ -name '*NSC*'`
do

#<InputDir> <sample> <Species> <Clean.np> <OutDir,absolute path> 

#dir=../allDE/mouse/${f}
dir=${f}
batch=`echo "${dir}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
species=`echo "${dir}" | sed 's/\//\t/g' | cut -f3 | sort | uniq`
sample=`echo "${dir}" | sed 's/\//\t/g' | cut -f5 | sort | uniq | sed 's/.RMD.DEPairs.bed//g'`
if [ ${species} = "human" ];then
 Species=hs
 elif [ ${species} = "mouse" ];then
 Species=mm
fi

In=../allDE/${species}/${batch}/
#mkdir -p ../narrowPeak/OC.rmdDE.bw/${species}/${batch}
#mkdir -p ../narrowPeak/OC.narrowPeak/${species}/${batch}
#mkdir -p ../tmpdata/Mac2.Output/${species}/${batch}/${sample}


#cat ../allDE/${species}/${batch}/*RMD.DEPairs.bed > ../allDE/${species}/${batch}/${batch}.merged.RMD.DEPairs.bed &

#CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS2.callOCpeak.sh ${In} ${batch}.merge ${Species} ../narrowPeak/OC.rmdDE.bw/${species}/${batch}/ ../narrowPeak/OC.narrowPeak/${species}/${batch}/ ../tmpdata/Mac2.Output/${species}/${batch}/ No"

CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/MACS14.callOCpeak.sh ${In} ${sample} ${Species} ../narrowPeak/OC.narrowPeak/${species}/${batch}/ /lustre1/lch3000_pkuhpc/jialm/PROJECT/OCEAN-C2.0/allSUCCEED/tmpdata/Mac2.Output/${species}/${batch}/"

#rm -rf ../allDE/${species}/${batch}/${batch}.merged.RMD.DEPairs.bed

echo $CMD
done
