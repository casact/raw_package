library(dplyr)

load("./data/wkcomp.rda")
assign("NJM_WC", wkcomp)

# NJM_WC <- FetchDataSet("wkcomp")

# names(NJM_WC) <- NewColnames

NJM_WC <- NJM_WC %>% 
  filter(GroupCode == 7080)

save(NJM_WC
     , file = "./data/NJM_WC.rda"
     , compress = "xz")
