#!/bin/bash

CMD="sh sd1.generate.DNaseBamFilter.sh | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 20 -j Dnase.filter.210216 -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD 
