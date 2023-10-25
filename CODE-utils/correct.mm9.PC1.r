setwd("/lustre/user/liclab/jialm/Project/RYBP/PC1.juicer")
library(data.table)


###########-----------CTCFKO------------__###########

WT.100kb.list <- dir("./allWT.hind3.allValidPairs.hic/")
WT.100kb.list <- WT.100kb.list[c(1,12,13,14,15,16,17,18,19,2,3,4,5,6,7,8,9,10,11,20)]
WT.100kb <- lapply(paste0("./allWT.hind3.allValidPairs.hic/",WT.100kb.list),fread)
KO.100kb.list <- dir("./KO.hind3.allValidPairs.hic/")
KO.100kb.list <- KO.100kb.list[c(1,12,13,14,15,16,17,18,19,2,3,4,5,6,7,8,9,10,11,20)]
KO.100kb <- lapply(paste0("./KO.hind3.allValidPairs.hic/",KO.100kb.list),fread)

chromsome <- paste0("chr",c(1:19,"X"))

xgi.100kb <-fread("../allWT.hind3_100000_abs.bed")
xgi.100kb <- xgi.100kb[xgi.100kb$V1 != "chrY",]
xgi.100kb <- xgi.100kb[xgi.100kb$V1 != "chrM",]

unlist(lapply(1:20,function(idx){
       dim(WT.100kb[[idx]])[1]}))

unlist(lapply(1:20,function(idx){
  dim(KO.100kb[[idx]])[1]}))

unlist(lapply(1:20,function(idx){
  dim(xgi.100kb[xgi.100kb$V1 ==chromsome[idx]])[1]
}))

xgi.100kb$PC1.WT <- unlist(lapply(1:20,function(idx){
  WT.100kb[[idx]]$V1}))

xgi.100kb$PC1.KO <- unlist(lapply(1:20,function(idx){
  KO.100kb[[idx]]$V1}))


####correct----------##########

library(Mus.musculus)
library(TxDb.Mmusculus.UCSC.mm9.knownGene)
genes = genes(TxDb.Mmusculus.UCSC.mm9.knownGene)
windows = makeGRangesFromDataFrame(xgi.100kb,seqnames.field = "V1",start.field = "V2",end.field = "V3",keep.extra.columns = T)
windows$totgenes = countOverlaps(windows, genes)
windows <- data.frame(windows)
windows.backup <- windows

###### correct PC1 by gene density
windows[windows$PC1.WT=="NaN",7] <- 0
windows[windows$PC1.KO=="NaN",8] <- 0

for(i in 1:20){
  if(mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.WT <0)),9]) <= mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.WT >=0)),9])){
    windows[(windows$seqnames==chromsome[i]),7] <- windows[(windows$seqnames==chromsome[i]),7]
  }else{
    windows[(windows$seqnames==chromsome[i]),7] <- -windows[(windows$seqnames==chromsome[i]),7] 
    
  }
}
for(i in 1:20){
  if(mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.KO <0)),9]) <= mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.KO >=0)),9])){
    windows[(windows$seqnames==chromsome[i]),8] <- windows[(windows$seqnames==chromsome[i]),8]
  }else{
    windows[(windows$seqnames==chromsome[i]),8] <- -windows[(windows$seqnames==chromsome[i]),8]  
  }
}

write.table(windows, file ="../PC1.juicer.corrected/CTCFWT-KO.100kb.hic.pc1.txt", row.names = F, 
            col.names = T, quote = F, sep = "\t")
write.table(windows, file ="../PC1.juicer.corrected/CTCFWT-KO.100kb.hic.pc1.noheader", row.names = F, 
            col.names = F, quote = F, sep = "\t")

windows <- as.data.frame(fread("../PC1.juicer.corrected/CTCFWT-KO.100kb.hic.pc1.txt",header = T))

