library(marmap)

#SHORTFIN MAKOS
#Grab bathymetry data from NOAA server 
sf_depth<- getNOAA.bathy(lon1 = -100, lon2 = -30, lat1 = 50, lat2 = 10, resolution = 1)

#Convert to raster for MaxEnt model
sf_bathy<- marmap::as.raster(sf_depth)
names(sf_bathy)<-"bathymetry"

#Plot bathymetric data just to see
options(max.contour.segments = 11000000) - #need to increase max contour 
plot.bathy(sf_depth, image = TRUE, land = TRUE)

#WHITE SHARKS
#Grab bathymetry data from NOAA server 
white_depth<- getNOAA.bathy(lon1 = -95, lon2 = -15, lat1 = 55, lat2 = 15, resolution = 1)

#Convert to raster for MaxEnt model
white_bathy<- marmap::as.raster(white_depth)
names(white_bathy)<-"bathymetry"

#Plot bathymetric data just to see
options(max.contour.segments = 30000) - #need to increase max contour 
plot.bathy(white_depth, image = TRUE, land = TRUE)
