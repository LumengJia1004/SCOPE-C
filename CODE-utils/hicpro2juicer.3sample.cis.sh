#!/bin/bash

if [ $# -lt 7 ];then
	    echo "Need 7 parameters! <input1> <input2> <input3> <output1> <output2> <output3> <Species>"
		    exit
fi

In1=$1 ## white space, '.,\' are not allowed 
In2=$2 
In3=$3
out1=$4
out2=$5
out3=$6
Species=$7

if [ ${Species} = "human" ];then
 Seq=`seq 1 1 22`
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/hg19.genome.size
 elif [ ${Species} = "mouse" ];then
 Seq=`seq 1 1 19`
 Gsize=/lustre1/lch3000_pkuhpc/jialm/Annotation/genomoSize/mm9.genome.size
fi

awk '{if ($2 == $5) print $0}' ${In1} | cut -f2 | sort | uniq -c > ${In1}.cis.counts
awk '{if ($2 == $5) print $0}' ${In2} | cut -f2 | sort | uniq -c > ${In2}.cis.counts
awk '{if ($2 == $5) print $0}' ${In3} | cut -f2 | sort | uniq -c > ${In3}.cis.counts

for i in ${Seq}
do
awk '{if ($2 == $5) print $0}' ${In1} | grep -w chr${i} > ${In1}.cis.chr${i}
awk '{if ($2 == $5) print $0}' ${In2} | grep -w chr${i} > ${In2}.cis.chr${i}
awk '{if ($2 == $5) print $0}' ${In3} | grep -w chr${i} > ${In3}.cis.chr${i}

A1=`cat ${In1}.cis.counts | grep -w chr${i} | awk '{print $1}'`
A2=`cat ${In2}.cis.counts | grep -w chr${i} | awk '{print $1}'`
A3=`cat ${In3}.cis.counts | grep -w chr${i} | awk '{print $1}'`

#echo -e "A1=\t$A1"
#echo -e "A2=\t$A2"
#echo -e "A3=\t$A3"

if [[ ${A1} -le ${A2} ]];then
min=$A1
else [[ ${A1} -gt ${A2} ]]
min=$A2
fi

#echo -e "min=\t$min"

if [[ ${min} -le ${A3} ]];then
Min=${min}
else [[ ${min} -gt ${A3} ]]
Min=${A3}
fi

#echo -e "Min=\t$Min"
shuf -n ${Min} ${In1}.cis.chr${i} > ${In1}.cis.chr${i}.shuf.${Min}
shuf -n ${Min} ${In2}.cis.chr${i} > ${In2}.cis.chr${i}.shuf.${Min}
shuf -n ${Min} ${In3}.cis.chr${i} > ${In3}.cis.chr${i}.shuf.${Min}

done

wait 
sleep 3

cat ${In1}.cis.chr*.shuf.* > ${In1}.cis.shufall
cat ${In2}.cis.chr*.shuf.* > ${In2}.cis.shufall
cat ${In3}.cis.chr*.shuf.* > ${In3}.cis.shufall

mkdir tmp.3

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.1/bin/utils/hicpro2juicebox_cw.q10.sh -i ${In1}.cis.shufall -g ${Gsize} -j /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.22.01.jar -t ./tmp.3 -o ${out1}

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.1/bin/utils/hicpro2juicebox_cw.q10.sh -i ${In2}.cis.shufall -g ${Gsize} -j /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.22.01.jar -t ./tmp.3 -o ${out2}

/lustre1/lch3000_pkuhpc/jialm/Software/HiC-Pro_2.11.1/bin/utils/hicpro2juicebox_cw.q10.sh -i ${In3}.cis.shufall -g ${Gsize} -j /lustre1/lch3000_pkuhpc/jialm/Software/bin/juicer_tools_1.22.01.jar -t ./tmp.3 -o ${out3}
wait
sleep 3

rm -rf ${In1}.cis.chr*
rm -rf ${In2}.cis.chr*
rm -rf ${In3}.cis.chr*
