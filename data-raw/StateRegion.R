# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

library(reshape2)
library(dplyr)

ConstructStateData <- function(strStateDataFile, strRegionDataFile){
  
  data(state)
  
  dfStateRegion <- as.data.frame(cbind(as.character(state.region), state.name, state.abb), stringsAsFactors = FALSE)
  names(dfStateRegion) <- c("Region", "State", "Postal")
  
  dfState = as.data.frame(cbind(state.name
                                , state.x77)
                          , stringsAsFactors = FALSE) %>% 
    select(State = state.name
           , Population
           , Illiteracy
           , Murder) %>% 
    mutate(NumPolicies = round(as.numeric(Population) / 100, 0)
           , PolicyGrowth = as.numeric(Illiteracy) / 100
           , Lambda = as.numeric(Murder)) %>% 
    select(-Population, -Illiteracy, -Murder)
  
  row.names(dfState) <- NULL
  
  PolicyYear = 2001:2010
  dfStatePolicy = expand.grid(list(State = dfState$State, PolicyYear = PolicyYear))
  
  set.seed(1234)
  
  dfState <- merge(dfState, dfStatePolicy) %>% 
    group_by(State) %>% 
    arrange(State, PolicyYear) %>% 
    mutate(PolicyGrowth = 1 + PolicyGrowth
           , PolicyGrowth = cumprod(PolicyGrowth)
           , NumPolicies = round(NumPolicies * PolicyGrowth, 0)
           , NumClaims = rpois(length(PolicyYear), NumPolicies * Lambda)) %>% 
    merge(dfStateRegion) %>% 
    select(Region, State, Postal, PolicyYear, NumPolicies, NumClaims)
  
  
  dfRegion <- dfState %>% 
    group_by(Region, PolicyYear) %>% 
    summarise(NumPolicies = sum(NumPolicies)
              , NumClaims = sum(NumClaims))
    
  write.csv(dfState, strStateDataFile, row.names = FALSE)
  write.csv(dfRegion, strRegionDataFile, row.names = FALSE)
  
}

strStateDataFile <- "./data-raw/StateData.csv"
strRegionDataFile <- "./data-raw/RegionData.csv"

if (TRUE){
  ConstructStateData(strStateDataFile, strRegionDataFile)
}

StateExperience <- read.csv(strStateDataFile)
save(StateExperience, file = "./data/StateExperience.rda", compress = "xz")

RegionExperience <- read.csv(strRegionDataFile)
save(RegionExperience, file = "./data/RegionExperience.rda", compress = "xz")
