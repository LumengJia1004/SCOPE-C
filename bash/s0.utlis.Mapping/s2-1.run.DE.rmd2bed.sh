#!/bin/bash

CMD="sh s2.generate.DE.rmd2bed.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j RMD.DE2bed.mouseBrain -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""


echo $CMD
eval $CMD 
