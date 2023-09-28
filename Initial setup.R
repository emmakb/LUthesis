##Setting up my workspace##
#Install necessary packages and read into library#
install.packages("tidyverse")
install.packages("raster")
install.packages("ggplot2")
install.packages("rlang")
install.packages("sp")
install.packages("sf")

library(tidyverse)
library(raster)
library(ggplot2)
library(rlang)
library(sp)
library(sf)

##Reading in shape files##
#Read in KBA data#
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/KBAsGlobal_2023_March_01_Criteria_TriggerSpecies")
globalKBAs <- st_read(dsn = ".", layer = "KBAsGlobal_2023_March_01_POL")
#Read in MPA data#
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/WDPA_WDOECM_Sep2023_Public_marine_shp")
globalMPAs1 <- st_read(dsn = "./WDPA_WDOECM_Sep2023_Public_marine_shp_0", layer = "WDPA_WDOECM_Sep2023_Public_marine_shp-polygons")
globalMPAs2 <- st_read(dsn = "./WDPA_WDOECM_Sep2023_Public_marine_shp_1", layer = "WDPA_WDOECM_Sep2023_Public_marine_shp-polygons")
globalMPAs3 <- st_read(dsn = "./WDPA_WDOECM_Sep2023_Public_marine_shp_2", layer = "WDPA_WDOECM_Sep2023_Public_marine_shp-polygons")

