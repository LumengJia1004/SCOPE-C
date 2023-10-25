#!/bin/bash

CMD="sh s4.generate.slopNarrowPeak.sh | sort | uniq | /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 1 -j slopPeak.succeed-GM -R \"--no-requeue -A lch3000_g1 --qos=lch3000cns -p cn-short\""
echo $CMD
eval $CMD 
