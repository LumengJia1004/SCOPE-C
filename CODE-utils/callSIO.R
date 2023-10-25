#####---------This script is used to call SIO----------########
setwd("/lustre/user/liclab/jialm/Project/SCOPEC/utils/")

suppressPackageStartupMessages({
    library(dplyr)
    library(GenomicRanges)
    library(scales)
    library(tidyverse)
    library(rtracklayer)
})

source("./myFunction.R")

callSIOformBulk <- function(loops,Counts,Pvalue,DE,exportAnchors,exportSIOopen,...){
Loops <- loops
DEcoverage <- DE
colnames(Loops) <- c("chrom1","start1","end1","chrom2","start2","end2","counts","P")
Loops <- Loops %>% mutate(LT=case_when(counts >= Counts & P<=Pvalue ~ "sig",
                                       counts < Counts | P > Pvalue ~ "putative"))    ## LT stand for Loop TypesA1 <- Loops[,c(1:3,7,8,9)]

A1 <- Loops[,c(1:3,7,8,9)]
names(A1) <- c("seqnames","start","end","counts","P","LT")  
A2 <- Loops[,c(4:6,7,8,9)]
names(A2) <- c("seqnames","start","end","counts","P","LT")

Anchor <- rbind(A1,A2) %>% distinct()

Anchor_Interactive <- Anchor %>% 
                      mutate(logP = case_when(P>0~-log10(P),
                                              P==0~0),
                             logP = case_when(logP >0 ~ logP,
                                              logP ==0 ~max(logP))) %>% 
                      group_by(seqnames,start,end,LT) %>% 
    summarise(Interactive=sum(logP)/(end-start)*1000) %>% 
    as.data.frame() %>% 
    distinct()

cutI=calculate_cutoff(Anchor_Interactive %>% filter(LT=="sig") %>% .$Interactive,drawPlot =FALSE)$absolute 

## clean DEcoverage
colnames(DEcoverage) <- c("seqnames","start","end","counts")
DEcoverage <- DEcoverage %>% mutate(Openness=counts/(end-start)*1000) 
Anchor.Openess.interactive <- dplyr::right_join(Anchor_Interactive %>% filter(LT=="sig"),DEcoverage) %>% 
mutate(Interactive=case_when(is.na(Interactive) ~ 0,
                            !is.na(Interactive) ~ Interactive),
       Group=case_when(is.na(LT) ~ "peak",
                       !is.na(LT) ~ LT)) %>% select(-LT)
### glm
G <- glm(Anchor.Openess.interactive$Openness ~ Anchor.Openess.interactive$Interactive)
sum=summary(G)
Intercept = sum$coefficients[1,1] 
ab = sum$coefficients[2,1] 

anchor.markSIO <- Anchor.Openess.interactive %>% 
mutate(y.th=(ab*Interactive + Intercept)) %>% 
mutate(Class=case_when(Openness >= y.th ~ "open",
                       Openness < y.th ~ "close"),
       LoopGroup=case_when(Group=="peak" ~ "peak",
                           Group != "peak" & Interactive >= cutI ~ "SIO",
                           Group != "peak" & Interactive < cutI ~ "IO")) 
    
SIO.open <- anchor.markSIO %>% 
filter(LoopGroup=="SIO",Class=="open")   
       
write.table(anchor.markSIO,exportAnchors,col.names = T,row.names = F,sep="\t",quote=F)      
write.table(SIO.open,exportSIOopen,col.names = T,row.names = F,sep="\t",quote=F)      

return(anchor.markSIO)
}


callSIOformMiniBulk <- function(loops,Counts,Pvalue,DE,exportAnchors,exportSIOopen,...){

print("sigloop is just used for counts, not used for SIO calling")

Loops <- loops
DEcoverage <- DE

colnames(Loops) <- c("chrom1","start1","end1","chrom2","start2","end2","counts","P")
Loops <- Loops %>% mutate(LT=case_when(counts >= Counts & P<=Pvalue ~ "sig",
                                       counts < Counts | P > Pvalue ~ "putative"))    ## LT stand for Loop TypesA1 <- Loops[,c(1:3,7,8,9)]
A1 <- Loops[,c(1:3,7,8,9)]
names(A1) <- c("seqnames","start","end","counts","P","LT")  
A2 <- Loops[,c(4:6,7,8,9)]
names(A2) <- c("seqnames","start","end","counts","P","LT")

Anchor <- rbind(A1,A2) %>% distinct()

Anchor_Interactive <- Anchor %>% 
                      mutate(logP = case_when(P>0~-log10(P),
                                              P==0~0),
                             logP = case_when(logP >0 ~ logP,
                                              logP ==0 ~max(logP))) %>% 
                      group_by(seqnames,start,end) %>% 
    summarise(Interactive=sum(logP)/(end-start)*1000) %>% 
    as.data.frame() %>% 
    distinct()

cutI=calculate_cutoff(Anchor_Interactive %>% .$Interactive,drawPlot =FALSE)$absolute 

## clean DEcoverage
colnames(DEcoverage) <- c("seqnames","start","end","counts")
DEcoverage <- DEcoverage %>% mutate(Openness=counts/(end-start)*1000) 
Anchor.Openess.interactive <- dplyr::right_join(Anchor_Interactive,DEcoverage) %>% 
mutate(Interactive=case_when(is.na(Interactive) ~ 0,
                            !is.na(Interactive) ~ Interactive),
       Group=case_when(is.na(LT) ~ "peak",
                       !is.na(LT) ~ LT)) %>% select(-LT)
### glm
G <- glm(Anchor.Openess.interactive$Openness ~ Anchor.Openess.interactive$Interactive)
sum=summary(G)
Intercept = sum$coefficients[1,1] 
ab = sum$coefficients[2,1] 

anchor.markSIO <- Anchor.Openess.interactive %>% 
mutate(y.th=(ab*Interactive + Intercept)) %>% 
mutate(Class=case_when(Openness >= y.th ~ "open",
                       Openness < y.th ~ "close"),
       LoopGroup=case_when(Group=="peak" ~ "peak",
                           Group != "peak" & Interactive >= cutI ~ "SIO",
                           Group != "peak" & Interactive < cutI ~ "IO")) 
    
SIO.open <- anchor.markSIO %>% 
filter(LoopGroup=="SIO",Class=="open")

  
write.table(anchor.markSIO,exportAnchors,col.names = T,row.names = F,sep="\t",quote=F)      
write.table(SIO.open,exportSIOopen,col.names = T,row.names = F,sep="\t",quote=F)      

return(anchor.markSIO)
}
