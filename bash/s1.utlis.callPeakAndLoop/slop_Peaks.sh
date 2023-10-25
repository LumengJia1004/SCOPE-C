for f in `ls ../../Tmpdata/Macs2.narrowPeak/human/humanBrain20220321-append/ | grep 'all'`
do

pkurun-cnlong 1 1 "bedtools slop -b 500 -i ../../Tmpdata/Macs2.narrowPeak/human/humanBrain20220321-append/${f} -g ../../../../Annotation/genomoSize/hg19.genome.size > ../../Tmpdata/Macs2.narrowPeak/human/humanBrain20220321-append/${f}.slop"

done
