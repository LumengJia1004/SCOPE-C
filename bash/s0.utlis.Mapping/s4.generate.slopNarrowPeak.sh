for f in `ls ../cleandata/OC.narrowPeak/human/succeed.GM/`
#for f in `ls ../cleandata/OC.narrowPeak/human/hela/`
do

#<InputPeak> <Species hg19/mm9> <Extend length> <OutputPeak>

In=../cleandata/OC.narrowPeak/human/succeed.GM/${f}
Species=`echo "${In}" | sed 's/\//\t/g' | cut -f4 | sort | uniq`
ExtLength=3000
Sample=`echo "${In}" | sed 's/\//\t/g' | cut -f6 | sed 's/\./\t/g' | cut -f1 | sort| uniq`
batch=`echo "${In}" | sed 's/\//\t/g' | cut -f5 | sort | uniq`
mkdir -p ../tmpdata/preMICC-Input/${Species}/${batch}/
Out=../tmpdata/preMICC-Input/${Species}/${batch}/${Sample}.narrowPeak.slop$ExtLength
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/slopnarrowPeak.sh ${In} ${Species} ${ExtLength} ${Out}" 
echo $CMD

done 
