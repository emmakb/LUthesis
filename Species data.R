#SPECIES DISTRIBUTION DATA#
#Load necessary packages#
library(tidyverse)
library(dplyr)
library(raster)
library(ggplot2)
library(rlang)
library(sp)
library(sf)
library(ncdf4)
library(parsedate)
library(plotdap)
library(rerddap)
library(rerddapXtracto)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggspatial)
library(csvread)

##SHORTFIN MAKO DATA##
#Load in CSV data
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
shortfinmako_data <- read.csv("Shortfin_mako_raw_data.csv")
#Plot the data#
ggplot(shortfinmako_data, aes(latitude, longitude)) +
  geom_point(color=timestamp)



