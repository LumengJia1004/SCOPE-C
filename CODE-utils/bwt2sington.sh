#!/bin/bash

if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <R1> <R2> <output>"
		    exit
fi

R1=$1 ## white space, '.,\' are not allowed 
R2=$2 
output=$3 


#####--------make R1 / R2.bed

samtools view ${R1} | sed 's/M/\t/g' |awk '{print $3"\t"$4"\t"($4+$6)"\t"$5"\t"$1}' > ${R1}.bed
samtools view ${R2} | sed 's/M/\t/g' |awk '{print $3"\t"$4"\t"($4+$6)"\t"$5"\t"$1}' > ${R2}.bed

#####--------choose single / rmd

paste ${R1}.bed ${R2}.bed | awk '{if ($5 == $10) print $0}' | awk '{if ((($1 != "*")&&($6 == "*"))||(($1 == "*")&&($6 != "*"))) print $0}' | awk '{print $1"\t"$2"\t"$3"\t"$5"\t"$4}' > ${R1}.singleR1.bed
paste ${R1}.bed ${R2}.bed | awk '{if ($5 == $10) print $0}' | awk '{if ((($1 != "*")&&($6 == "*"))||(($1 == "*")&&($6 != "*"))) print $0}' | awk '{print $6"\t"$7"\t"$8"\t"$10"\t"$9}' > ${R1}.singleR2.bed

cat ${R1}.singleR1.bed ${R1}.singleR2.bed | grep -v '*' | sort | uniq > ${output}
cat ${R1}.singleR1.bed ${R1}.singleR2.bed | grep -v '*' | sort | uniq | awk '{if ($5 >= 10) print $0}' > ${output}.mapq10

#####-------combine with RMD.DE.bed

#####-------clean

rm -rf ${R1}.bed 
rm -rf ${R2}.bed
rm -rf ${R1}.singleR1.bed
rm -rf ${R1}.singleR2.bed