layout(matrix(c(1,2),2,1,byrow=TRUE))
par(mar=c(0,0.1,0.5,0.1)) #bottom, left, top, right
barplot(windows[windows$seqnames=="chr8",7],border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr8",7]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.07))
rect(60000000/100000,-0.05,115000000/100000,0.05)

barplot(windows[windows$seqnames=="chr8",8],xaxt = "n",yaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr8",8]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.07))

layout(matrix(c(1,2),2,1,byrow=TRUE))
par(mar=c(0.1,2,0.5,1)) #bottom, left, top, right
barplot(windows[windows$seqnames=="chr17",7],xaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr17",7]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.05))
#rect(connected[connected$V1=="chr2",2]/100000,0,connected[connected$V1=="chr2",3]/100000,0.05)
#abline(h=0.04,lty=2)
#abline(h=-0.04,lty=2)
barplot(windows[windows$seqnames=="chr17",8],xaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr17",8]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.05))
rect(4100000/100000,-0.05,6400000/100000,0.05) #xleft, ybottom, xright, ytop
#abline(h=0.04,lty=2)
#abline(h=-0.04,lty=2)


#########--------------RYBPKO-----------##########

WT.100kb.list <- dir("./S137-all.allValidPairs.hic/")
WT.100kb.list <- WT.100kb.list[c(1,12,13,14,15,16,17,18,19,2,3,4,5,6,7,8,9,10,11,20)]
WT.100kb <- lapply(paste0("./S137-all.allValidPairs.hic/",WT.100kb.list),fread)
KO.100kb.list <- dir("./S138-all.allValidPairs.hic/")
KO.100kb.list <- KO.100kb.list[c(1,12,13,14,15,16,17,18,19,2,3,4,5,6,7,8,9,10,11,20)]
KO.100kb <- lapply(paste0("./S138-all.allValidPairs.hic/",KO.100kb.list),fread)

chromsome <- paste0("chr",c(1:19,"X"))

xgi.100kb <-fread("../allWT.hind3_100000_abs.bed")
xgi.100kb <- xgi.100kb[xgi.100kb$V1 != "chrY",]
xgi.100kb <- xgi.100kb[xgi.100kb$V1 != "chrM",]

unlist(lapply(1:20,function(idx){
  dim(WT.100kb[[idx]])[1]}))

unlist(lapply(1:20,function(idx){
  dim(KO.100kb[[idx]])[1]}))

unlist(lapply(1:20,function(idx){
  dim(xgi.100kb[xgi.100kb$V1 ==chromsome[idx]])[1]
}))

xgi.100kb$PC1.WT <- unlist(lapply(1:20,function(idx){
  WT.100kb[[idx]]$V1}))

xgi.100kb$PC1.KO <- unlist(lapply(1:20,function(idx){
  KO.100kb[[idx]]$V1}))


####correct----------##########

library(Mus.musculus)
library(TxDb.Mmusculus.UCSC.mm9.knownGene)
genes = genes(TxDb.Mmusculus.UCSC.mm9.knownGene)
windows = makeGRangesFromDataFrame(xgi.100kb,seqnames.field = "V1",start.field = "V2",end.field = "V3",keep.extra.columns = T)
windows$totgenes = countOverlaps(windows, genes)
windows <- data.frame(windows)
windows.backup <- windows

###### correct PC1 by gene density
windows[windows$PC1.WT=="NaN",7] <- 0
windows[windows$PC1.KO=="NaN",8] <- 0

for(i in 1:20){
  if(mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.WT <0)),9]) <= mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.WT >=0)),9])){
    windows[(windows$seqnames==chromsome[i]),7] <- windows[(windows$seqnames==chromsome[i]),7]
  }else{
    windows[(windows$seqnames==chromsome[i]),7] <- -windows[(windows$seqnames==chromsome[i]),7] 
    
  }
}
for(i in 1:20){
  if(mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.KO <0)),9]) <= mean(windows[((windows$seqnames==chromsome[i])&(windows$PC1.KO >=0)),9])){
    windows[(windows$seqnames==chromsome[i]),8] <- windows[(windows$seqnames==chromsome[i]),8]
  }else{
    windows[(windows$seqnames==chromsome[i]),8] <- -windows[(windows$seqnames==chromsome[i]),8]  
  }
}

write.table(windows, file ="../PC1.juicer.corrected/RYBOWT-KO.100kb.hic.pc1.txt", row.names = F, 
            col.names = T, quote = F, sep = "\t")
write.table(windows, file ="../PC1.juicer.corrected/RYBPWT-KO.100kb.hic.pc1.noheader", row.names = F, 
            col.names = F, quote = F, sep = "\t")


layout(matrix(c(1,2),2,1,byrow=TRUE))
par(mar=c(0,0.1,0.5,0.1)) #bottom, left, top, right
barplot(windows[windows$seqnames=="chr2",7],xaxt = "n",yaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr2",7]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.07),xlim=c(80000000/100000,135000000/100000))
barplot(windows[windows$seqnames=="chr2",8],xaxt = "n",yaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr2",8]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.07),xlim=c(80000000/100000,135000000/100000))


layout(matrix(c(1,2),2,1,byrow=TRUE))
par(mar=c(0.1,2,0.5,1)) #bottom, left, top, right
barplot(windows[windows$seqnames=="chr2",7],xaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr2",7]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.05))
#abline(h=0.04,lty=2)
#abline(h=-0.04,lty=2)
barplot(windows[windows$seqnames=="chr2",8],xaxt = "n",border = NA, space =0,col = ifelse(windows[windows$seqnames=="chr2",8]>=0, 'red3', 'blue1')
        ,ylim=c(-0.05,0.05))
#abline(h=0.04,lty=2)
#abline(h=-0.04,lty=2)


allA <- windows[(windows$PC1.WT >=0 & windows$PC1.KO >=0),]
smoothScatter(allA$PC1.WT,allA$PC1.KO)
abline(a=0,b=1)
boxplot(allA$PC1.WT,allA$PC1.KO)
cor(windows$PC1.WT,windows$PC1.KO)


