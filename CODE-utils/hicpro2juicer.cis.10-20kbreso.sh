#!/bin/bash

if [ $# -lt 5 ];then
	    echo "Need 5 parameters! <input1> <input2> <output1> <output2> <Species>"
		    exit
fi

In1=$1 ## white space, '.,\' are not allowed 
In2=$2 
out1=$3
out2=$4
Species=$5

if [ ${Species} = "human" ];then
 Seq=`seq 1 1 22`
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Seq=`seq 1 1 19`
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
fi

awk '{if ($2 == $5) print $0}' ${In1} | cut -f2 | sort | uniq -c > ${In1}.cis.counts
awk '{if ($2 == $5) print $0}' ${In2} | cut -f2 | sort | uniq -c > ${In2}.cis.counts


for i in ${Seq}
do
awk '{if ($2 == $5) print $0}' ${In1} | grep -w chr${i} > ${In1}.cis.chr${i}
awk '{if ($2 == $5) print $0}' ${In2} | grep -w chr${i} > ${In2}.cis.chr${i}

A1=`cat ${In1}.cis.counts | grep -w chr${i} | awk '{print $1}'`
A2=`cat ${In2}.cis.counts | grep -w chr${i} | awk '{print $1}'`


if [[ ${A1} -le ${A2} ]];then
shuf -n ${A1} ${In1}.cis.chr${i} > ${In1}.cis.chr${i}.shuf.${A1}
shuf -n ${A1} ${In2}.cis.chr${i} > ${In2}.cis.chr${i}.shuf.${A1}
else [[ ${A1} -gt ${A2} ]]
shuf -n ${A2} ${In1}.cis.chr${i} > ${In1}.cis.chr${i}.shuf.${A1}
shuf -n ${A2} ${In2}.cis.chr${i} > ${In2}.cis.chr${i}.shuf.${A1}
fi

done

wait 
sleep 3

cat ${In1}.cis.chr*.shuf.* > ${In1}.cis.shufall
cat ${In2}.cis.chr*.shuf.* > ${In2}.cis.shufall

#rm -rf ${In1}.cis.chr*
#rm -rf ${In2}.cis.chr*

mkdir tmp

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.1/bin/utils/hicpro2juicebox_cw.q10.10-20kbreso.sh -i ${In1}.cis.shufall -g ${Gsize} -j /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.22.01.jar -t ./tmp -o ${out1}

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.1/bin/utils/hicpro2juicebox_cw.q10.10-20kbreso.sh -i ${In2}.cis.shufall -g ${Gsize} -j /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.22.01.jar -t ./tmp -o ${out2}

wait
sleep 3

rm -rf ${In1}.cis.chr*
rm -rf ${In2}.cis.chr*

