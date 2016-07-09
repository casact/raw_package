PPA_RateChange <- read.csv("data-raw/wmARateChange.csv")
PPA_AccidentYear <- read.csv("data-raw/wmAaccYear.csv")
PPA_LossTrend <- read.csv("data-raw/wmALossTrend.csv")
PPA_PremiumTrend <- read.csv("data-raw/wmAPremiumTrend.csv")
PPA_LossDevelopment <- read.csv("data-raw/wmALossDevelopment.csv")
PPA_ULAE <- read.csv("data-raw/wmAULAE.csv")

save(PPA_RateChange, PPA_AccidentYear, PPA_LossTrend, PPA_PremiumTrend, PPA_LossDevelopment, PPA_ULAE
     , file = "./data/PPA.rdata", compress = "xz")
