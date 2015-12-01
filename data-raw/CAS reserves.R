FetchDataSet <- function(stub){
  URL.stem = "http://www.casact.org/research/reserve_data/"
  URL <- paste0(URL.stem, stub, "_pos.csv")
  df <- read.csv(URL, stringsAsFactors = FALSE)
}

SaveDataSet <- function(df, name){
  assign(name, df)
  filename <- paste0("./data/", name, ".rda")
  save(list=name, file = filename, compress = "xz")
}

datasets <- c("ppauto", "wkcomp", "comauto", "medmal"
              , "prodliab", "othliab")

lstSets <- lapply(datasets, FetchDataSet)
names(lstSets) <- datasets
mapply(lstSets, names(lstSets), FUN = SaveDataSet)
