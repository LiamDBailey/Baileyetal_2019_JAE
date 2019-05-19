#' Whether or not study sub-areas were used in a given year.
#'
#' Data frame showing whether a study sub area was used in a given year.
#' @format A data frame with 33 rows and 10 variables
#' \describe{
#'   \item{Year}{Study year (1984 - 2016)}
#'   \item{A}{Logical. Was sub-area A used in a given year.}
#'   \item{B}{Logical. Was sub-area B used in a given year.}
#'   \item{C}{Logical. Was sub-area C used in a given year.}
#'   \item{D}{Logical. Was sub-area D used in a given year.}
#'   \item{E}{Logical. Was sub-area E used in a given year.}
#'   \item{F}{Logical. Was sub-area F used in a given year.}
#'   \item{OBK}{Logical. Was sub-area OBK used in a given year.}
#'   \item{NBK}{Logical. Was sub-area NBK used in a given year.}
#'   \item{TBK}{Logical. Was sub-area TBK used in a given year.}
#'   }
#'@name AREA
NULL

#' Number of fledglings recorded in each territory 1984 - 2016.
#'
#' @format A data frame with 3,754 rows and 7 variables
#' \describe{
#'   \item{Status}{Status of territory. Either 'leapfrog' (i.e. inland) or 'resident' (i.e. coastal).}
#'   \item{NestID}{Whether a nest was found in the territory.}
#'   \item{Sub_Area}{Study sub-area where territory is located.}
#'   \item{Year}{Year when fledgling numbers were recorded.}
#'   \item{Fledge_ChickInfo}{Fledgling numbers estimated from individual chick records.}
#'   \item{Fledge_NestInfo}{Fledgling numbers estimated from nest records.}
#'   \item{Fledge_NestCheck}{Fledgling numbers estimated from individual nest cheks.}
#'   }
#'@name FLEDGE_DATA
NULL

#' A SpatialPolygonDataFrame object of the 50m x 50m grid.
#'
#' @format A SpatialPolygonDataFrame with 705 rows and 6 variables
#' \describe{
#'   \item{Sub_Area}{Study sub-area where grid square is located.}
#'   \item{POLY_ID}{Unique ID for each grid square.}
#'   \item{Median}{Median elevation of grid square, estimated from LiDAR elevation map.}
#'   \item{Gully_Dist}{Distance to the nearest gully.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Grid_area}{Area of grid square after removing unusable areas (elevation <20cm above MHT in 1971)}
#'   }
#'@name GRID
NULL

#' A SpatialPolygonDataFrame object of the 100m x 100m grid.
#'
#' @format A SpatialPolygonDataFrame with 186 rows and 6 variables
#' \describe{
#'   \item{id}{Unique ID for each grid square.}
#'   \item{Sub_Area}{Study sub-area where grid square is located.}
#'   \item{Median}{Median elevation of grid square, estimated from LiDAR elevation map.}
#'   \item{Gully_Dist}{Distance to the nearest gully.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Grid_area}{Area of grid square after removing unusable areas (elevation <20cm above MHT in 1971)}
#'   }
#'@name GRID_100
NULL

#' Territory density in 50m x 50m grid squares between 1984 - 2016.
#'
#' @format A data frame with 10,303 rows and 3 variables
#' \describe{
#'   \item{ID}{Unique ID for each grid square.}
#'   \item{DENSITY}{Number of territory centre points in the grid square.}
#'   \item{Year}{Year of density measurement.}
#'   }
#'@name GRID_DENSITY
NULL

#' SpatialPolygonsDataFrame of tidal gullies.
#'
#' @format A SpatialPolygonsDataFrame with 5 features (gullies).
#' \describe{
#'   }
#'@name GULLY
NULL

#' Elevation of H ostralegus nests 1995 - 2016.
#'
#' @format A data frame with 3,221 rows and 6 variables.
#' \describe{
#'   \item{Year}{Year of measurement.}
#'   \item{Z}{Nest elevation (cm).}
#'   \item{Method}{Measurement method. Either in-situ (DGPS) or ex-situ (LID).}
#'   \item{MaleID}{Unique identifier for male parents of the nest.}
#'   \item{Area}{Study sub-area where nest is found.}
#'   \item{Status}{Status of territory. Either 'leapfrog' (i.e. inland) or 'resident' (i.e. coastal).}
#'   }
#'@name Nest_elevation
NULL

#' Total number of fledglings produced in 50m x 50m grid squares each year.
#'
#' @format A data frame with 3,754 rows and 3 variables.
#' \describe{
#'   \item{Year}{Year of measurement.}
#'   \item{POLY_ID}{Unique ID for each grid square.}
#'   \item{Fledge_est}{Total number of fledglings in each grid square each year.}
#'   }
#'@name Raw_fledge_data
NULL

