library(dplyr)
source("./data-raw/CAS_reserves.R")

lstSets <- lapply(datasets, FetchDataSet)
names(lstSets) <- datasets
mapply(lstSets, names(lstSets), FUN = SaveDataSet)

load("./data/ppauto.rda")
dfPPA <- ppauto

load("./data/wkcomp.rda")
dfWC = wkcomp

rm(ppauto, wkcomp)

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