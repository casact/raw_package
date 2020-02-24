# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

library(dplyr)

load("./data/ppauto.rda")
dfPPA <- ppauto

load("./data/wkcomp.rda")
dfWC = wkcomp

load("./data/othliab.rda")
dfGL <- othliab

rm(ppauto, wkcomp, othliab)

# colnames(dfPPA) = NewColnames
# colnames(dfWC) = NewColnames
# colnames(dfGL) = NewColnames

TopCompanies <- function(df, numCompany){
  df <- df %>% 
    group_by(Company) %>% 
    summarise(NetEP = sum(NetEP, na.rm = TRUE)) %>% 
    arrange(desc(NetEP)) %>% 
    slice(1:numCompany) %>%
    select(Company) %>%
    unlist()
  
  names(df) <- NULL
  
  df
}

# Fetch the top 10 insurers
TopPPA <- dfPPA %>% 
  TopCompanies(10)

TopWC <- dfWC %>% 
  TopCompanies(10)

TopGL <- dfGL %>%
  TopCompanies(10)

companies = intersect(TopWC, intersect(TopPPA, TopGL))

companies = companies[companies != "State Farm Mut Grp"]

rm(TopPPA, TopWC)

dfPPA$Line = "Personal Auto"
dfWC$Line = "Workers Comp"
dfGL$Line <- "Other Liability"

wc_companies <- unique(dfWC$Company)
ppa_companies <- unique(dfPPA$Company)
gl_companies <- unique(dfGL$Company)

common_companies <- intersect(wc_companies, intersect(ppa_companies, gl_companies))

dfMultiLine <- dplyr::bind_rows(dfWC, dfPPA, dfGL) %>% 
  filter(Company %in% common_companies)

top_companies <- TopCompanies(dfMultiLine, 10) 

MultiTri <- dplyr::bind_rows(dfWC, dfPPA, dfGL) %>% 
  filter(Company %in% top_companies)

save(MultiTri, file = "./data/MultiTri.rda", compress = "xz")
