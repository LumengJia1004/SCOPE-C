for f in `ls ../../CleanData/DEandValid.bam/human/humanBrain20220321-append/ | grep 'bam$' | grep -v 'sort'`
do
pkurun-cnlong 1 1 samtools sort -O bam -@ 1 -T ${f}.tmp -o ../../CleanData/DEandValid.bam/human/humanBrain20220321-append/${f}.sort.bam ../../CleanData/DEandValid.bam/human/humanBrain20220321-append/${f}
done
