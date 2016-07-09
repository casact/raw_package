library(dplyr)
source("./data-raw/CAS_reserves.R")

NJM_WC <- FetchDataSet("wkcomp")

names(NJM_WC) <- NewColnames

NJM_WC <- NJM_WC %>% 
  filter(GroupCode == 7080)

save(NJM_WC
     , file = "./data/NJ_WCM.rda"
     , compress = "xz")
