for f in `ls ../tmpdata/hicpro.output/`
do
for j in `seq 1 2`
do
In=../tmpdata/hicpro.output/${f}/bowtie_results/bwt2/${f}/${f}*R${j}*bwt2merged.bam 
for x in ${In}
do
Input=${x}
Output=../analysis/QC.map/${f}_R${j}.unmapIDandLength
CMD="pkurun-cnlong 1 1 sh ../../../CODE-utils/ExportUnmap.R1R2.ID.Seq.Length.forHiCPro.sh ${Input} ${Output}"
#echo $CMD
echo ""
echo ""
echo ""
if [ !-f ${Output} ];then
 echo "Every thing seems good! Start running"
 else
 echo "!!! Warning !!! File Exists !!! Please Remove ${Output} and Start"
fi
echo ""
echo ""
echo ""
eval $CMD
done
done
done
