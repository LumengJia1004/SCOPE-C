CMD="sh s10.generate.CountsDEVLinPeak.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j CountsDEVLinPeak -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD


#bash s10.generate.generateMatrix.sh > run.generateMatrix.$species.sh
#echo "bash run.generateMatrix.$species.sh" \
#	| /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 20 -j generateMatrix.$species -R "--no-requeue -A lch3000_g1 --qos=lch3000cns -p cn-short"
