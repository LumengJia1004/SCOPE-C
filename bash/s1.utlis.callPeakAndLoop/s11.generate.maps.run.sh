cat ./maps.huamnBrain220321-append.list \
   | perl -F, -lane ' $maps="/lustre1/lch3000_pkuhpc/jialm/Software/MAPS/bin/maps_pipeline.sh";
                      print "$maps $F[0] $F[1] $F[2] $F[3] $F[4]"' 
   #| /lustre1/lch3000_pkuhpc/jialm/Software/bin/asub -g 1 -n 20 -j humanIPC_maps.model -R "--no-requeue -A lch3000_g1 --qos=lch3000cnl -p cn-long"
