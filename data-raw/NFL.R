strNFLfile <- "data-raw/NFL.csv"

NFL <- readr::read_csv(strNFLfile)
NFL = subset(NFL, Home==TRUE)
NFL <- subset(NFL, GameDate >= as.Date("1995-01-01"))

save(NFL, file = "./data/NFL.rdata", compress = "xz")
