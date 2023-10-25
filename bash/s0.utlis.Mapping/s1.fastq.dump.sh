#!/bin/bash

In=$1
Out=$2

for f in `ls $In | grep '*.sra$'`
do
CMD="pkurun-cns 1 1 fastq-dump --gzip --split-3 ${In}/${f} -O ${Out}"
echo $CMD
eval $CMD
done
