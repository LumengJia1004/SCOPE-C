#!/bin/bash

CMD="sh ./s1.generate.hicpro.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 20 -j hicpro.SCOPEC.mouseBrain -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD 
