##Setting up my workspace##
#Install necessary packages#

#Begin sourcing from here#
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

##Reading in shape files##
#Key Biodiversity Areas#
#Read in KBA data#
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/KBAsGlobal_2023_March_01_Criteria_TriggerSpecies")
globalKBAs <- st_read(dsn = ".", layer = "KBAsGlobal_2023_March_01_POL")
#Add in world data and check coordinate reference system#
world <- ne_countries(scale = "medium", returnclass = "sf")
st_crs(world)
#Plot KBAs on world map#
#Restrict map to only represent NW Atlantic waters#
worldKBA <-fortify(globalKBAs)
ggplot() +
  geom_sf(data = world, fill= "black", color= NA) +
  geom_sf(data=worldKBA, fill="red", group="KBAs") +
  coord_sf(xlim= c(-90,-15), ylim= c(15,60), expand= FALSE) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  annotation_scale(location = "tl") +
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Key Biodiversity Areas (KBAs) in Eastern North America")


