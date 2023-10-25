if [ $# -lt 3 ];then
	    echo "Need 3 parameters! <OutDir> <peak:dir+sample> <peakSample:only sample name>"
		    exit
fi


OutDir=${1} #dir
peak=${2}
peakSample=${3}

##mutiBamSummary

multiBamSummary BED-file --BED ${peak} --bamfiles ${OutDir}/*.bam.sort -p 20 -o ${OutDir}/${peakSample}.npz --outRawCounts ${OutDir}/${peakSample}.tab
