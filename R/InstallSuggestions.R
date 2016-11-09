#' InstallSuggestions
#' @name InstallSuggestions
#' 
#' @description This function will install the full set of suggested packages.
#' 
#' @return A character vector indicating which packages were installled.
#' 
#' @param ... Arguments to be passed to install.packages.
#' 
#' @importFrom utils install.packages
#' 
#' @export
#' 
#' @examples 
#' 
#' \dontrun{
#'   InstallSuggestions()
#' }
#' 
InstallSuggestions <- function (...){
  strSuggestions <- c("dplyr", "tidyr", "ggplot2", "lubridate"
                      , "devtools", "actuar", "ChainLadder"
                      , "knitr", "readr", "readxl", "rmarkdown"
                      , "mondate", "FinCal", "rstan", "scales"
                      , "nlme", "maps")
  
  message("Installing suggested packages. This may take a while.")
  
  alreadyInstalled <- PackageIsInstalled(strSuggestions)
  needsUpdate <- PackageNeedsUpdating(strSuggestions)

  pkgUpToDate <- strSuggestions[alreadyInstalled & !needsUpdate]
  pkgNeedsUpdate <- strSuggestions[alreadyInstalled & needsUpdate]
  pkgNeedsInstallation <- strSuggestions[!alreadyInstalled]
  
  if (length(pkgUpToDate) != 0) {
    strMessage <- paste0("The following packages are already installed and up to date: \n"
                         , paste(pkgUpToDate, collapse = ", \n"))
    message(strMessage)
  }
  
  if (length(pkgNeedsUpdate) != 0){
    strMessage <- paste0("The following packages are already installed but need to be updated: \n"
                         , paste(pkgNeedsUpdate, collapse = ", \n"))
    message(strMessage)
    message("Updating ... ")
  
    utils::install.packages(pkgNeedsInstallation, ...)
  }
  
  if (length(pkgNeedsInstallation) != 0) {
    strMessage <- paste0("The following packages have not been installed: \n"
                         , paste(pkgNeedsInstallation, collapse = ", \n"))
    message(strMessage)
    
    message("Updating ... ")
    
    utils::install.packages(pkgNeedsInstallation, ...)
  } 
  
  pkgUpToDate <- strSuggestions[PackageIsInstalled(strSuggestions) & !PackageNeedsUpdating(strSuggestions)]

  strMessage <- paste0("The following packages are now installed and up to date: \n"
                       , paste(pkgUpToDate, collapse = ", \n"))
  message(strMessage)  

}

#' PackageIsInstalled
#' @name PackageIsInstalled
#' 
#' @description This function will indicate whether a package has been installed. It uses the installed.packages 
#' function for this.
#' 
#' @return A logical vector indicating whether the packages have been installed.
#' 
#' @param pkgs Character vector of package names.
#' 
#' @examples 
#' 
#' \dontrun{
#'   PackageIsInstalled("ggplot2")
#' }
#' 
#' @importFrom utils installed.packages
#' 
#' @export
#' 
PackageIsInstalled <- function(pkgs){
  installed <- pkgs %in% intersect(pkgs, utils::installed.packages()[, 1])
  installed
}

#' PackageNeedsUpdating
#' @name PackageNeedsUpdating
#' 
#' @description This function will indicate whether a package needs to be updated. It uses the old.packages 
#' function for this.
#' 
#' @return A logical vector indicating whether the packages need to be updated.
#' 
#' @param pkgs Character vector of package names.
#' 
#' @examples 
#' 
#' \dontrun{
#'   PackageNeedsUpdating("ggplot2")
#' }
#' 
#' @importFrom utils old.packages
#' 
#' @export
#' 
PackageNeedsUpdating <- function(pkgs){
  needsUpdate <- pkgs %in% intersect(pkgs, utils::old.packages()[, 1])
  needsUpdate
}
