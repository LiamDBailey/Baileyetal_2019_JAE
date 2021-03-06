% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\name{GRID}
\alias{GRID}
\title{A SpatialPolygonDataFrame object of the 50m x 50m grid.}
\format{A SpatialPolygonDataFrame with 705 rows and 6 variables
\describe{
  \item{Sub_Area}{Study sub-area where grid square is located.}
  \item{POLY_ID}{Unique ID for each grid square.}
  \item{Median}{Median elevation of grid square, estimated from LiDAR elevation map.}
  \item{Gully_Dist}{Distance to the nearest gully.}
  \item{Coast_Dist}{Distance to the coastline.}
  \item{Grid_area}{Area of grid square after removing unusable areas (elevation <20cm above MHT in 1971)}
  }}
\description{
A SpatialPolygonDataFrame object of the 50m x 50m grid.
}
