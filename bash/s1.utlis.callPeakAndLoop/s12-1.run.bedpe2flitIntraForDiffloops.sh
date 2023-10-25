CMD="sh s12.generate.bedpe2flitIntraForDiffloops.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j bedpe2flitIntraForDiffloops -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD

