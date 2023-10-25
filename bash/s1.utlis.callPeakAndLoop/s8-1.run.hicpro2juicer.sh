#!/bin/bash

CMD="sh s8.hicpro2juicer.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j hicpr2juicer.macacaBarin -R \"--no-requeue -A lch3000_g1 --qos=lch3000cns -p cn-short\""
echo $CMD
eval $CMD 
