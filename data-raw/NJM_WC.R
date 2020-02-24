# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

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
