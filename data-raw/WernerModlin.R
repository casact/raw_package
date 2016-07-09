library(dplyr)
PPA_RateChange <- readr::read_csv("data-raw/wmRateChange.csv", col_types = "cDd") %>% 
  arrange(RateGroup) %>% 
  mutate(RateLevelIndex = 1 + RateChange
         , RateLevelIndex = ifelse(is.na(RateLevelIndex), 1, RateLevelIndex)
         , CumulativeRateLevel = cumprod(RateLevelIndex))

PPA_AccidentYear <- readr::read_csv("data-raw/wmAccYear.csv", col_types = "iddd")

PPA_PremiumTrend <- readr::read_csv("data-raw/wmPremiumTrend.csv", col_types = "Ddd")

PPA_LossDevelopment <- readr::read_csv("data-raw/wmLossDevelopment.csv", col_types = "iid")

PPA_LossTrend <- readr::read_csv("data-raw/wmLossTrend.csv", col_types = "Dddd") %>% 
  mutate(Frequency = ClosedClaimCount / EarnedExposure
         , Severity = PaidLosses / ClosedClaimCount
         , PurePremium = PaidLosses / EarnedExposure)

PPA_ULAE <- readr::read_csv("data-raw/wmULAE.csv", col_types = "idd") %>% 
  mutate(ULAE_Ratio = PaidULAE / PaidLoss_ALAE)

save(PPA_RateChange
     , PPA_AccidentYear
     , PPA_LossTrend
     , PPA_PremiumTrend
     , PPA_LossDevelopment
     , PPA_ULAE
     , file = "./data/PPA.rdata", compress = "xz")
