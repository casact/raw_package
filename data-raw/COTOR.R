library(readxl)
library(reshape2)

strCOTOR2 <- "./data-raw/COTORChallenge2Claims.xls"
strCOTOR3 <- "./data-raw/COTORChallenge3Claims.xls"
strCOTOR4 <- "./data-raw/ChallengeRound4data.xls"
strCOTOR5 <- "./data-raw/ChallengeRound5data.xls"

COTOR2 <- read_excel(strCOTOR2, sheet = 1)
names(COTOR2) <- "Claim"
save(COTOR2, file = "./data/COTOR2.rdata", compress = "xz")

COTOR3 <- read_excel(strCOTOR3, sheet = 1, skip = 1)
names(COTOR3) <- 1:7
COTOR3$ClaimNumber <- as.character(row.names(COTOR3))
COTOR3 <- melt(COTOR3, id.vars = "ClaimNumber", variable.name = "Year"
               , value.name = "Amount")

save(COTOR3, file = "./data/COTOR3.rdata", compress = "xz")

COTOR4 <- read_excel(strCOTOR4, sheet = "Sheet1", skip = 13)
names(COTOR4) <- c("ClaimNumber", 1:5)

COTOR4 <- melt(COTOR4, id.vars = "ClaimNumber", variable.name = "Year"
               , value.name = "Amount")

save(COTOR4, file = "./data/COTOR4.rdata", compress = "xz")

COTOR5 <- read_excel(strCOTOR5, sheet = "Round5")

save(COTOR5, file = "./data/COTOR5.rdata", compress = "xz")
