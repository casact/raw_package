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
  
  df <- df[, c("Year", "Number", "Name", "ISO_Time", "Latitude", "Longitude"
               , "Wind")]
  
  write.csv(df, file = strHurricaneFile, row.names = FALSE)
}

ConstructStateData <- function(strStateDataFile, strRegionDataFile){
  data(state)
  
  # Write state data
  dfState = as.data.frame(cbind(state.abb, state.name, state.x77, as.character(state.division), as.character(state.region)))
  colnames(dfState)[1:2] = c("Postal", "Fullname")
  colnames(dfState)[11:12] = c("Division", "Region")
  dfState$Postal = tolower(dfState$Postal)
  dfState$Fullname = tolower(dfState$Fullname)
  dfState$NumPolicies = round(as.numeric(as.character(dfState$Population)) / 100, 0)
  dfState$PolicyGrowth = as.numeric(as.character(dfState$Illiteracy)) / 100
  dfState$Lambda = as.numeric(as.character(dfState$Murder))
  
  PolicyYear = 2000:2010
  df = expand.grid(list(Fullname = dfState$Fullname, PolicyYear = PolicyYear))
  
  df = merge(df, dfState[, c("Postal", "Fullname", "NumPolicies", "PolicyGrowth", "Lambda")])
  
  dfBase = df[df$PolicyYear == 2000, c("Fullname", "NumPolicies")]
  colnames(dfBase)[2] = "BasePolicies"
  
  df = merge(df, dfBase)
  
  df$NumPolicies = round(df$BasePolicies * (1 + df$PolicyGrowth)^(df$PolicyYear - 2000), 0)
  df$NumClaims = rpois(nrow(df), df$NumPolicies * df$Lambda)
  
  df = merge(df, dfState[, c("Fullname", "Region")])
  df  
  
  write.csv(df, strStateDataFile, row.names = FALSE)
  
  dfRegion = df[, c("Region", "PolicyYear", "NumPolicies", "NumClaims")]
  library(reshape2)
  mdf = melt(dfRegion, id.vars = c("Region", "PolicyYear"))
  dfRegion = dcast(mdf, Region + PolicyYear ~ variable, sum)
  
  write.csv(dfRegion, strRegionDataFile, row.names = FALSE)
  
}

if (!file.exists(strHurricaneFile)) FetchHurricaneData(strHurricaneFile)
Hurricane <- read.csv(strHurricaneFile)
save(Hurricane, file = "./data/Hurricane.rdata", compress = "xz")

if (!file.exists(strStateDataFile) | !file.exists(strRegionDataFile)) 
  ConstructStateData(strStateDataFile, strRegionDataFile)

strHurricaneFile <- "data-raw/Hurricane.csv"
strNFLfile <- "data-raw/NFL.csv"
strStateDataFile <- "data-raw/StateData.csv"
strRegionDataFile <- "./data-raw/RegionData.csv"

StateExperience <- read.csv(strStateDataFile)
save(StateExperience, file = "./data/StateExperience.rdata", compress = "xz")

RegionExperience <- read.csv(strRegionDataFile)
save(RegionExperience, file = "./data/RegionExperience.rdata", compress = "xz")

NFL <- read.csv(strNFLfile)
NFL = subset(NFL, Home==TRUE)
save(NFL, file = "./data/NFL.rdata", compress = "xz")
