
CN.chromHMM_file = "/lustre/user/liclab/jialm/Project/SCOPEC/pastAnalysis/SIO/chromHMM/CN.mm10.cuizj.15seg.chromHMM"
NPC.chromHMM_file = "/lustre/user/liclab/jialm/Project/SCOPEC/pastAnalysis/SIO/chromHMM/NPC.mm10.cuizj.15seg.chromHMM"
ESC.chromHMM_file = "/lustre/user/liclab/jialm/Project/SCOPEC/pastAnalysis/SIO/chromHMM/mESC.mm10.cuizj.15seg.chromHMM"

ESC.chromHMM <- readr::read_tsv(ESC.chromHMM_file, col_names=F)
NPC.chromHMM <- readr::read_tsv(NPC.chromHMM_file, col_names=F)
CN.chromHMM <- readr::read_tsv(CN.chromHMM_file, col_names=F)

colnames(ESC.chromHMM) <- c("chrom","start","end","state")
colnames(NPC.chromHMM) <- c("chrom","start","end","state")
colnames(CN.chromHMM) <- c("chrom","start","end","state")

ESC.chromHMM <- ESC.chromHMM %>% mutate(state=case_when(
                                    state=="E4" ~ "active promoter",
                                    state=="E5" ~ "weak promoter",
                                    state=="E6" ~ "bivalent promoter",
                                    state=="E2" ~ "strong enhancer 1",
                                    state=="E3" ~ "strong enhancer 2",
                                    state=="E1" ~ "weak enhancer 1",
                                    state=="E7" ~ "weak enhancer 2",
                                    state=="E8" ~ "weak enhancer 3",
                                    state=="E12" ~ "insulator",
                                    state=="E15" ~ "transition",
                                    state=="E14" ~ "elongation",
                                    state=="E13" ~ "weak_txn",
                                    state=="E10" ~ "repress",
                                    state=="E9" ~ "low signal 1",
                                    state=="E11" ~ "low signal 2"))

NPC.chromHMM <- NPC.chromHMM %>% mutate(state=case_when(
                                    state=="E8" ~ "active promoter 1",
                                    state=="E7" ~ "active promoter 2",
                                    state=="E6" ~ "bivalent promoter",
                                    state=="E3" ~ "weak enhancer 1",
                                    state=="E15" ~ "weak enhancer 2",
                                    state=="E4" ~ "poised enhancer",
                                    state=="E14" ~ "Insulator",
                                    state=="E1" ~ "elongation",
                                    state=="E12" ~ "weak_txn",
                                    state=="E5" ~ "repress",
                                    state=="E2" ~ "low signal 1",
                                    state=="E9" ~ "low signal 2",
                                    state=="E13" ~ "ow signal 3",
                                    state=="E10" ~ "heterochromatin",
                                    state=="E11" ~ "repeat"))

CN.chromHMM <- CN.chromHMM %>% mutate(state=case_when(
                                    state=="E6" ~ "active promoter 1",
                                    state=="E8" ~ "active promoter 2",
                                    state=="E7" ~ "bivalent promoter",
                                    state=="E5" ~ "strong enhancer",
                                    state=="E3" ~ "weak enhancer 1",
                                    state=="E4" ~ "weak enhancer 2",
                                    state=="E2" ~ "poised enhancer",
                                    state=="E15" ~ "insulator",
                                    state=="E14" ~ "elongation",
                                    state=="E1" ~ "repress",
                                    state=="E10" ~ "low signal 1",
                                    state=="E11" ~ "low signal 2",
                                    state=="E13" ~ "low signal 3",
                                    state=="E9" ~ "heterochromatin",
                                    state=="E12" ~ "repeat"))
                                    
ESC.chromHMM_frac <- ESC.chromHMM %>% mutate(Length = end - start) %>% group_by(state) %>% 
    mutate(LengthByClass = sum(Length)) %>% ungroup() %>%
    mutate(fraction = LengthByClass/sum(Length)*100) %>%
    distinct(state, LengthByClass, fraction) %>% set_names("chromHMM","base","Freq") %>% mutate(Group="HMM")

NPC.chromHMM_frac <- NPC.chromHMM %>% mutate(Length = end - start) %>% group_by(state) %>% 
    mutate(LengthByClass = sum(Length)) %>% ungroup() %>%
    mutate(fraction = LengthByClass/sum(Length)*100) %>%
    distinct(state, LengthByClass, fraction) %>% set_names("chromHMM","base","Freq") %>% mutate(Group="HMM")

CN.chromHMM_frac <- CN.chromHMM %>% mutate(Length = end - start) %>% group_by(state) %>% 
    mutate(LengthByClass = sum(Length)) %>% ungroup() %>%
    mutate(fraction = LengthByClass/sum(Length)*100) %>%
    distinct(state, LengthByClass, fraction) %>% set_names("chromHMM","base","Freq") %>% mutate(Group="HMM")
    
