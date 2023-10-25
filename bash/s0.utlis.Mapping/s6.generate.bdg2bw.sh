
for f in `find ../tmpdata/Mac2.Output/macaca/data_20220110/ -name '*bdg.sort.exo.chrM' | grep -v 'DE'` 
do

#<bdg> <Species> <Out>

dir=${f}
species=human
ID=`echo "${dir}" | sed 's/\//\t/g' | cut -f6 | sort | uniq `
mkdir -p ../cleandata/OC.rmdDE.bw/human/20201231.bulk.valid/
Out=../cleandata/OC.rmdDE.bw/human/20201231.bulk.valid/${ID}.valid.macs2.ext147.0.01_treat_pileup.bw
CMD="/lustre1/lch3000_pkuhpc/jialm/CODE-utils/bdg2bw.sh ${f} ${species} ${Out}"
echo $CMD
done
