cols_chromHMM <- tibble::tribble(
    ~chromHMM, ~color, ~bedID,
        "Active TSS", "#ff0000", 1, 
        "Promoter Upstream TSS", "#ff4500", 2,
        "Promoter Downstream TSS with DNase", "#ff4500", 3,
        "Promoter Downstream TSS", "#ff4500", 4,
        "Transcription 5'", "#008000", 5,
        "Transcription",  "#008000", 6,
        "Transcription 3'", "#008000", 7,
        "Weak transcription",  "#009600", 8,
        "Transcription Regulatory", "#c2e105", 9,
        "Transcription 5' Enhancer", "#c2e105",10,
        "Transcription 3' Enhancer",  "#c2e105", 11,
        "Transcription Weak Enhancer", "#c2e105", 12,
        "Active Enhancer 1", "#ffc34d", 13,
        "Active Enhancer 2", "#ffc34d", 14,
        "Active Enhancer Flank", "#ffc34d", 15,
        "Weak Enhancer 1", "#ffff00", 16,
        "Weak Enhancer 2",  "#ffff00", 17,
        "Enhancer Acetylation Only", "#ffff00", 18,
        "DNase only", "#ffff66", 19,
        "ZNF genes & repeats", "#66cdaa", 20,
        "Heterochromatin", "#8a91d0", 21,
        "Poised Promoter", "#e6b8b7", 22,
        "Bivalent Promoter",  "#7030a0", 23,
        "Repressed PolyComb","#808080", 24,
        "Quiescent/Low", "#ffffff", 25
)



cols_chromHMM2 <- tibble::tribble(

    ~chromHMM, ~color,
"13_Heterochrom/lo", "245,245,245",
"12_Repressed" , "127,127,127",
"5_Strong_Enhancer", "250,202,0",
"11_Weak_Txn", "153,255,102",
"6_Weak_Enhancer", "255,252,4",
"7_Weak_Enhancer",  "255,252,4",
"10_Txn_Elongation", "0,176,80",
"14_Repetitive/CNV", "245,245,245",
"9_Txn_Transition", "0,176,80",
"1_Active_Promoter", "255,0,0",
"2_Weak_Promoter",  "255,105,105",
"4_Strong_Enhancer",  "250,202,0",
"8_Insulator",  "10,190,254",
"3_Poised_Promoter", "207,11,198",
"15_Repetitive/CNV", "245,245,245"



)


cols_chromHMM3 <- tibble::tribble(

    ~chromHMM, ~color,
"10_Poised_Promoter","207,11,198",
"11_Repressed" , "127,127,127",
"12_Heterochrom", "245,245,245",
"13_Heterochrom", "245,245,245",
"14_Heterochrom", "245,245,245",
"15_Insulator",  "10,190,254",
"1_Txn_Elongation", "0,176,80",
"2_Weak_Txn", "153,255,102",
"4_Poised_Enhancer", "255,252,4",
"5_Active_Promoter", "245,0,0",
"6_Strong_Enhancer",  "250,202,0",
"8_Strong_Enhancer",  "245,0,0",
"9_Strong_Enhancer",  "250,202,0",
"9_Txn_Transition", "0,176,80",
"7_Active_Promoter", "245,0,0"



)


cols_chromHMM2$color <- sapply(strsplit(cols_chromHMM2$color, ","), function(x)
    rgb(x[1], x[2], x[3], maxColorValue=255))


cols_chromHMM3$color <- sapply(strsplit(cols_chromHMM3$color, ","), function(x)
    rgb(x[1], x[2], x[3], maxColorValue=255))
                               


                               
                               
                               
                               
