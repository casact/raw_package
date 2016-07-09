library(readxl)
library(reshape2)

# COTOR2
COTOR2 <- read_excel("./data-raw/COTORChallenge2Claims.xls", sheet = 1)
COTOR2 <- unlist(COTOR2)
names(COTOR2) <- NULL
save(COTOR2, file = "./data/COTOR2.rda", compress = "xz")

#COTOR3
COTOR3 <- read_excel("./data-raw/COTORChallenge3Claims.xls", sheet = 1, skip = 1)
names(COTOR3) <- 1:7
COTOR3 <- tidyr::gather(COTOR3, key = "Year", value = "Amount")
save(COTOR3, file = "./data/COTOR3.rda", compress = "xz")

#COTOR4
COTOR4 <- read_excel("./data-raw/ChallengeRound4data.xls", sheet = "Sheet1", skip = 13)
COTOR4 <- COTOR4[, -1]
names(COTOR4) <- c(1:5)
COTOR4 <- tidyr::gather(COTOR4, key = "Year", value = "Amount")
save(COTOR4, file = "./data/COTOR4.rda", compress = "xz")

#COTOR5
COTOR5 <- read_excel("./data-raw/ChallengeRound5data.xls", sheet = "Round5")
names(COTOR5)[4] <- "Amount"
save(COTOR5, file = "./data/COTOR5.rda", compress = "xz")
