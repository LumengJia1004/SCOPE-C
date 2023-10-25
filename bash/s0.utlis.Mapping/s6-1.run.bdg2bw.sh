#!/bin/bash

CMD="sh s6.generate.bdg2bw.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j bgd2bw.20201231.valid -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD 
