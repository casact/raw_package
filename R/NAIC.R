#' MultiTri
#' 
#' @name MultiTri
#' 
#' @description 
#' 
#' Complete triangle of losses for the same 4 private passenger auto and workers comp companies. Data is taken from the CAS.
#' 
#' \itemize{
#'    \item GroupCode: NAIC company code
#'    \item Company 
#'    \item AccidentYear
#'    \item DevelopmentYear
#'    \item Lag: Integer indicating the development lag in years.
#'    \item CumulativeIncurred
#'    \item CumulativePaid
#'    \item IBNR: Bulk and IBNR reserves
#'    \item DirectEP: Direct and assumed earned premium, gross of reinsurance.
#'    \item CededEP: Earned premium ceded to reinsurers.
#'    \item NetEP: Premium earned net of reinsurance.
#'    \item Single: Either 1 or 0. 1 indicates a single entity, 0 indicates a group entity.
#'    \item Reserve1997: Posted reserves as of year-end 1997.
#' }
#' 
#' @source \url{http://www.casact.org/research/reserve_data/ppauto_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/wkcomp_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/othliab_pos.csv}
#' @docType data
#' 
#' @seealso \code{\link{NAIC}}
#' 
NULL

#' NAIC
#' 
#' @name NAIC
#' @description 
#' 
#' This data represents ten complete years of Schedule P development many NAIC reporting companies. The data was
#' prepared by Glenn Meyers and Peng Shi and is available from the CAS \href{http://www.casact.org/research/index.cfm?fa=loss_reserves_data}{http://www.casact.org/research/index.cfm?fa=loss_reserves_data}.
#' 
#' NOte that the columns have been given more user friendly names. The original column names may be restored by using the CasColNames function.
#' 
#' \itemize{
#'    \item GroupCode: NAIC company code
#'    \item Company 
#'    \item AccidentYear
#'    \item DevelopmentYear
#'    \item Lag: Integer indicating the development lag in years.
#'    \item CumulativeIncurred
#'    \item CumulativePaid
#'    \item IBNR: Bulk and IBNR reserves
#'    \item DirectEP: Direct and assumed earned premium, gross of reinsurance.
#'    \item CededEP: Earned premium ceded to reinsurers.
#'    \item NetEP: Premium earned net of reinsurance.
#'    \item Single: Either 1 or 0. 1 indicates a single entity, 0 indicates a group entity.
#'    \item Reserve1997: Posted reserves as of year-end 1997.
#' }
#'
#' 
#' @source \url{http://www.casact.org/research/reserve_data/ppauto_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/wkcomp_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/comauto_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/medmal_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/prodliab_pos.csv}
#' @source \url{http://www.casact.org/research/reserve_data/othliab_pos.csv}
#' @docType data
#' 
#' @aliases ppauto wkcomp comauto medmal othliab prodliab
NULL
