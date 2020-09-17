# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

#' @name Hurricane
#' 
#' @title Hurricane data
#' 
#' @docType data
#' 
#' 
#' @description
#' 
#' Listing of the position and windspeed of hurricanes from 1970 through 2011.
#' 
#' Data is taken from the \href{https://www.noaa.gov/}{National Hurricane Center}, a division of the National Oceanic and Atmospheric Association. A 
#' description of the data as well as data for storms in other regions may be found 
#' here: \href{https://www.ncdc.noaa.gov/ibtracs/index.php?name=ib-v4-access}{IBTrACS}.
#' 
#' 
#' The fields "SerialNumber", "Basin", "SubBasin", "Nature", "Pressure", "Center", "WindPercentile", "PressurePercentile" and "TrackType"
#' have been removed.
#' 
#' \itemize{
#'    \item Year: Integer from 1971 through 2011 
#'    \item Number: Integer used to designate the hurricanes in a particular year
#'    \item Name: The name of the hurricane
#'    \item ISO_Time: The time the observation was made
#'    \item Latitude: Latitude where the observation was made
#'    \item Longitutde: Longitude where the observation was made
#'    \item Wind: windspeed measured knots (kt)
#'    \item Pressure: atmospheric pressue measured in millibars (mb)
#' }
#' 
#' @usage
#' 
#' data(Hurricane)
#' 
"Hurricane"