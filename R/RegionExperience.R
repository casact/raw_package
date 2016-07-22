#' @name StateExperience
#' 
#' @title State data
#' 
#' @seealso\code{\link{RegionExperience}}
#' 
#' @usage 
#' 
#' data(StateExperience)
#' 
#' @description
#' 
#' Random illustrative data
#' 
#' \itemize{
#'    \item Region: The name of the region to which the state belongs
#'    \item State: The name of the state
#'    \item Postal: Two character postal code for the state
#'    \item PolicyYear: An integer between 2001 and 2010.
#'    \item NumPolicies: Integer giving the number of policies in that region for that policy year
#'    \item NumClaims: Integer giving the number of claims in that region for that policy year
#' }
"StateExperience"

#' @name RegionExperience
#' 
#' @title Region data
#' 
#' @description
#' 
#' Consolidation of state data into various regions. The state data was generated randomly as a Poisson sample.
#' 
#' \itemize{
#'  \item Region: The name of the region
#'  \item PolicyYear: An integer between 2001 and 2010
#'  \item NumPolicies: Integer giving the number of policies in that region for that policy year
#'  \item NumClaims: Integer giving the number of claims in that region for that policy year
#' }
#' 
#' @usage 
#' 
#' data(RegionExperience)
#' 
#' @seealso\code{\link{StateExperience}}
"RegionExperience"