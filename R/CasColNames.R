#' CAS Column Names
#' @name CasColNames
#' 
#' @description This will change the column names of a data frame obtained from the CAS database of reserve triangles. This data was 
#' procured and modified by Glenn G. Meyers and Peng Shi and is hosted by the CAS. More information on the data is available here: 
#' \href{http://www.casact.org/research/index.cfm?fa=loss_reserves_data}{http://www.casact.org/research/index.cfm?fa=loss_reserves_data}
#' 
#' @param df A data frame of loss reserving data
#' @param restore Boolean indicating whether to restore the names defined by Meyers and Shi. The default is true.
#' 
#' @return A data frame with different column names.
#' 
#' @export
#' 
#' @examples 
#' 
#' \dontrun{
#' data(NJM_WC)
#' NJM_WC <- CasColNames(NJM_WC, restore = TRUE)
#' }
#' 
CasColNames <- function(df, restore = TRUE){
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
  OldColnames <- c("GRCODE"
                   , "GRNAME"
                   ,"AccidentYear"
                   , "DevelopmentYear"
                   , "DevelopmentLag"
                   , "IncurLoss_D"
                   , "CumPaidLoss_D"
                   , "BulkLoss_D"
                   , "EarnedPremDIR_D"
                   , "EarnedPremCeded_D"
                   , "EarnedPremNet_D"
                   , "Single"
                   , "PostedReserve97_D")
  
  if (restore){
    names(df) <- OldColnames
  } else {
    names(df) <- NewColnames
  }
  
  df
  
}