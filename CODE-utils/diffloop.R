#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
Indir=args[1]
sample=args[2] # end up with .filt.intra
Outdir=args[3]



#cat(Indir, "\n")
#cat(sample, "\n")
#cat(Outdir, "\n")
suppressMessages(suppressWarnings(library(diffloop)))



s <- loopsMake(Indir, samples = sample, mergegap = 0)

sampleNames(s) <- sample
mango_filt_df <- summary(mangoCorrection(s,nbins=10))
df_filt <- mango_filt_df[,c(1,2,3,4,5,6,7,9)]
s <- rmchr(s)
col <- mango_filt_df[,9] < 0.01
col[col] <- "none"
col[col=="FALSE"] <- "ns"
s@rowData$loop.type <- col
#saveRDS(s, file = paste0(outdir, "/", sample, "-HiChIP.rds"))
write.table(df_filt, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE,
file = paste0(Outdir,"/",sample,".interactions.all.mango")
