#for f in `ls ../../Tmpdata/Mac2.Input/human/humanBrain20220321-append/ | grep 'DEPairs.bed$' | grep -v 'merge' | sed 's/-/\t/g' | cut -f1 | sort | uniq`

for f in `ls ../../Tmpdata/Mac2.Input/mouse/data_20220125sent-append/ | grep 'DEPairs.bed$' | grep -v 'merge' | sed 's/-/\t/g' | cut -f2 | sort | uniq`
do
#cat ../../Tmpdata/Mac2.Input/human/humanBrain20220321-append/${f}*RMD.DEPairs.bed > ../../Tmpdata/Mac2.Input/human/humanBrain20220321-append/all.merge.${f}.RMD.DEPairs &

cat ../../Tmpdata/Mac2.Input/mouse/data_20220125sent-append/*${f}*RMD.DEPairs.bed > ../../Tmpdata/Mac2.Input/mouse/data_20220125sent-append/all.merge.${f}.RMD.DEPairs.bed &

done
