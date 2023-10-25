#!/bin/bash

CMD="sh s0.generate.cutadapt.sh | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 5 -j cutadapt.SCOPEC.mouseBrain -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD 