#' Territory settlement of H ostralegus in 50m x 50m grid squares 1985 - 2016.
#'
#' @format A data frame with 9,377 rows and 11 variables.
#' \describe{
#'   \item{Year}{Year of measurement.}
#'   \item{POLY_ID}{Unique ID for each grid square.}
#'   \item{nr_Settle}{Total number of settlements occuring within grid square in given year.}
#'   \item{lgl_Settle}{Have any settlements occurred within grid square in a given year.}
#'   \item{Median2}{Median elevation of grid square (cm).}
#'   \item{Sub_Area}{Study sub-area of grid square.}
#'   \item{Gully_Dist}{Distance to nearest tidal gully.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Grid_area}{Area of grid square after removing unusable areas (elevation <20cm above MHT in 1971)}
#'   \item{rel_density3yr}{Relative density of H. ostralegus territories in the past 3 years before settlement.}
#'   \item{rel_fledge_est3yr}{Relative number of fledglings in the past 3 years before settlement.}
#'   }
#'@name SETTLE_poisson
NULL

#' Territory settlement of H ostralegus in 100m x 100m grid squares 1985 - 2016.
#'
#' @format A data frame with 2,535 rows and 11 variables.
#' \describe{
#'   \item{Year}{Year of measurement.}
#'   \item{POLY_ID}{Unique ID for each grid square.}
#'   \item{nr_Settle}{Total number of settlements occuring within grid square in given year.}
#'   \item{lgl_Settle}{Have any settlements occurred within grid square in a given year.}
#'   \item{Median2}{Median elevation of grid square (cm).}
#'   \item{Sub_Area}{Study sub-area of grid square.}
#'   \item{Gully_Dist}{Distance to nearest tidal gully.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Grid_area}{Area of grid square after removing unusable areas (elevation <20cm above MHT in 1971)}
#'   \item{rel_density3yr}{Relative density of H. ostralegus territories in the past 3 years before settlement.}
#'   \item{rel_fledge_est3yr}{Relative number of fledglings in the past 3 years before settlement.}
#'   }
#'@name SETTLE_poisson_100
NULL

#' SpatialPointsDataFrame of territory centre points 1984 - 2016.
#'
#' @format A data frame with 3,754 rows and 7 variables.
#' \describe{
#'   \item{MaleCode}{Male colour band code.}
#'   \item{MaleID}{Unique male ID.}
#'   \item{Status}{Status of territory. Either 'leapfrog' (i.e. inland) or 'resident' (i.e. coastal).}
#'   \item{Median}{Median elevation of grid square (cm).}
#'   \item{NestID}{Whether a nest was found in the territory.}
#'   \item{Gully_Dist}{Distance to nearest tidal gully.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Sub_Area}{Study sub-area of grid square.}
#'   \item{Year}{Year of measurement.}
#'   }
#'@name TERR_PTS
NULL

#' SpatialPolygonsDataFrame of territory boundaries 1984 - 2016.
#'
#' @format A data frame with 3,754 rows and 11 variables.
#' \describe{
#'   \item{X}{Territory centre point (Amersfoort RD New coordinate).}
#'   \item{Y}{Territory centre point (Amersfoort RD New coordinate).}
#'   \item{MaleCode}{Male colour band code.}
#'   \item{MaleID}{Unique male ID.}
#'   \item{Status}{Status of territory. Either 'leapfrog' (i.e. inland) or 'resident' (i.e. coastal).}
#'   \item{Median}{Median elevation of grid square (cm).}
#'   \item{NestID}{Whether a nest was found in the territory.}
#'   \item{Area}{Area of grid square after removing unusable areas (elevation <20cm above MHT in 1971)}
#'   \item{Gully_Dist}{Distance to nearest tidal gully.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Sub_Area}{Study sub-area of grid square.}
#'   \item{Year}{Year of measurement.}
#'   }
#'@name Territories
NULL

#' Territory vacancy patterns of H. ostralegus 1984 - 2015
#'
#' Data frame showing territory vacancy of H. ostralegus on Schiermonnikoog from 1984 - 2015.
#' Data frame is generated in the vignette 'prepare_data'.
#' @format A data frame with 3,116 rows and 7 variables
#' \describe{
#'   \item{Median2}{Median elevation of grid square (cm above MHT in 1971).}
#'   \item{Year}{Year of measurement.}
#'   \item{Coast_Dist}{Distance to the coastline.}
#'   \item{Gully_Dist}{Distance to nearest tidal gully.}
#'   \item{Status}{Status of territory. Either 'leapfrog' (i.e. inland) or 'resident' (i.e. coastal).}
#'   \item{Sub_Area}{Study sub-area of grid square.}
#'   \item{Vacated}{Whether or not a territory was vacated the following year.}
#'   }
#'@name VacatedTerritories
NULL
