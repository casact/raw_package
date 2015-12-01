load("./data/ppauto.rda")
dfPPA <- ppauto

load("./data/wkcomp.rda")
dfWC = wkcomp

rm(ppauto, wkcomp)

NewColnames = c("GroupCode"
             , "Company"
             , "AccidentYear"
             , "DevelopmentYear"
             , "Lag"
             , "CumulativeIncurred"
             , "CumulativePaid"
             , "IBNR"
             , "DirectEP"
             , "CededEP"
             , "NetEP"
             , "Single"
             , "Reserve1997")

colnames(dfPPA) = NewColnames
colnames(dfWC) = NewColnames

# Fetch the top 10 insurers
TopPPA = aggregate(dfPPA$NetEP, by=list(dfPPA$Company), sum)
TopPPA = TopPPA[order(TopPPA[,2], decreasing=TRUE), ]
TopPPA = TopPPA[1:20, 1]

TopWC = aggregate(dfWC$NetEP, by=list(dfWC$Company), sum)
TopWC = TopWC[order(TopWC[,2], decreasing=TRUE), ]
TopWC = TopWC[1:20, 1]

companies = intersect(TopWC, TopPPA)
companies = companies[companies != "State Farm Mut Grp"]

rm(TopPPA, TopWC)
dfPPA = subset(dfPPA, Company %in% companies)
dfPPA$Line = "Personal Auto"

dfWC = subset(dfWC, Company %in% companies)
dfWC$Line = "Workers Comp"

save(dfPPA, dfWC, file = "./data/NAIC.rda", compress = "xz")