FetchDataSet <- function(stub){
  URL.stem = "http://www.casact.org/research/reserve_data/"
  URL <- paste0(URL.stem, stub, "_pos.csv")
  df <- readr::read_csv(URL, col_types = "iciiiddddddid")
}

SaveDataSet <- function(df, name){
  assign(name, df)
  filename <- paste0("./data/", name, ".rda")
  save(list=name, file = filename, compress = "xz")
}

datasets <- c("ppauto", "wkcomp", "comauto", "medmal"
              , "prodliab", "othliab")

NewColnames <- c("GroupCode"
                , "Company"
                , "AccidentYear"
                , "DevelopmentYear"
                , "Lag"
                , "CumulativeIncurred"
                , "CumulativePaid"
                , "IBNR"
                , "DirectEP"
                , "CededEP"
                , "NetEP"
                , "Single"
                , "Reserve1997")
