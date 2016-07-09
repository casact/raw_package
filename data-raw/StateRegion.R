library(reshape2)

ConstructStateData <- function(strStateDataFile, strRegionDataFile){
  
  set.seed(1234)
  data(state)
  
  # Write state data
  dfState = as.data.frame(cbind(state.abb, state.name, state.x77, as.character(state.division), as.character(state.region)))
  colnames(dfState)[1:2] = c("Postal", "Fullname")
  colnames(dfState)[11:12] = c("Division", "Region")
  # dfState$Postal = tolower(dfState$Postal)
  # dfState$Fullname = tolower(dfState$Fullname)
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
  
  dfRegion = df[, c("Region", "PolicyYear", "NumPolicies", "NumClaims")]
  
  mdf = melt(dfRegion, id.vars = c("Region", "PolicyYear"))
  dfRegion = dcast(mdf, Region + PolicyYear ~ variable, sum)
  
  write.csv(df, strStateDataFile, row.names = FALSE)
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
