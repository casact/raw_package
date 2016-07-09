library(xlsx)
library(reshape2)

strCOTOR2 <- "./data-raw/COTORChallenge2Claims.xls"
strCOTOR3 <- "./data-raw/COTORChallenge3Claims.xls"
strCOTOR4 <- "./data-raw/ChallengeRound4data.xls"
strCOTOR5 <- "./data-raw/ChallengeRound5data.xls"

COTOR2 <- read.xlsx(strCOTOR2, sheetIndex = 1, startRow = 2, endRow = 251)
COTOR2 <- COTOR2[, 1]
save(COTOR2, file = "./data/COTOR2.rdata", compress = "xz")

COTOR3 <- read.xlsx(strCOTOR3, sheetIndex = 1, startRow = 3, endRow = 72)
names(COTOR3) <- 1:7
COTOR3$ClaimNumber <- as.character(row.names(COTOR3))
COTOR3 <- melt(COTOR3, id.vars = "ClaimNumber", variable.name = "Year"
               , value.name = "Amount")

save(COTOR3, file = "./data/COTOR3.rdata", compress = "xz")

COTOR4 <- read.xlsx(strCOTOR4, sheetName = "Sheet1", startRow = 14, endRow = 514)
names(COTOR4) <- c("ClaimNumber", 1:5)

COTOR4 <- melt(COTOR4, id.vars = "ClaimNumber", variable.name = "Year"
               , value.name = "Amount")

save(COTOR4, file = "./data/COTOR4.rdata", compress = "xz")

COTOR5 <- read.xlsx(strCOTOR5, sheetName = "Round5", startRow = 1, endRow = 4850, colIndex = 1:4)

save(COTOR5, file = "./data/COTOR5.rdata", compress = "xz")
