#' @name Hurricane
#' 
#' @title Hurricane data
#' 
#' @description
#' 
#' Listing of the position of and windspeed of hurricanes.
#' 
#' Data is taken from the National Hurricane Center, a division of the
#' National Oceanic and Atmospheric Association.
#' 
#' @format A data frame with 7 variables:
#'    \code{Year}, \code{Number}, \code{ISO_Time}
#'    , \code{Latitude}, \code{Longitude}, \code{Wind}
#' 
"Hurricane"

#' @name StateExperience
#' 
#' @title State data
#' 
#' @description
#' 
#' Random illustrative data
#' 
#' @format A data frame with 7 variables:
#'    \code{Fullname}, \code{PolicyYear}, \code{Postal}
#'    , \code{NumPolicies}, \code{PolicyGrowth}, \code{Lambda}
#'    , \code{BasePolicies}, \code{NumClaims}, \code{Region}
#' 
"StateExperience"

#' @name RegionExperience
#' 
#' @title Region data
#' 
#' @description
#' 
#' Consolidation of state data into various regions
#' 
#' @format A data frame with four variables:
#'    \code{Region}, \code{PolicyYear}
#'    , \code{NumPolicies}, \code{NumClaims}
"RegionExperience"

#' @name NFL
#' 
#' @title NFL game data
#' 
#' @description
#' 
#' Results of over 13,000 NFL games
#' 
#' @format Data frame with 25 variables
#'    \code{Week}, \code{Day}, \code{Date}, \code{Outcome}
#'    , \code{OT}, \code{Record}, \code{Home}, \code{Opponent}
#'    , \code{ThisTeamScore}, \code{OpponentScore}
#'    , \code{ThisTeam1D}, \code{ThisTeamTotalYards}
#'    , \code{ThisTeamPassYards}, \code{ThisTeamRushYards}
#'    , \code{ThisTeamTO}, \code{Opponent1D}
#'    , \code{OpponentTotalYards}, \code{OpponentPassYards}
#'    , \code{OpponentRushYards}, \code{OpponentTO}
#'    , \code{GameDate}, \code{TODiff}
#'    , \code{Win}, \code{ThisTeam}, \code{ScoreDifference}  
#' 
"NFL"

#' @name COTOR2
#' 
#' @title Committee on the Theory of Risk
#' 
#' @usage
#' 
#' data(COTOR2)
#' 
#' @description
#' 
#' The \href{http://www.casact.org/research/cotor/}{Casualty Actuarial Society's Committee on Theory of Risk (COTOR)} 
#' issued several challenges as part of their work. These involved artificial constructed loss data. Actuaries
#' were invited to construct models to estimate appropriate premiums for risk transfer.
#' 
#' Note that there is no COTOR1
#' 
#' @format COTOR2 is a data frame with 249 observations of one variable: 
#' 
#' \code{Amount}
#' 
#' COTOR3 is a data frame with 483 observations of one variable: 
#' 
#' \code{Amount}
#' 
#' COTOR4 is a data frame with 2500 rows and 3 columns
#' 
#' \code{ClaimNumber}, \code{Year}, \code{Amount}
#' 
#' COTOR5 is a data frame with 4849 rows and 5 columns
#' 
#' \code{Risk}, \code{Year}, \code{MSA}, \code{Paid Claim Amount}
#' 
#' @aliases COTOR COTOR1 COTOR2 COTOR3 COTOR4 COTOR5
"COTOR2"