library(dplyr)
FetchHurricaneData <- function(strHurricaneFile){
  url = "ftp://eclipse.ncdc.noaa.gov/pub/ibtracs/v03r04/wmo/csv/basin/Basin.NA.ibtracs_wmo.v03r04.csv"
  
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

strHurricaneFile <- "data-raw/Hurricane.csv"

if (TRUE) {
  
  df <- FetchHurricaneData(strHurricaneFile)
  
  df <- df[, c("Year", "Number", "Name", "ISO_Time", "Latitude", "Longitude"
               , "Wind", "Pressure")]
  
  write.csv(df, file = strHurricaneFile, row.names = FALSE)
}

Hurricane <- readr::read_csv(strHurricaneFile, col_types = "iicTdddd") %>% 
  filter(Year > 1970)

save(Hurricane, file = "./data/Hurricane.rda", compress = "xz")
