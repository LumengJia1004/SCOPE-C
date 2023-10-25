suppressPackageStartupMessages({
    library(dplyr)
    library(GenomicInteractions)
    library(GenomicRanges)
    #library(patchwork)
    #library(ggplot2)
    library(scales)
    #library(pheatmap)
    library(tidyverse)
    library(rtracklayer)
})


calculate_cutoff <- function(inputVector, drawPlot=TRUE,...){
 	inputVector <- sort(inputVector)
	inputVector[inputVector<0]<-0 #set those regions with more control than ranking equal to zero
	slope <- (max(inputVector)-min(inputVector))/length(inputVector) #This is the slope of the line we want to slide. This is the diagonal.
	xPt <- floor(optimize(numPts_below_line,lower=1,upper=length(inputVector),myVector= inputVector,slope=slope)$minimum) #Find the x-axis point where a line passing through that point has the minimum number of points below it. (ie. tangent)
	y_cutoff <- inputVector[xPt] #The y-value at this x point. This is our cutoff.
	b <- y_cutoff-(slope* xPt)
	if(drawPlot){  #if TRUE, draw the plot
		plot(1:length(inputVector),inputVector,type="p",pch=20,lwd=.75,xlab="rank",ylab="sum(-log10Pvalue)")
		b <- y_cutoff-(slope* xPt)
		abline(v= xPt,h= y_cutoff,lty=2,col=8,lwd=1.5)
		points(xPt,y_cutoff,pch=20,cex=1.5,col=2)
		abline(coef=c(b,slope),col=2,lwd=.75)
		title(paste("x=",xPt,"\ny=",signif(y_cutoff,3),sep=""))
		axis(1,sum(inputVector==0),sum(inputVector==0),col.axis="pink",col="pink") #Number of regions with zero signal
	}
	return(list(absolute=y_cutoff,
                overMedian=y_cutoff/median(inputVector),
                overMean=y_cutoff/mean(inputVector),
                y_cutoff=y_cutoff,
                xPt=xPt,
                slope=slope,
                b=b))
}

numPts_below_line <- function(myVector,slope,x){
	yPt <- myVector[x]
	b <- yPt-(slope*x)
	xPts <- 1:length(myVector)
	return(sum(myVector<=(xPts*slope+b)))
}

countOverlapBases <- function(gr_query, gr_ref_list) {
    overlap_bases <- lapply(gr_ref_list, function(gr) sum(width(intersect(gr_query, gr))))
    bind_cols(overlap_bases) %>% gather(key = "chromHMM", value = "basepairs") 
}

annotate_anchor <- function(anchor, chromHMM.list,...) {
    a <- anchor %>% distinct() 
    giobject <- GenomicInteractions(makeGRangesFromDataFrame(a, keep.extra.columns = T), 
                                    makeGRangesFromDataFrame(a, keep.extra.columns = T), 
                                    counts = 1)
    annotateInteractions(giobject, chromHMM.list)   
    res <- giobject@regions %>% as.data.frame() %>% select(seqnames,start,end,node.class)
    return(res)
}


summarise_chromHMM <- function(resfromAnnotateAnchor,levels) {
    count_chromHMM <- resfromAnnotateAnchor %>% 
    group_by(node.class) %>% 
    summarise(Count=n()) %>% 
    mutate(Freq = Count / sum(Count) * 100,
           ChromHMM=factor(node.class,levels=levels)) %>%
    select(ChromHMM,Count,Freq)
    return(count_chromHMM)
}