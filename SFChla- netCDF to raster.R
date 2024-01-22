library(ncdf4)
library(raster)
library(dplyr)
library(tidyverse)

#WINTER
#2013
#Look directly into netcdf file and pull data directly from it
chla_winter_2013 <- nc_open('Chla_winter_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_winter_2013, "longitude")
lat <- ncvar_get(chla_winter_2013, "latitude")
time1 <- ncvar_get(chla_winter_2013, "time")
chla <- ncvar_get(chla_winter_2013, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(chla_winter_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart1 <- as.POSIXct("2013-01-01", tz="GMT")
winterend1 <- as.POSIXct("2013-03-31", tz="GMT")
winter_sub1 <- (time_vector1 > winterstart1) & (time_vector1 < winterend1)

#Bring in variables from subset
winter_chla_2013 <- chla[,,winter_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= winterstart1 & time_vector1 <= winterend1]))

#Vectors of subsetted variables
winter_chla_vec_2013 <- as.vector(winter_chla_2013)
winter_chla_2013_df <- data.frame(cbind(winter_lonlattime1, winter_chla_vec_2013))
winter_chla_2013_df <- rename(winter_chla_2013_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = winter_chla_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
chla_winter_2014 <- nc_open('Chla_winter_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_winter_2014, "longitude")
lat <- ncvar_get(chla_winter_2014, "latitude")
time2 <- ncvar_get(chla_winter_2014, "time")
chla <- ncvar_get(chla_winter_2014, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(chla_winter_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart2 <- as.POSIXct("2014-01-01", tz="GMT")
winterend2 <- as.POSIXct("2014-03-31", tz="GMT")
winter_sub2 <- (time_vector2 > winterstart2) & (time_vector2 < winterend2)

#Bring in variables from subset
winter_chla_2014 <- chla[,,winter_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= winterstart2 & time_vector2 <= winterend2]))

#Vectors of subsetted variables
winter_chla_vec_2014 <- as.vector(winter_chla_2014)
winter_chla_2014_df <- data.frame(cbind(winter_lonlattime2, winter_chla_vec_2014))
winter_chla_2014_df <- rename(winter_chla_2014_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = winter_chla_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
chla_winter_2015 <- nc_open('Chla_winter_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_winter_2015, "longitude")
lat <- ncvar_get(chla_winter_2015, "latitude")
time3 <- ncvar_get(chla_winter_2015, "time")
chla <- ncvar_get(chla_winter_2015, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(chla_winter_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart3 <- as.POSIXct("2015-01-01", tz="GMT")
winterend3 <- as.POSIXct("2015-03-31", tz="GMT")
winter_sub3 <- (time_vector3 > winterstart3) & (time_vector3 < winterend3)

#Bring in variables from subset
winter_chla_2015 <- chla[,,winter_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= winterstart3 & time_vector3 <= winterend3]))

#Vectors of subsetted variables
winter_chla_vec_2015 <- as.vector(winter_chla_2015)
winter_chla_2015_df <- data.frame(cbind(winter_lonlattime3, winter_chla_vec_2015))
winter_chla_2015_df <- rename(winter_chla_2015_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = winter_chla_vec_2015) 

#Combine yearly dataframes into one big one for winter
winter_df <- data.frame(rbind(winter_chla_2013_df, winter_chla_2014_df, winter_chla_2015_df))
winter_df$chlorophyll = as.numeric(winter_df$chlorophyll)
winter_df$longitude = as.numeric(winter_df$longitude)
winter_df$latitude = as.numeric(winter_df$latitude)
winter_df2 <- winter_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#____________________________________________________________________________________________________________

#SPRING
#2013
#Look directly into netcdf file and pull data directly from it
chla_spring_2013 <- nc_open('Chla_spring_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_spring_2013, "longitude")
lat <- ncvar_get(chla_spring_2013, "latitude")
time1 <- ncvar_get(chla_spring_2013, "time")
chla <- ncvar_get(chla_spring_2013, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(chla_spring_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart1 <- as.POSIXct("2013-04-01", tz="GMT")
springend1 <- as.POSIXct("2013-06-30", tz="GMT")
spring_sub1 <- (time_vector1 > springstart1) & (time_vector1 < springend1)

#Bring in variables from subset
spring_chla_2013 <- chla[,,spring_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= springstart1 & time_vector1 <= springend1]))

#Vectors of subsetted variables
spring_chla_vec_2013 <- as.vector(spring_chla_2013)
spring_chla_2013_df <- data.frame(cbind(spring_lonlattime1, spring_chla_vec_2013))
spring_chla_2013_df <- rename(spring_chla_2013_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = spring_chla_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
chla_spring_2014 <- nc_open('Chla_spring_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_spring_2014, "longitude")
lat <- ncvar_get(chla_spring_2014, "latitude")
time2 <- ncvar_get(chla_spring_2014, "time")
chla <- ncvar_get(chla_spring_2014, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(chla_spring_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart2 <- as.POSIXct("2014-04-01", tz="GMT")
springend2 <- as.POSIXct("2014-06-30", tz="GMT")
spring_sub2 <- (time_vector2 > springstart2) & (time_vector2 < springend2)

#Bring in variables from subset
spring_chla_2014 <- chla[,,spring_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= springstart2 & time_vector2 <= springend2]))

#Vectors of subsetted variables
spring_chla_vec_2014 <- as.vector(spring_chla_2014)
spring_chla_2014_df <- data.frame(cbind(spring_lonlattime2, spring_chla_vec_2014))
spring_chla_2014_df <- rename(spring_chla_2014_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = spring_chla_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
chla_spring_2015 <- nc_open('Chla_spring_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_spring_2015, "longitude")
lat <- ncvar_get(chla_spring_2015, "latitude")
time3 <- ncvar_get(chla_spring_2015, "time")
chla <- ncvar_get(chla_spring_2015, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(chla_spring_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart3 <- as.POSIXct("2015-04-01", tz="GMT")
springend3 <- as.POSIXct("2015-06-30", tz="GMT")
spring_sub3 <- (time_vector3 > springstart3) & (time_vector3 < springend3)

#Bring in variables from subset
spring_chla_2015 <- chla[,,spring_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= springstart3 & time_vector3 <= springend3]))

#Vectors of subsetted variables
spring_chla_vec_2015 <- as.vector(spring_chla_2015)
spring_chla_2015_df <- data.frame(cbind(spring_lonlattime3, spring_chla_vec_2015))
spring_chla_2015_df <- rename(spring_chla_2015_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = spring_chla_vec_2015)

#Combine yearly dataframes into one big one for spring
spring_df <- data.frame(rbind(spring_chla_2013_df, spring_chla_2014_df, spring_chla_2015_df))
spring_df$chlorophyll = as.numeric(spring_df$chlorophyll)
spring_df$longitude = as.numeric(spring_df$longitude)
spring_df$latitude = as.numeric(spring_df$latitude)
spring_df2 <- spring_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs
#____________________________________________________________________________________________________________

#SUMMER
#2013
#Look directly into netcdf file and pull data directly from it
chla_summer_2013 <- nc_open('Chla_summer_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_summer_2013, "longitude")
lat <- ncvar_get(chla_summer_2013, "latitude")
time1 <- ncvar_get(chla_summer_2013, "time")
chla <- ncvar_get(chla_summer_2013, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(chla_summer_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart1 <- as.POSIXct("2013-07-01", tz="GMT")
summerend1 <- as.POSIXct("2013-09-30", tz="GMT")
summer_sub1 <- (time_vector1 > summerstart1) & (time_vector1 < summerend1)

#Bring in variables from subset
summer_chla_2013 <- chla[,,summer_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= summerstart1 & time_vector1 <= summerend1]))

#Vectors of subsetted variables
summer_chla_vec_2013 <- as.vector(summer_chla_2013)
summer_chla_2013_df <- data.frame(cbind(summer_lonlattime1, summer_chla_vec_2013))
summer_chla_2013_df<- rename(summer_chla_2013_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = summer_chla_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
chla_summer_2014 <- nc_open('Chla_summer_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_summer_2014, "longitude")
lat <- ncvar_get(chla_summer_2014, "latitude")
time2 <- ncvar_get(chla_summer_2014, "time")
chla <- ncvar_get(chla_summer_2014, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(chla_summer_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart2 <- as.POSIXct("2014-07-01", tz="GMT")
summerend2 <- as.POSIXct("2014-09-30", tz="GMT")
summer_sub2 <- (time_vector2 > summerstart2) & (time_vector2 < summerend2)

#Bring in variables from subset
summer_chla_2014 <- chla[,,summer_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= summerstart2 & time_vector2 <= summerend2]))

#Vectors of subsetted variables
summer_chla_vec_2014 <- as.vector(summer_chla_2014)
summer_chla_2014_df <- data.frame(cbind(summer_lonlattime2,summer_chla_vec_2014))
summer_chla_2014_df <- rename(summer_chla_2014_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = summer_chla_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
chla_summer_2015 <- nc_open('Chla_summer_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_summer_2015, "longitude")
lat <- ncvar_get(chla_summer_2015, "latitude")
time3 <- ncvar_get(chla_summer_2015, "time")
chla <- ncvar_get(chla_summer_2015, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(chla_summer_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart3 <- as.POSIXct("2015-07-01", tz="GMT")
summerend3 <- as.POSIXct("2015-09-30", tz="GMT")
summer_sub3 <- (time_vector3 > summerstart3) & (time_vector3 < summerend3)

#Bring in variables from subset
summer_chla_2015 <- chla[,,summer_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= summerstart3 & time_vector3 <= summerend3]))

#Vectors of subsetted variables
summer_chla_vec_2015 <- as.vector(summer_chla_2015)
summer_chla_2015_df <- data.frame(cbind(summer_lonlattime3,summer_chla_vec_2015))
summer_chla_2015_df <- rename(summer_chla_2015_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = summer_chla_vec_2015) 

#Combine yearly dataframes into one big one for summer
summer_df <- data.frame(rbind(summer_chla_2013_df, summer_chla_2014_df, summer_chla_2015_df))
summer_df$chlorophyll = as.numeric(summer_df$chlorophyll)
summer_df$longitude = as.numeric(summer_df$longitude)
summer_df$latitude = as.numeric(summer_df$latitude)
summer_df2 <- summer_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs
#____________________________________________________________________________________________________________

#AUTUMN
#2013
#Look directly into netcdf file and pull data directly from it
chla_autumn_2013 <- nc_open('Chla_autumn_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_autumn_2013, "longitude")
lat <- ncvar_get(chla_autumn_2013, "latitude")
time1 <- ncvar_get(chla_autumn_2013, "time")
chla <- ncvar_get(chla_autumn_2013, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(chla_autumn_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart1 <- as.POSIXct("2013-10-01", tz="GMT")
autumnend1 <- as.POSIXct("2013-12-31", tz="GMT")
autumn_sub1 <- (time_vector1 > autumnstart1) & (time_vector1 < autumnend1)

#Bring in variables from subset
autumn_chla_2013 <- chla[,,autumn_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= autumnstart1 & time_vector1 <= autumnend1]))

#Vectors of subsetted variables
autumn_chla_vec_2013 <- as.vector(autumn_chla_2013)
autumn_chla_2013_df <- data.frame(cbind(autumn_lonlattime1, autumn_chla_vec_2013))
autumn_chla_2013_df <- rename(autumn_chla_2013_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = autumn_chla_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
chla_autumn_2014 <- nc_open('Chla_autumn_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(chla_autumn_2014, "longitude")
lat <- ncvar_get(chla_autumn_2014, "latitude")
time2 <- ncvar_get(chla_autumn_2014, "time")
chla <- ncvar_get(chla_autumn_2014, "chlor_a")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(chla_autumn_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart2 <- as.POSIXct("2014-10-01", tz="GMT")
autumnend2 <- as.POSIXct("2014-12-31", tz="GMT")
autumn_sub2 <- (time_vector2 > autumnstart2) & (time_vector2 < autumnend2)

#Bring in variables from subset
autumn_chla_2014 <- chla[,,autumn_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= autumnstart2 & time_vector2 <= autumnend2]))

#Vectors of subsetted variables
autumn_chla_vec_2014 <- as.vector(autumn_chla_2014)
autumn_chla_2014_df <- data.frame(cbind(autumn_lonlattime2, autumn_chla_vec_2014))
autumn_chla_2014_df <- rename(autumn_chla_2014_df, longitude = Var1, latitude=Var2, time=Var3, chlorophyll = autumn_chla_vec_2014) 

#Combine yearly dataframes into one big one for autumn
autumn_df <- data.frame(rbind(autumn_chla_2013_df, autumn_chla_2014_df))
autumn_df$chlorophyll = as.numeric(autumn_df$chlorophyll)
autumn_df$longitude = as.numeric(autumn_df$longitude)
autumn_df$latitude = as.numeric(autumn_df$latitude)
autumn_df2 <- autumn_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#save all the big data frames
save(winter_df2, file = "SF_chla_winter_df")
save(spring_df2, file = "SF_chla_spring_df")
save(summer_df2, file = "SF_chla_summer_df")
save(autumn_df2, file = "SF_chla_autumn_df")
#____________________________________________________________________________________________________________

#NEED TO RASTERIZE DATA FRAMES
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/NC_sf/Chla")
load("SF_chla_autumn_df")
load("SF_chla_summer_df")
load("SF_chla_spring_df")
load("SF_chla_winter_df")
#winter
winter_df3<-winter_df2[,c(1,2,4)]

winter_mask <- rast(nrows = length(unique(round(winter_df3$latitude, 5))),
                    ncol = length(unique(round(winter_df3$longitude, 5))),
                    xmin = min(winter_df3$longitude), xmax = max(winter_df3$longitude),
                    ymin = min(winter_df3$latitude), ymax = max(winter_df3$latitude),
                    crs = '+proj=longlat +datum=WGS84')

winter_vect <- vect(
  winter_df3,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

winter_rast_chla <- terra::rasterize(
  winter_vect,
  winter_mask,
  'chlorophyll' #or whatever variable name you're dealing with
)

#chlorophyll column has now been changed to "last" so must rename
winter_rast_chla<- rename(winter_rast_chla, chlorophyll=last)

#spring
spring_df3<-spring_df2[,c(1,2,4)]

spring_mask <- rast(nrows = length(unique(round(spring_df3$latitude, 5))),
                    ncol = length(unique(round(spring_df3$longitude, 5))),
                    xmin = min(spring_df3$longitude), xmax = max(spring_df3$longitude),
                    ymin = min(spring_df3$latitude), ymax = max(spring_df3$latitude),
                    crs = '+proj=longlat +datum=WGS84')

spring_vect <- vect(
  spring_df3,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

spring_rast_chla <- terra::rasterize(
  spring_vect,
  spring_mask,
  'chlorophyll' #or whatever variable name you're dealing with
)

#chlorophyll column has now been changed to "last" so must rename
spring_rast_chla<- rename(spring_rast_chla, chlorophyll=last)

#summer
summer_df3<-summer_df2[,c(1,2,4)]

summer_mask <- rast(nrows = length(unique(round(summer_df3$latitude, 5))),
                    ncol = length(unique(round(summer_df3$longitude, 5))),
                    xmin = min(summer_df3$longitude), xmax = max(summer_df3$longitude),
                    ymin = min(summer_df3$latitude), ymax = max(summer_df3$latitude),
                    crs = '+proj=longlat +datum=WGS84')

summer_vect <- vect(
  summer_df3,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

summer_rast_chla <- terra::rasterize(
  summer_vect,
  summer_mask,
  'chlorophyll' #or whatever variable name you're dealing with
)

#chlorophyll column has now been changed to "last" so must rename
summer_rast_chla<- rename(summer_rast_chla, chlorophyll=last)

#autumn
autumn_df3<-autumn_df2[,c(1,2,4)]

autumn_mask <- rast(nrows = length(unique(round(autumn_df3$latitude, 5))),
                    ncol = length(unique(round(autumn_df3$longitude, 5))),
                    xmin = min(autumn_df3$longitude), xmax = max(autumn_df3$longitude),
                    ymin = min(autumn_df3$latitude), ymax = max(autumn_df3$latitude),
                    crs = '+proj=longlat +datum=WGS84')

autumn_vect <- vect(
  autumn_df3,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

autumn_rast_chla <- terra::rasterize(
  autumn_vect,
  autumn_mask,
  'chlorophyll' #or whatever variable name you're dealing with
)

#chlorophyll column has now been changed to "last" so must rename
autumn_rast_chla<- rename(autumn_rast_chla, chlorophyll=last)
