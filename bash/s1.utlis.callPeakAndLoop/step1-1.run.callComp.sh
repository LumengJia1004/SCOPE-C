#!/bin/bash

CMD="sh step1.generate.callComp.sh | sort | uniq | grep 'eN'| /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j callComp.NAWALMA -R \"--no-requeue -A lch3000_g1 --qos=lch3000cns -p cn-short\""
echo $CMD
eval $CMD 
