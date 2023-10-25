#!/bin/bash

CMD="sh sd2.generate.MACS2.callDNasepeak.sh | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 20 -j Dnase.callpeak.210323 -R \"--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long\""
echo $CMD
eval $CMD 
