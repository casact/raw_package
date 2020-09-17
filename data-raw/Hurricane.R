# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

library(dplyr)
FetchHurricaneData <- function(url, strHurricaneFile){
  
  download.file(url, destfile = strHurricaneFile)
  
  df = read.csv(strHurricaneFile, skip = 2)
  
  # Adding the names here for clarity's sake. I don't mind knowing what information
  # I'm throwing away.
  names(df) <- c("SerialNumber", "Year", "Number", "Basin", "SubBasin"
                 , "Name", "ISO_Time", "Nature", "Latitude"
                 , "Longitude", "Wind", "Pressure", "Center"
                 , "WindPercentile", "PressurePercentile"
                 , "TrackType")
  
  df
}

url <- "https://www.ncei.noaa.gov/data/international-best-track-archive-for-climate-stewardship-ibtracs/v04r00/access/csv/ibtracs.NA.list.v04r00.csv"
strHurricaneFile <- "data-raw/Hurricane.csv"

if (TRUE) {
  
  df <- FetchHurricaneData(url, strHurricaneFile)
  
  df <- df[, c("Year", "Number", "Name", "ISO_Time", "Latitude", "Longitude"
               , "Wind", "Pressure")]
  
  write.csv(df, file = strHurricaneFile, row.names = FALSE)
}

Hurricane <- readr::read_csv(strHurricaneFile, col_types = "iicTdddd") %>% 
  filter(Year > 1970)

save(Hurricane, file = "./data/Hurricane.rda", compress = "xz")
