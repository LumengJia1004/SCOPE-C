#!/bin/bash

CMD="sh s5.generate.compute.GCbias.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j computeGC -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD 