ESC.chromHMM_gr <- makeGRangesFromDataFrame(ESC.chromHMM,keep.extra.columns = T)
NPC.chromHMM_gr <- makeGRangesFromDataFrame(NPC.chromHMM,keep.extra.columns = T)
CN.chromHMM_gr <- makeGRangesFromDataFrame(CN.chromHMM,keep.extra.columns = T)

ESC.chromHMM_list <- split(ESC.chromHMM_gr, ESC.chromHMM$state)
NPC.chromHMM_list <- split(NPC.chromHMM_gr, NPC.chromHMM$state)
CN.chromHMM_list <- split(CN.chromHMM_gr, CN.chromHMM$state)

ESC.chromHMM_list.list <- list("active promoter"=ESC.chromHMM_list$`active promoter`,
                          "weak promoter"=ESC.chromHMM_list$`weak promoter`,
                          "bivalent promoter"=ESC.chromHMM_list$`bivalent promoter`,
                          "strong enhancer 1"=ESC.chromHMM_list$`strong enhancer 1`,
                          "strong enhancer 2"=ESC.chromHMM_list$`strong enhancer 2`,
                          "weak enhancer 1" =ESC.chromHMM_list$`weak enhancer 1`,
                          "weak enhancer 2"=ESC.chromHMM_list$`weak enhancer 2`,
                          "weak enhancer 3"=ESC.chromHMM_list$`weak enhancer 3`,
                          "insulator"=ESC.chromHMM_list$insulator,
                          "transition"=ESC.chromHMM_list$transition,
                          "elongation"=ESC.chromHMM_list$elongation,
                          "weak_txn"=ESC.chromHMM_list$weak_txn,
                          "repress"=ESC.chromHMM_list$repress,
                          "low signal 1"=ESC.chromHMM_list$`low signal 1`,
                          "low signal 2"=ESC.chromHMM_list$`low signal 2`)

NPC.chromHMM_list.list <- list("active promoter 1"=NPC.chromHMM_list$`active promoter 1`,
                          "active promoter 2"=NPC.chromHMM_list$`active promoter 2`,
                          "bivalent promoter"=NPC.chromHMM_list$`bivalent promoter`,
                          "weak enhancer 1"=NPC.chromHMM_list$`weak enhancer 1`,
                          "weak enhancer 2"=NPC.chromHMM_list$`weak enhancer 2`,
                          "poised enhancer" =NPC.chromHMM_list$`poised enhancer`,
                          "insulator"=NPC.chromHMM_list$`insolutor`,
                          "elongation"=NPC.chromHMM_list$`elongation`,
                          "weak_txn"=NPC.chromHMM_list$`weak_txn`,
                          "repress"=NPC.chromHMM_list$repress,
                          "low signal 1"=NPC.chromHMM_list$`low signal 1`,
                          "low signal 2"=NPC.chromHMM_list$`low signal 2`,
                          "low signal 3"=NPC.chromHMM_list$`low signal 3`,
                          "heterochromatin"=NPC.chromHMM_list$`heterochromatin`,
                          "repeat"=NPC.chromHMM_list$`repeat`)

CN.chromHMM_list.list <- list("active promoter 1"=CN.chromHMM_list$`active promoter 1`,
                          "active promoter 2"=CN.chromHMM_list$`active promoter 2`,
                          "bivalent promoter"=CN.chromHMM_list$`bivalent promoter`,
                          "strong enhancer"=CN.chromHMM_list$`strong enhancer`,
                          "weak enhancer 1"=CN.chromHMM_list$`weak enhancer 1`,
                          "weak enhancer 2"=CN.chromHMM_list$`weak enhancer 2`,
                          "poised enhancer" =CN.chromHMM_list$`poised enhancer`,
                          "insulator"=CN.chromHMM_list$`insolutor`,
                          "elongation"=CN.chromHMM_list$`elongation`,
                          "repress"=CN.chromHMM_list$repress,
                          "low signal 1"=CN.chromHMM_list$`low signal 1`,
                          "low signal 2"=CN.chromHMM_list$`low signal 2`,
                          "low signal 3"=CN.chromHMM_list$`low signal 3`,
                          "heterochromatin"=CN.chromHMM_list$`heterochromatin`,
                          "repeat"=CN.chromHMM_list$`repeat`)
                          
color_Value <- c("active promoter"="#ff0000","active promoter 1"="#ff0000","active promoter 2"="#ff0000","weak promoter"="#e6b8b7","bivalent promoter"="#7030a0",
                            "strong enhancer"="#ffc34d","strong enhancer 1"="#ffc34d","strong enhancer 2"="#ffc34d", 
                            "weak enhancer"="#ffff00","weak enhancer 1"="#ffff00","weak enhancer 2"="#ffff00","weak enhancer 3"="#ffff00", "poised enhancer"="khaki1",
                            "insulator"="deepskyblue",
                            "transition"="#008000","elongation"="#008000","weak_txn"="#c2e105",
                            "repress"="#808080",
                            "low signal 1"="white","low signal 2"="white","low signal 3"="white",
                            "Heterochromatin"="black","repeat"="grey30")