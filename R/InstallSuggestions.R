#' InstallSuggestions
#' @name InstallSuggestions
#' 
#' @description This function will install the full set of suggested packages.
#' 
#' @param pkg Name of the package for which you want to install suggestions
#' @param quiet Include additional messages while installing?
#' @param ... Additional named arguments passed to `install.packages`
#' 
#' @return A character vector indicating which packages were installled.
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
InstallSuggestions <- function (pkg = "raw", quiet, ...){
  
  strSuggestions <- PackageDependencies(pkg, "Suggests")

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
  
  # We're going to default to quiet unless the user has told us otherwise
  if (missing(quiet)) {
    quiet = FALSE
  }
  
  if (length(pkgNeedsUpdate) != 0){
    strMessage <- paste0("The following packages are already installed but need to be updated: \n"
                         , paste(pkgNeedsUpdate, collapse = ", \n"))
    message(strMessage)
    message("Updating ... ")
  
    utils::install.packages(pkgNeedsUpdate, quiet = quiet, ...)
  }
  
  if (length(pkgNeedsInstallation) != 0) {
    strMessage <- paste0("The following packages will be installed now: \n"
                         , paste(pkgNeedsInstallation, collapse = ", \n"))
    message(strMessage)
    
    message("Installing ... ")
    
    utils::install.packages(pkgNeedsInstallation, quiet = quiet, ...)
  } 
  
  pkgUpToDate <- strSuggestions[PackageIsInstalled(strSuggestions) & !PackageNeedsUpdating(strSuggestions)]

  if (length(pkgUpToDate) == length(strSuggestions)) {
    strMessage <- "All packages are installed and up to date."
    message(strMessage)  
  } else {
    bumPackages <- setdiff(strSuggestions, pkgUpToDate)
    strMessage <- paste0("Not all packages are installed and up to date. "
                         , "You should try to reinstall the following packages: "
                         , paste(bumPackages, collapse = ", \n"))
    warning(strMessage)
  }
  
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
  installed <- utils::installed.packages(fields = "Package")[, "Package"]
  installed <- pkgs %in% intersect(pkgs, installed)
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

#' PackageDependencies
#' 
#' @name PackageDependencies
#' 
#' @description PackageDependencies will examine the DESCRIPTION file of a package and return a vector of 
#'              dependencies.
#' 
#' @param x The name of the packages
#' @param type What sort of dependency are you looking for? Permissible values are "Depends", "Imports", 
#'            "Suggests", "Enhances" and "LinkingTo"
#'            
#' @importFrom utils packageDescription
#' 
#' @examples 
#' 
#' \dontrun{
#'   PackageDependencies("ggplot2", "Depends")
#' }
#'
#' @export
#' 
PackageDependencies <- function(x, type = c("Depends", "Imports", "Suggests", "Enhances", "LinkingTo"))
{
  if (length(x) > 1){
    warning("x has length > 1. Only the first element will be used.")
    x <- x[1]
  }
  
  deps <- packageDescription(x, fields =  type)
  deps <- gsub("\n", "", deps)
  deps <- gsub(" ", "", deps)
  deps <- strsplit(deps, ",")[[1]]
  
  deps
}
