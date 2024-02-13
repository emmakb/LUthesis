library(ncdf4)
library(raster)
library(terra)
library(tidyterra)

#WINTER
#2013
#Look directly into netcdf file and pull data directly from it
sal_winter_2013 <- nc_open('sal_winter_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2013, "longitude")
lat <- ncvar_get(sal_winter_2013, "latitude")
time1 <- ncvar_get(sal_winter_2013, "time")
sal <- ncvar_get(sal_winter_2013, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(sal_winter_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart1 <- as.POSIXct("2013-01-01", tz="GMT")
winterend1 <- as.POSIXct("2013-03-31", tz="GMT")
winter_sub1 <- (time_vector1 > winterstart1) & (time_vector1 < winterend1)

#Bring in variables from subset
winter_sal_2013 <- sal[,,winter_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= winterstart1 & time_vector1 <= winterend1]))

#Vectors of subsetted variables
winter_sal_vec_2013 <- as.vector(winter_sal_2013)
winter_sal_2013_df <- data.frame(cbind(winter_lonlattime1, winter_sal_vec_2013))
winter_sal_2013_df <- rename(winter_sal_2013_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
sal_winter_2014 <- nc_open('sal_winter_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2014, "longitude")
lat <- ncvar_get(sal_winter_2014, "latitude")
time2 <- ncvar_get(sal_winter_2014, "time")
sal <- ncvar_get(sal_winter_2014, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(sal_winter_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart2 <- as.POSIXct("2014-01-01", tz="GMT")
winterend2 <- as.POSIXct("2014-03-31", tz="GMT")
winter_sub2 <- (time_vector2 > winterstart2) & (time_vector2 < winterend2)

#Bring in variables from subset
winter_sal_2014 <- sal[,,winter_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= winterstart2 & time_vector2 <= winterend2]))

#Vectors of subsetted variables
winter_sal_vec_2014 <- as.vector(winter_sal_2014)
winter_sal_2014_df <- data.frame(cbind(winter_lonlattime2, winter_sal_vec_2014))
winter_sal_2014_df <- rename(winter_sal_2014_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
sal_winter_2015 <- nc_open('sal_winter_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2015, "longitude")
lat <- ncvar_get(sal_winter_2015, "latitude")
time3 <- ncvar_get(sal_winter_2015, "time")
sal <- ncvar_get(sal_winter_2015, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(sal_winter_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart3 <- as.POSIXct("2015-01-01", tz="GMT")
winterend3 <- as.POSIXct("2015-03-31", tz="GMT")
winter_sub3 <- (time_vector3 > winterstart3) & (time_vector3 < winterend3)

#Bring in variables from subset
winter_sal_2015 <- sal[,,winter_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= winterstart3 & time_vector3 <= winterend3]))

#Vectors of subsetted variables
winter_sal_vec_2015 <- as.vector(winter_sal_2015)
winter_sal_2015_df <- data.frame(cbind(winter_lonlattime3, winter_sal_vec_2015))
winter_sal_2015_df <- rename(winter_sal_2015_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2015) 

#2016
#Look directly into netcdf file and pull data directly from it
sal_winter_2016 <- nc_open('sal_winter_2016.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2016, "longitude")
lat <- ncvar_get(sal_winter_2016, "latitude")
time4 <- ncvar_get(sal_winter_2016, "time")
sal <- ncvar_get(sal_winter_2016, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits4 <- ncatt_get(sal_winter_2016, "time", "units") #Look at time unit
time_vector4 <- as.POSIXct(time4, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart4 <- as.POSIXct("2016-01-01", tz="GMT")
winterend4 <- as.POSIXct("2016-03-31", tz="GMT")
winter_sub4 <- (time_vector4 > winterstart4) & (time_vector4 < winterend4)

#Bring in variables from subset
winter_sal_2016 <- sal[,,winter_sub4]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime4 <- as.matrix(expand.grid(lon, lat, time_vector4[time_vector4 >= winterstart4 & time_vector4 <= winterend4]))

#Vectors of subsetted variables
winter_sal_vec_2016 <- as.vector(winter_sal_2016)
winter_sal_2016_df <- data.frame(cbind(winter_lonlattime4, winter_sal_vec_2016))
winter_sal_2016_df <- rename(winter_sal_2016_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2016)

#2017
#Look directly into netcdf file and pull data directly from it
sal_winter_2017 <- nc_open('sal_winter_2017.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2017, "longitude")
lat <- ncvar_get(sal_winter_2017, "latitude")
time5 <- ncvar_get(sal_winter_2017, "time")
sal <- ncvar_get(sal_winter_2017, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits5 <- ncatt_get(sal_winter_2017, "time", "units") #Look at time unit
time_vector5 <- as.POSIXct(time5, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart5 <- as.POSIXct("2017-01-01", tz="GMT")
winterend5 <- as.POSIXct("2017-03-31", tz="GMT")
winter_sub5 <- (time_vector5 > winterstart5) & (time_vector5 < winterend5)

#Bring in variables from subset
winter_sal_2017 <- sal[,,winter_sub5]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime5 <- as.matrix(expand.grid(lon, lat, time_vector5[time_vector5 >= winterstart5 & time_vector5 <= winterend5]))

#Vectors of subsetted variables
winter_sal_vec_2017 <- as.vector(winter_sal_2017)
winter_sal_2017_df <- data.frame(cbind(winter_lonlattime5, winter_sal_vec_2017))
winter_sal_2017_df <- rename(winter_sal_2017_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2017)

#2018
#Look directly into netcdf file and pull data directly from it
sal_winter_2018 <- nc_open('sal_winter_2018.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2018, "longitude")
lat <- ncvar_get(sal_winter_2018, "latitude")
time6 <- ncvar_get(sal_winter_2018, "time")
sal <- ncvar_get(sal_winter_2018, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits6 <- ncatt_get(sal_winter_2018, "time", "units") #Look at time unit
time_vector6 <- as.POSIXct(time6, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart6 <- as.POSIXct("2018-01-01", tz="GMT")
winterend6 <- as.POSIXct("2018-03-31", tz="GMT")
winter_sub6<- (time_vector6 > winterstart6) & (time_vector6 < winterend6)

#Bring in variables from subset
winter_sal_2018 <- sal[,,winter_sub6]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime6 <- as.matrix(expand.grid(lon, lat, time_vector6[time_vector6 >= winterstart6 & time_vector6 <= winterend6]))

#Vectors of subsetted variables
winter_sal_vec_2018 <- as.vector(winter_sal_2018)
winter_sal_2018_df <- data.frame(cbind(winter_lonlattime6, winter_sal_vec_2018))
winter_sal_2018_df <- rename(winter_sal_2018_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2018)

#2019
#Look directly into netcdf file and pull data directly from it
sal_winter_2019 <- nc_open('sal_winter_2019.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2019, "longitude")
lat <- ncvar_get(sal_winter_2019, "latitude")
time7 <- ncvar_get(sal_winter_2019, "time")
sal <- ncvar_get(sal_winter_2019, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits7 <- ncatt_get(sal_winter_2019, "time", "units") #Look at time unit
time_vector7 <- as.POSIXct(time7, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart7 <- as.POSIXct("2019-01-01", tz="GMT")
winterend7 <- as.POSIXct("2019-03-31", tz="GMT")
winter_sub7 <- (time_vector7 > winterstart7) & (time_vector7 < winterend7)

#Bring in variables from subset
winter_sal_2019 <- sal[,,winter_sub7]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime7 <- as.matrix(expand.grid(lon, lat, time_vector7[time_vector7 >= winterstart7 & time_vector7 <= winterend7]))

#Vectors of subsetted variables
winter_sal_vec_2019 <- as.vector(winter_sal_2019)
winter_sal_2019_df <- data.frame(cbind(winter_lonlattime7, winter_sal_vec_2019))
winter_sal_2019_df <- rename(winter_sal_2019_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2019)

#2020
#Look directly into netcdf file and pull data directly from it
sal_winter_2020 <- nc_open('sal_winter_2020.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2020, "longitude")
lat <- ncvar_get(sal_winter_2020, "latitude")
time8 <- ncvar_get(sal_winter_2020, "time")
sal <- ncvar_get(sal_winter_2020, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits8 <- ncatt_get(sal_winter_2020, "time", "units") #Look at time unit
time_vector8 <- as.POSIXct(time8, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart8 <- as.POSIXct("2020-01-01", tz="GMT")
winterend8 <- as.POSIXct("2020-03-31", tz="GMT")
winter_sub8 <- (time_vector8 > winterstart8) & (time_vector8 < winterend8)

#Bring in variables from subset
winter_sal_2020 <- sal[,,winter_sub8]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime8 <- as.matrix(expand.grid(lon, lat, time_vector8[time_vector8 >= winterstart8 & time_vector8 <= winterend8]))

#Vectors of subsetted variables
winter_sal_vec_2020 <- as.vector(winter_sal_2020)
winter_sal_2020_df <- data.frame(cbind(winter_lonlattime8, winter_sal_vec_2020))
winter_sal_2020_df <- rename(winter_sal_2020_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2020)

#2021
#Look directly into netcdf file and pull data directly from it
sal_winter_2021 <- nc_open('sal_winter_2021.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2021, "longitude")
lat <- ncvar_get(sal_winter_2021, "latitude")
time9 <- ncvar_get(sal_winter_2021, "time")
sal <- ncvar_get(sal_winter_2021, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits9 <- ncatt_get(sal_winter_2021, "time", "units") #Look at time unit
time_vector9 <- as.POSIXct(time9, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart9 <- as.POSIXct("2021-01-01", tz="GMT")
winterend9 <- as.POSIXct("2021-03-31", tz="GMT")
winter_sub9 <- (time_vector9 > winterstart9) & (time_vector9 < winterend9)

#Bring in variables from subset
winter_sal_2021 <- sal[,,winter_sub9]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime9 <- as.matrix(expand.grid(lon, lat, time_vector9[time_vector9 >= winterstart9 & time_vector9 <= winterend9]))

#Vectors of subsetted variables
winter_sal_vec_2021 <- as.vector(winter_sal_2021)
winter_sal_2021_df <- data.frame(cbind(winter_lonlattime9, winter_sal_vec_2021))
winter_sal_2021_df <- rename(winter_sal_2021_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2021)

#2022
#Look directly into netcdf file and pull data directly from it
sal_winter_2022 <- nc_open('sal_winter_2022.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_winter_2022, "longitude")
lat <- ncvar_get(sal_winter_2022, "latitude")
time10 <- ncvar_get(sal_winter_2022, "time")
sal <- ncvar_get(sal_winter_2022, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits10 <- ncatt_get(sal_winter_2022, "time", "units") #Look at time unit
time_vector10 <- as.POSIXct(time10, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
winterstart10 <- as.POSIXct("2022-01-01", tz="GMT")
winterend10 <- as.POSIXct("2022-03-31", tz="GMT")
winter_sub10 <- (time_vector10 > winterstart10) & (time_vector10 < winterend10)

#Bring in variables from subset
winter_sal_2022 <- sal[,,winter_sub10]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
winter_lonlattime10 <- as.matrix(expand.grid(lon, lat, time_vector10[time_vector10 >= winterstart10 & time_vector10 <= winterend10]))

#Vectors of subsetted variables
winter_sal_vec_2022 <- as.vector(winter_sal_2022)
winter_sal_2022_df <- data.frame(cbind(winter_lonlattime10, winter_sal_vec_2022))
winter_sal_2022_df <- rename(winter_sal_2022_df, longitude = Var1, latitude=Var2, time=Var3, sal = winter_sal_vec_2022)

#MATURE MALES
winter_whitemale_df <- data.frame(rbind(winter_sal_2017_df, winter_sal_2018_df, winter_sal_2019_df, 
                                        winter_sal_2020_df, winter_sal_2021_df, winter_sal_2022_df))
winter_whitemale_df$sal = as.numeric(winter_whitemale_df$sal)
winter_whitemale_df$longitude = as.numeric(winter_whitemale_df$longitude)
winter_whitemale_df$latitude = as.numeric(winter_whitemale_df$latitude)
winter_whitemale_df2 <- winter_whitemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#MATURE FEMALES
winter_whitefemale_df <- data.frame(rbind(winter_sal_2013_df, winter_sal_2014_df, winter_sal_2015_df, winter_sal_2016_df,
                                          winter_sal_2017_df, winter_sal_2018_df, winter_sal_2019_df, winter_sal_2020_df, winter_sal_2021_df))
winter_whitefemale_df$sal = as.numeric(winter_whitefemale_df$sal)
winter_whitefemale_df$longitude = as.numeric(winter_whitefemale_df$longitude)
winter_whitefemale_df$latitude = as.numeric(winter_whitefemale_df$latitude)
winter_whitefemale_df2 <- winter_whitefemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#SUB-ADULTS
winter_sub_df <- data.frame(rbind(winter_sal_2014_df, winter_sal_2015_df, winter_sal_2016_df,
                                  winter_sal_2017_df, winter_sal_2018_df, winter_sal_2019_df, winter_sal_2020_df, winter_sal_2021_df, winter_sal_2022_df))
winter_sub_df$sal = as.numeric(winter_sub_df$sal)
winter_sub_df$longitude = as.numeric(winter_sub_df$longitude)
winter_sub_df$latitude = as.numeric(winter_sub_df$latitude)
winter_sub_df2 <- winter_sub_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#YOY
winter_yoy_df <- data.frame(rbind(winter_sal_2017_df, winter_sal_2018_df, 
                                  winter_sal_2019_df))
winter_yoy_df$sal = as.numeric(winter_yoy_df$sal)
winter_yoy_df$longitude = as.numeric(winter_yoy_df$longitude)
winter_yoy_df$latitude = as.numeric(winter_yoy_df$latitude)
winter_yoy_df2 <- winter_yoy_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#____________________________________________________________________________________________________________

#SPRING
#2013
#Look directly into netcdf file and pull data directly from it
sal_spring_2013 <- nc_open('sal_spring_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2013, "longitude")
lat <- ncvar_get(sal_spring_2013, "latitude")
time1 <- ncvar_get(sal_spring_2013, "time")
sal <- ncvar_get(sal_spring_2013, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(sal_spring_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart1 <- as.POSIXct("2013-04-01", tz="GMT")
springend1 <- as.POSIXct("2013-06-30", tz="GMT")
spring_sub1 <- (time_vector1 > springstart1) & (time_vector1 < springend1)

#Bring in variables from subset
spring_sal_2013 <- sal[,,spring_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= springstart1 & time_vector1 <= springend1]))

#Vectors of subsetted variables
spring_sal_vec_2013 <- as.vector(spring_sal_2013)
spring_sal_2013_df <- data.frame(cbind(spring_lonlattime1, spring_sal_vec_2013))
spring_sal_2013_df <- rename(spring_sal_2013_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
sal_spring_2014 <- nc_open('sal_spring_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2014, "longitude")
lat <- ncvar_get(sal_spring_2014, "latitude")
time2 <- ncvar_get(sal_spring_2014, "time")
sal <- ncvar_get(sal_spring_2014, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(sal_spring_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart2 <- as.POSIXct("2014-04-01", tz="GMT")
springend2 <- as.POSIXct("2014-06-30", tz="GMT")
spring_sub2 <- (time_vector2 > springstart2) & (time_vector2 < springend2)

#Bring in variables from subset
spring_sal_2014 <- sal[,,spring_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= springstart2 & time_vector2 <= springend2]))

#Vectors of subsetted variables
spring_sal_vec_2014 <- as.vector(spring_sal_2014)
spring_sal_2014_df <- data.frame(cbind(spring_lonlattime2, spring_sal_vec_2014))
spring_sal_2014_df <- rename(spring_sal_2014_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
sal_spring_2015 <- nc_open('sal_spring_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2015, "longitude")
lat <- ncvar_get(sal_spring_2015, "latitude")
time3 <- ncvar_get(sal_spring_2015, "time")
sal <- ncvar_get(sal_spring_2015, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(sal_spring_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart3 <- as.POSIXct("2015-04-01", tz="GMT")
springend3 <- as.POSIXct("2015-06-30", tz="GMT")
spring_sub3 <- (time_vector3 > springstart3) & (time_vector3 < springend3)

#Bring in variables from subset
spring_sal_2015 <- sal[,,spring_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= springstart3 & time_vector3 <= springend3]))

#Vectors of subsetted variables
spring_sal_vec_2015 <- as.vector(spring_sal_2015)
spring_sal_2015_df <- data.frame(cbind(spring_lonlattime3, spring_sal_vec_2015))
spring_sal_2015_df <- rename(spring_sal_2015_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2015)

#2016
#Look directly into netcdf file and pull data directly from it
sal_spring_2016 <- nc_open('sal_spring_2016.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2016, "longitude")
lat <- ncvar_get(sal_spring_2016, "latitude")
time4 <- ncvar_get(sal_spring_2016, "time")
sal <- ncvar_get(sal_spring_2016, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits4 <- ncatt_get(sal_spring_2016, "time", "units") #Look at time unit
time_vector4 <- as.POSIXct(time4, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart4 <- as.POSIXct("2016-04-01", tz="GMT")
springend4 <- as.POSIXct("2016-06-30", tz="GMT")
spring_sub4 <- (time_vector4 > springstart4) & (time_vector4 < springend4)

#Bring in variables from subset
spring_sal_2016 <- sal[,,spring_sub4]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime4 <- as.matrix(expand.grid(lon, lat, time_vector4[time_vector4 >= springstart4 & time_vector4 <= springend4]))

#Vectors of subsetted variables
spring_sal_vec_2016 <- as.vector(spring_sal_2016)
spring_sal_2016_df <- data.frame(cbind(spring_lonlattime4, spring_sal_vec_2016))
spring_sal_2016_df <- rename(spring_sal_2016_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2016)

#2017
#Look directly into netcdf file and pull data directly from it
sal_spring_2017 <- nc_open('sal_spring_2017.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2017, "longitude")
lat <- ncvar_get(sal_spring_2017, "latitude")
time5 <- ncvar_get(sal_spring_2017, "time")
sal <- ncvar_get(sal_spring_2017, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits5 <- ncatt_get(sal_spring_2017, "time", "units") #Look at time unit
time_vector5 <- as.POSIXct(time5, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart5 <- as.POSIXct("2017-04-01", tz="GMT")
springend5 <- as.POSIXct("2017-06-30", tz="GMT")
spring_sub5 <- (time_vector5 > springstart5) & (time_vector5 < springend5)

#Bring in variables from subset
spring_sal_2017 <- sal[,,spring_sub5]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime5 <- as.matrix(expand.grid(lon, lat, time_vector5[time_vector5 >= springstart5 & time_vector5 <= springend5]))

#Vectors of subsetted variables
spring_sal_vec_2017 <- as.vector(spring_sal_2017)
spring_sal_2017_df <- data.frame(cbind(spring_lonlattime5, spring_sal_vec_2017))
spring_sal_2017_df <- rename(spring_sal_2017_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2017)

#2018
#Look directly into netcdf file and pull data directly from it
sal_spring_2018 <- nc_open('sal_spring_2018.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2018, "longitude")
lat <- ncvar_get(sal_spring_2018, "latitude")
time6 <- ncvar_get(sal_spring_2018, "time")
sal <- ncvar_get(sal_spring_2018, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits6 <- ncatt_get(sal_spring_2018, "time", "units") #Look at time unit
time_vector6 <- as.POSIXct(time6, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart6 <- as.POSIXct("2018-04-01", tz="GMT")
springend6 <- as.POSIXct("2018-06-30", tz="GMT")
spring_sub6 <- (time_vector6 > springstart6) & (time_vector6 < springend6)

#Bring in variables from subset
spring_sal_2018 <- sal[,,spring_sub6]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime6 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector6 >= springstart6 & time_vector6 <= springend6]))

#Vectors of subsetted variables
spring_sal_vec_2018 <- as.vector(spring_sal_2018)
spring_sal_2018_df <- data.frame(cbind(spring_lonlattime6, spring_sal_vec_2018))
spring_sal_2018_df <- rename(spring_sal_2018_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2018)

#2019
#Look directly into netcdf file and pull data directly from it
sal_spring_2019 <- nc_open('sal_spring_2019.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2019, "longitude")
lat <- ncvar_get(sal_spring_2019, "latitude")
time7 <- ncvar_get(sal_spring_2019, "time")
sal <- ncvar_get(sal_spring_2019, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits7 <- ncatt_get(sal_spring_2019, "time", "units") #Look at time unit
time_vector7 <- as.POSIXct(time7, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart7 <- as.POSIXct("2019-04-01", tz="GMT")
springend7 <- as.POSIXct("2019-06-30", tz="GMT")
spring_sub7 <- (time_vector7 > springstart7) & (time_vector7 < springend7)

#Bring in variables from subset
spring_sal_2019 <- sal[,,spring_sub7]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime7 <- as.matrix(expand.grid(lon, lat, time_vector7[time_vector7 >= springstart7 & time_vector7 <= springend7]))

#Vectors of subsetted variables
spring_sal_vec_2019 <- as.vector(spring_sal_2019)
spring_sal_2019_df <- data.frame(cbind(spring_lonlattime7, spring_sal_vec_2019))
spring_sal_2019_df <- rename(spring_sal_2019_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2019)

#2020
#Look directly into netcdf file and pull data directly from it
sal_spring_2020 <- nc_open('sal_spring_2020.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2020, "longitude")
lat <- ncvar_get(sal_spring_2020, "latitude")
time8 <- ncvar_get(sal_spring_2020, "time")
sal <- ncvar_get(sal_spring_2020, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits8 <- ncatt_get(sal_spring_2020, "time", "units") #Look at time unit
time_vector8 <- as.POSIXct(time8, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart8 <- as.POSIXct("2020-04-01", tz="GMT")
springend8 <- as.POSIXct("2020-06-30", tz="GMT")
spring_sub8 <- (time_vector8 > springstart8) & (time_vector8 < springend8)

#Bring in variables from subset
spring_sal_2020 <- sal[,,spring_sub8]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime8 <- as.matrix(expand.grid(lon, lat, time_vector8[time_vector8 >= springstart8 & time_vector8 <= springend8]))

#Vectors of subsetted variables
spring_sal_vec_2020 <- as.vector(spring_sal_2020)
spring_sal_2020_df <- data.frame(cbind(spring_lonlattime8, spring_sal_vec_2020))
spring_sal_2020_df <- rename(spring_sal_2020_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2020)

#2021
#Look directly into netcdf file and pull data directly from it
sal_spring_2021 <- nc_open('sal_spring_2021.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2021, "longitude")
lat <- ncvar_get(sal_spring_2021, "latitude")
time9 <- ncvar_get(sal_spring_2021, "time")
sal <- ncvar_get(sal_spring_2021, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits9 <- ncatt_get(sal_spring_2021, "time", "units") #Look at time unit
time_vector9 <- as.POSIXct(time9, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart9 <- as.POSIXct("2021-04-01", tz="GMT")
springend9 <- as.POSIXct("2021-06-30", tz="GMT")
spring_sub9 <- (time_vector9 > springstart9) & (time_vector9 < springend9)

#Bring in variables from subset
spring_sal_2021 <- sal[,,spring_sub9]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime9 <- as.matrix(expand.grid(lon, lat, time_vector9[time_vector9 >= springstart9 & time_vector9 <= springend9]))

#Vectors of subsetted variables
spring_sal_vec_2021 <- as.vector(spring_sal_2021)
spring_sal_2021_df <- data.frame(cbind(spring_lonlattime9, spring_sal_vec_2021))
spring_sal_2021_df <- rename(spring_sal_2021_df, longitude = Var1, latitude=Var2, time=Var3, sal = spring_sal_vec_2021)

#2022
#Look directly into netcdf file and pull data directly from it
sal_spring_2022 <- nc_open('sal_spring_2022.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_spring_2022, "longitude")
lat <- ncvar_get(sal_spring_2022, "latitude")
time10 <- ncvar_get(sal_spring_2022, "time")
sal <- ncvar_get(sal_spring_2022, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits10 <- ncatt_get(sal_spring_2022, "time", "units") #Look at time unit
time_vector10 <- as.POSIXct(time10, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
springstart10 <- as.POSIXct("2022-04-01", tz="GMT")
springend10 <- as.POSIXct("2022-06-30", tz="GMT")
spring_sub10 <- (time_vector10 > springstart10) & (time_vector10 < springend10)

#Bring in variables from subset
spring_sal_2022 <- sal[,,spring_sub10]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
spring_lonlattime10 <- as.matrix(expand.grid(lon, lat, time_vector10[time_vector10 >= springstart10 & time_vector10 <= springend10]))

#Vectors of subsetted variables
spring_sal_vec_2022 <- as.vector(spring_sal_2022)
spring_sal_2022_df <- data.frame(cbind(spring_lonlattime10, spring_sal_vec_2022))
spring_sal_2022_df <- rename(spring_sal_2022_df, longitude = Var1, latitude=Var2, time=Var3, sal= spring_sal_vec_2022)

#MATURE MALES
spring_whitemale_df <- data.frame(rbind(spring_sal_2017_df, spring_sal_2018_df, spring_sal_2019_df, spring_sal_2020_df,
                                        spring_sal_2021_df, spring_sal_2022_df))
spring_whitemale_df$sal = as.numeric(spring_whitemale_df$sal)
spring_whitemale_df$longitude = as.numeric(spring_whitemale_df$longitude)
spring_whitemale_df$latitude = as.numeric(spring_whitemale_df$latitude)
spring_whitemale_df2 <- spring_whitemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#MATURE FEMALES
spring_whitefemale_df <- data.frame(rbind(spring_sal_2013_df, spring_sal_2014_df, spring_sal_2015_df, spring_sal_2016_df, spring_sal_2017_df, 
                                          spring_sal_2018_df, spring_sal_2019_df, spring_sal_2020_df, spring_sal_2021_df))
spring_whitefemale_df$sal = as.numeric(spring_whitefemale_df$sal)
spring_whitefemale_df$longitude = as.numeric(spring_whitefemale_df$longitude)
spring_whitefemale_df$latitude = as.numeric(spring_whitefemale_df$latitude)
spring_whitefemale_df2 <- spring_whitefemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#SUB-ADULTS
spring_sub_df <- data.frame(rbind(spring_sal_2014_df, spring_sal_2015_df, spring_sal_2016_df, spring_sal_2017_df, 
                                  spring_sal_2018_df, spring_sal_2019_df, spring_sal_2020_df, spring_sal_2021_df))
spring_sub_df$sal = as.numeric(spring_sub_df$sal)
spring_sub_df$longitude = as.numeric(spring_sub_df$longitude)
spring_sub_df$latitude = as.numeric(spring_sub_df$latitude)
spring_sub_df2 <- spring_sub_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#YOY
spring_yoy_df <- data.frame(rbind(spring_sal_2017_df, spring_sal_2018_df))
spring_yoy_df$sal = as.numeric(spring_yoy_df$sal)
spring_yoy_df$longitude = as.numeric(spring_yoy_df$longitude)
spring_yoy_df$latitude = as.numeric(spring_yoy_df$latitude)
spring_yoy_df2 <- spring_yoy_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#________________________________________________________________________________________
#SUMMER
#2013
#Look directly into netcdf file and pull data directly from it
sal_summer_2013 <- nc_open('sal_summer_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2013, "longitude")
lat <- ncvar_get(sal_summer_2013, "latitude")
time1 <- ncvar_get(sal_summer_2013, "time")
sal <- ncvar_get(sal_summer_2013, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(sal_summer_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart1 <- as.POSIXct("2013-07-01", tz="GMT")
summerend1 <- as.POSIXct("2013-09-30", tz="GMT")
summer_sub1 <- (time_vector1 > summerstart1) & (time_vector1 < summerend1)

#Bring in variables from subset
summer_sal_2013 <- sal[,,summer_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= summerstart1 & time_vector1 <= summerend1]))

#Vectors of subsetted variables
summer_sal_vec_2013 <- as.vector(summer_sal_2013)
summer_sal_2013_df <- data.frame(cbind(summer_lonlattime1, summer_sal_vec_2013))
summer_sal_2013_df<- rename(summer_sal_2013_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
sal_summer_2014 <- nc_open('sal_summer_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2014, "longitude")
lat <- ncvar_get(sal_summer_2014, "latitude")
time2 <- ncvar_get(sal_summer_2014, "time")
sal <- ncvar_get(sal_summer_2014, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(sal_summer_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart2 <- as.POSIXct("2014-07-01", tz="GMT")
summerend2 <- as.POSIXct("2014-09-30", tz="GMT")
summer_sub2 <- (time_vector2 > summerstart2) & (time_vector2 < summerend2)

#Bring in variables from subset
summer_sal_2014 <- sal[,,summer_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= summerstart2 & time_vector2 <= summerend2]))

#Vectors of subsetted variables
summer_sal_vec_2014 <- as.vector(summer_sal_2014)
summer_sal_2014_df <- data.frame(cbind(summer_lonlattime2,summer_sal_vec_2014))
summer_sal_2014_df <- rename(summer_sal_2014_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
sal_summer_2015 <- nc_open('sal_summer_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2015, "longitude")
lat <- ncvar_get(sal_summer_2015, "latitude")
time3 <- ncvar_get(sal_summer_2015, "time")
sal <- ncvar_get(sal_summer_2015, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(sal_summer_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart3 <- as.POSIXct("2015-07-01", tz="GMT")
summerend3 <- as.POSIXct("2015-09-30", tz="GMT")
summer_sub3 <- (time_vector3 > summerstart3) & (time_vector3 < summerend3)

#Bring in variables from subset
summer_sal_2015 <- sal[,,summer_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= summerstart3 & time_vector3 <= summerend3]))

#Vectors of subsetted variables
summer_sal_vec_2015 <- as.vector(summer_sal_2015)
summer_sal_2015_df <- data.frame(cbind(summer_lonlattime3,summer_sal_vec_2015))
summer_sal_2015_df <- rename(summer_sal_2015_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2015)

#2016
#Look directly into netcdf file and pull data directly from it
sal_summer_2016 <- nc_open('sal_summer_2016.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2015, "longitude")
lat <- ncvar_get(sal_summer_2015, "latitude")
time4 <- ncvar_get(sal_summer_2015, "time")
sal <- ncvar_get(sal_summer_2015, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits4 <- ncatt_get(sal_summer_2016, "time", "units") #Look at time unit
time_vector4 <- as.POSIXct(time4, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart4 <- as.POSIXct("2016-07-01", tz="GMT")
summerend4 <- as.POSIXct("2016-09-30", tz="GMT")
summer_sub4 <- (time_vector4 > summerstart4) & (time_vector4 < summerend4)

#Bring in variables from subset
summer_sal_2016 <- sal[,,summer_sub4]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime4 <- as.matrix(expand.grid(lon, lat, time_vector4[time_vector4 >= summerstart4 & time_vector4 <= summerend4]))

#Vectors of subsetted variables
summer_sal_vec_2016 <- as.vector(summer_sal_2016)
summer_sal_2016_df <- data.frame(cbind(summer_lonlattime4,summer_sal_vec_2016))
summer_sal_2016_df <- rename(summer_sal_2016_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2016)

#2017
#Look directly into netcdf file and pull data directly from it
sal_summer_2017 <- nc_open('sal_summer_2017.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2017, "longitude")
lat <- ncvar_get(sal_summer_2017, "latitude")
time5 <- ncvar_get(sal_summer_2017, "time")
sal <- ncvar_get(sal_summer_2017, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits5 <- ncatt_get(sal_summer_2017, "time", "units") #Look at time unit
time_vector5 <- as.POSIXct(time5, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart5 <- as.POSIXct("2017-07-01", tz="GMT")
summerend5 <- as.POSIXct("2017-09-30", tz="GMT")
summer_sub5 <- (time_vector5 > summerstart5) & (time_vector5 < summerend5)

#Bring in variables from subset
summer_sal_2017 <- sal[,,summer_sub5]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime5 <- as.matrix(expand.grid(lon, lat, time_vector5[time_vector5 >= summerstart5 & time_vector5 <= summerend5]))

#Vectors of subsetted variables
summer_sal_vec_2017 <- as.vector(summer_sal_2017)
summer_sal_2017_df <- data.frame(cbind(summer_lonlattime5,summer_sal_vec_2017))
summer_sal_2017_df <- rename(summer_sal_2017_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2017)

#2018
#Look directly into netcdf file and pull data directly from it
sal_summer_2018 <- nc_open('sal_summer_2018.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2018, "longitude")
lat <- ncvar_get(sal_summer_2018, "latitude")
time6 <- ncvar_get(sal_summer_2018, "time")
sal <- ncvar_get(sal_summer_2018, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits6 <- ncatt_get(sal_summer_2018, "time", "units") #Look at time unit
time_vector6 <- as.POSIXct(time6, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart6 <- as.POSIXct("2018-07-01", tz="GMT")
summerend6 <- as.POSIXct("2018-09-30", tz="GMT")
summer_sub6 <- (time_vector6 > summerstart6) & (time_vector6 < summerend6)

#Bring in variables from subset
summer_sal_2018 <- sal[,,summer_sub6]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime6 <- as.matrix(expand.grid(lon, lat, time_vector6[time_vector6 >= summerstart6 & time_vector6 <= summerend6]))

#Vectors of subsetted variables
summer_sal_vec_2018 <- as.vector(summer_sal_2018)
summer_sal_2018_df <- data.frame(cbind(summer_lonlattime6,summer_sal_vec_2018))
summer_sal_2018_df <- rename(summer_sal_2018_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2018)

#2019
#Look directly into netcdf file and pull data directly from it
sal_summer_2019 <- nc_open('sal_summer_2019.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2019, "longitude")
lat <- ncvar_get(sal_summer_2019, "latitude")
time7 <- ncvar_get(sal_summer_2019, "time")
sal <- ncvar_get(sal_summer_2019, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits7 <- ncatt_get(sal_summer_2019, "time", "units") #Look at time unit
time_vector7 <- as.POSIXct(time7, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart7 <- as.POSIXct("2019-07-01", tz="GMT")
summerend7 <- as.POSIXct("2019-09-30", tz="GMT")
summer_sub7 <- (time_vector7 > summerstart7) & (time_vector7 < summerend7)

#Bring in variables from subset
summer_sal_2019 <- sal[,,summer_sub7]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime7 <- as.matrix(expand.grid(lon, lat, time_vector7[time_vector7 >= summerstart7 & time_vector7 <= summerend7]))

#Vectors of subsetted variables
summer_sal_vec_2019 <- as.vector(summer_sal_2019)
summer_sal_2019_df <- data.frame(cbind(summer_lonlattime7,summer_sal_vec_2019))
summer_sal_2019_df <- rename(summer_sal_2019_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2019)

#2020
#Look directly into netcdf file and pull data directly from it
sal_summer_2020 <- nc_open('sal_summer_2020.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2020, "longitude")
lat <- ncvar_get(sal_summer_2020, "latitude")
time8 <- ncvar_get(sal_summer_2020, "time")
sal <- ncvar_get(sal_summer_2020, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits8 <- ncatt_get(sal_summer_2020, "time", "units") #Look at time unit
time_vector8 <- as.POSIXct(time8, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart8 <- as.POSIXct("2020-07-01", tz="GMT")
summerend8 <- as.POSIXct("2020-09-30", tz="GMT")
summer_sub8 <- (time_vector8 > summerstart8) & (time_vector8 < summerend8)

#Bring in variables from subset
summer_sal_2020 <- sal[,,summer_sub8]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime8 <- as.matrix(expand.grid(lon, lat, time_vector8[time_vector8 >= summerstart8 & time_vector8 <= summerend8]))

#Vectors of subsetted variables
summer_sal_vec_2020 <- as.vector(summer_sal_2020)
summer_sal_2020_df <- data.frame(cbind(summer_lonlattime8,summer_sal_vec_2020))
summer_sal_2020_df <- rename(summer_sal_2020_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2020)

#2021
#Look directly into netcdf file and pull data directly from it
sal_summer_2021 <- nc_open('sal_summer_2021.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_summer_2021, "longitude")
lat <- ncvar_get(sal_summer_2021, "latitude")
time9 <- ncvar_get(sal_summer_2021, "time")
sal <- ncvar_get(sal_summer_2021, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits9 <- ncatt_get(sal_summer_2021, "time", "units") #Look at time unit
time_vector9 <- as.POSIXct(time9, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
summerstart9 <- as.POSIXct("2021-07-01", tz="GMT")
summerend9 <- as.POSIXct("2021-09-30", tz="GMT")
summer_sub9 <- (time_vector9 > summerstart9) & (time_vector9 < summerend9)

#Bring in variables from subset
summer_sal_2021 <- sal[,,summer_sub9]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
summer_lonlattime9 <- as.matrix(expand.grid(lon, lat, time_vector9[time_vector9 >= summerstart9 & time_vector9 <= summerend9]))

#Vectors of subsetted variables
summer_sal_vec_2021 <- as.vector(summer_sal_2021)
summer_sal_2021_df <- data.frame(cbind(summer_lonlattime9,summer_sal_vec_2021))
summer_sal_2021_df <- rename(summer_sal_2021_df, longitude = Var1, latitude=Var2, time=Var3, sal = summer_sal_vec_2021)

#MATURE MALES
summer_whitemale_df <- data.frame(rbind(summer_sal_2017_df, summer_sal_2018_df, summer_sal_2019_df, summer_sal_2020_df, 
                                        summer_sal_2021_df))
summer_whitemale_df$sal = as.numeric(summer_whitemale_df$sal)
summer_whitemale_df$longitude = as.numeric(summer_whitemale_df$longitude)
summer_whitemale_df$latitude = as.numeric(summer_whitemale_df$latitude)
summer_whitemale_df2 <- summer_whitemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#MATURE FEMALES
summer_whitefemale_df <- data.frame(rbind(summer_sal_2013_df, summer_sal_2014_df, summer_sal_2015_df, summer_sal_2016_df, summer_sal_2017_df, 
                                          summer_sal_2018_df, summer_sal_2019_df, summer_sal_2020_df))
summer_whitefemale_df$sal = as.numeric(summer_whitefemale_df$sal)
summer_whitefemale_df$longitude = as.numeric(summer_whitefemale_df$longitude)
summer_whitefemale_df$latitude = as.numeric(summer_whitefemale_df$latitude)
summer_whitefemale_df2 <- summer_whitefemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#SUB-ADULTS
summer_sub_df <- data.frame(rbind(summer_sal_2013_df, summer_sal_2014_df, summer_sal_2015_df,summer_sal_2016_df, summer_sal_2017_df, 
                                  summer_sal_2018_df, summer_sal_2019_df, summer_sal_2020_df, summer_sal_2021_df))
summer_sub_df$sal = as.numeric(summer_sub_df$sal)
summer_sub_df$longitude = as.numeric(summer_sub_df$longitude)
summer_sub_df$latitude = as.numeric(summer_sub_df$latitude)
summer_sub_df2 <- summer_sub_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#YOY
summer_yoy_df <- data.frame(rbind(summer_sal_2016_df, summer_sal_2017_df, summer_sal_2018_df))
summer_yoy_df$sal = as.numeric(summer_yoy_df$sal)
summer_yoy_df$longitude = as.numeric(summer_yoy_df$longitude)
summer_yoy_df$latitude = as.numeric(summer_yoy_df$latitude)
summer_yoy_df2 <- summer_yoy_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#_____________________________________________________________________________________________________________
#AUTUMN
#2013
#Look directly into netcdf file and pull data directly from it
sal_autumn_2013 <- nc_open('sal_autumn_2013.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2013, "longitude")
lat <- ncvar_get(sal_autumn_2013, "latitude")
time1 <- ncvar_get(sal_autumn_2013, "time")
sal <- ncvar_get(sal_autumn_2013, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits1 <- ncatt_get(sal_autumn_2013, "time", "units") #Look at time unit
time_vector1 <- as.POSIXct(time1, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart1 <- as.POSIXct("2013-10-01", tz="GMT")
autumnend1 <- as.POSIXct("2013-12-31", tz="GMT")
autumn_sub1 <- (time_vector1 > autumnstart1) & (time_vector1 < autumnend1)

#Bring in variables from subset
autumn_sal_2013 <- sal[,,autumn_sub1]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime1 <- as.matrix(expand.grid(lon, lat, time_vector1[time_vector1 >= autumnstart1 & time_vector1 <= autumnend1]))

#Vectors of subsetted variables
autumn_sal_vec_2013 <- as.vector(autumn_sal_2013)
autumn_sal_2013_df <- data.frame(cbind(autumn_lonlattime1, autumn_sal_vec_2013))
autumn_sal_2013_df <- rename(autumn_sal_2013_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2013) 

#2014
#Look directly into netcdf file and pull data directly from it
sal_autumn_2014 <- nc_open('sal_autumn_2014.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2014, "longitude")
lat <- ncvar_get(sal_autumn_2014, "latitude")
time2 <- ncvar_get(sal_autumn_2014, "time")
sal <- ncvar_get(sal_autumn_2014, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits2 <- ncatt_get(sal_autumn_2014, "time", "units") #Look at time unit
time_vector2 <- as.POSIXct(time2, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart2 <- as.POSIXct("2014-10-01", tz="GMT")
autumnend2 <- as.POSIXct("2014-12-31", tz="GMT")
autumn_sub2 <- (time_vector2 > autumnstart2) & (time_vector2 < autumnend2)

#Bring in variables from subset
autumn_sal_2014 <- sal[,,autumn_sub2]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime2 <- as.matrix(expand.grid(lon, lat, time_vector2[time_vector2 >= autumnstart2 & time_vector2 <= autumnend2]))

#Vectors of subsetted variables
autumn_sal_vec_2014 <- as.vector(autumn_sal_2014)
autumn_sal_2014_df <- data.frame(cbind(autumn_lonlattime2, autumn_sal_vec_2014))
autumn_sal_2014_df <- rename(autumn_sal_2014_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2014) 

#2015
#Look directly into netcdf file and pull data directly from it
sal_autumn_2015 <- nc_open('sal_autumn_2015.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2015, "longitude")
lat <- ncvar_get(sal_autumn_2015, "latitude")
time3 <- ncvar_get(sal_autumn_2015, "time")
sal <- ncvar_get(sal_autumn_2015, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits3 <- ncatt_get(sal_autumn_2015, "time", "units") #Look at time unit
time_vector3 <- as.POSIXct(time3, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart3 <- as.POSIXct("2015-10-01", tz="GMT")
autumnend3 <- as.POSIXct("2015-12-31", tz="GMT")
autumn_sub3 <- (time_vector3 > autumnstart3) & (time_vector3 < autumnend3)

#Bring in variables from subset
autumn_sal_2015 <- sal[,,autumn_sub3]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime3 <- as.matrix(expand.grid(lon, lat, time_vector3[time_vector3 >= autumnstart3 & time_vector3 <= autumnend3]))

#Vectors of subsetted variables
autumn_sal_vec_2015 <- as.vector(autumn_sal_2015)
autumn_sal_2015_df <- data.frame(cbind(autumn_lonlattime3, autumn_sal_vec_2015))
autumn_sal_2015_df <- rename(autumn_sal_2015_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2015) 

#2016
#Look directly into netcdf file and pull data directly from it
sal_autumn_2016 <- nc_open('sal_autumn_2016.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2016, "longitude")
lat <- ncvar_get(sal_autumn_2016, "latitude")
time4 <- ncvar_get(sal_autumn_2016, "time")
sal <- ncvar_get(sal_autumn_2016, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits4 <- ncatt_get(sal_autumn_2016, "time", "units") #Look at time unit
time_vector4 <- as.POSIXct(time4, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart4 <- as.POSIXct("2016-10-01", tz="GMT")
autumnend4 <- as.POSIXct("2016-12-31", tz="GMT")
autumn_sub4 <- (time_vector4 > autumnstart4) & (time_vector4 < autumnend4)

#Bring in variables from subset
autumn_sal_2016 <- sal[,,autumn_sub4]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime4 <- as.matrix(expand.grid(lon, lat, time_vector4[time_vector4 >= autumnstart4 & time_vector4 <= autumnend4]))

#Vectors of subsetted variables
autumn_sal_vec_2016 <- as.vector(autumn_sal_2016)
autumn_sal_2016_df <- data.frame(cbind(autumn_lonlattime4, autumn_sal_vec_2016))
autumn_sal_2016_df <- rename(autumn_sal_2016_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2016) 

#2017
#Look directly into netcdf file and pull data directly from it
sal_autumn_2017 <- nc_open('sal_autumn_2017.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2017, "longitude")
lat <- ncvar_get(sal_autumn_2017, "latitude")
time5 <- ncvar_get(sal_autumn_2017, "time")
sal <- ncvar_get(sal_autumn_2017, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits5 <- ncatt_get(sal_autumn_2017, "time", "units") #Look at time unit
time_vector5 <- as.POSIXct(time5, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart5 <- as.POSIXct("2017-10-01", tz="GMT")
autumnend5 <- as.POSIXct("2017-12-31", tz="GMT")
autumn_sub5 <- (time_vector5 > autumnstart5) & (time_vector5 < autumnend5)

#Bring in variables from subset
autumn_sal_2017 <- sal[,,autumn_sub5]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime5 <- as.matrix(expand.grid(lon, lat, time_vector5[time_vector5 >= autumnstart5 & time_vector5 <= autumnend5]))

#Vectors of subsetted variables
autumn_sal_vec_2017 <- as.vector(autumn_sal_2017)
autumn_sal_2017_df <- data.frame(cbind(autumn_lonlattime5, autumn_sal_vec_2017))
autumn_sal_2017_df <- rename(autumn_sal_2017_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2017) 

#2018
#Look directly into netcdf file and pull data directly from it
sal_autumn_2018 <- nc_open('sal_autumn_2018.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2018, "longitude")
lat <- ncvar_get(sal_autumn_2018, "latitude")
time6 <- ncvar_get(sal_autumn_2018, "time")
sal <- ncvar_get(sal_autumn_2018, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits6 <- ncatt_get(sal_autumn_2018, "time", "units") #Look at time unit
time_vector6 <- as.POSIXct(time6, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart6 <- as.POSIXct("2018-10-01", tz="GMT")
autumnend6 <- as.POSIXct("2018-12-31", tz="GMT")
autumn_sub6 <- (time_vector6 > autumnstart6) & (time_vector6 < autumnend6)

#Bring in variables from subset
autumn_sal_2018 <- sal[,,autumn_sub6]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime6 <- as.matrix(expand.grid(lon, lat, time_vector6[time_vector6 >= autumnstart6 & time_vector6 <= autumnend6]))

#Vectors of subsetted variables
autumn_sal_vec_2018 <- as.vector(autumn_sal_2018)
autumn_sal_2018_df <- data.frame(cbind(autumn_lonlattime6, autumn_sal_vec_2018))
autumn_sal_2018_df <- rename(autumn_sal_2018_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2018) 

#2019
#Look directly into netcdf file and pull data directly from it
sal_autumn_2019 <- nc_open('sal_autumn_2019.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2019, "longitude")
lat <- ncvar_get(sal_autumn_2019, "latitude")
time7 <- ncvar_get(sal_autumn_2019, "time")
sal <- ncvar_get(sal_autumn_2019, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits7 <- ncatt_get(sal_autumn_2019, "time", "units") #Look at time unit
time_vector7 <- as.POSIXct(time7, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart7 <- as.POSIXct("2019-10-01", tz="GMT")
autumnend7 <- as.POSIXct("2019-12-31", tz="GMT")
autumn_sub7 <- (time_vector7 > autumnstart7) & (time_vector7 < autumnend7)

#Bring in variables from subset
autumn_sal_2019 <- sal[,,autumn_sub7]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime7 <- as.matrix(expand.grid(lon, lat, time_vector7[time_vector7 >= autumnstart7 & time_vector7 <= autumnend7]))

#Vectors of subsetted variables
autumn_sal_vec_2019 <- as.vector(autumn_sal_2019)
autumn_sal_2019_df <- data.frame(cbind(autumn_lonlattime7, autumn_sal_vec_2019))
autumn_sal_2019_df <- rename(autumn_sal_2019_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2019) 

#2020
#Look directly into netcdf file and pull data directly from it
sal_autumn_2020 <- nc_open('sal_autumn_2020.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2020, "longitude")
lat <- ncvar_get(sal_autumn_2020, "latitude")
time8 <- ncvar_get(sal_autumn_2020, "time")
sal <- ncvar_get(sal_autumn_2020, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits8 <- ncatt_get(sal_autumn_2020, "time", "units") #Look at time unit
time_vector8 <- as.POSIXct(time8, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart8 <- as.POSIXct("2020-10-01", tz="GMT")
autumnend8 <- as.POSIXct("2020-12-31", tz="GMT")
autumn_sub8 <- (time_vector8 > autumnstart8) & (time_vector8 < autumnend8)

#Bring in variables from subset
autumn_sal_2020 <- sal[,,autumn_sub8]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime8 <- as.matrix(expand.grid(lon, lat, time_vector8[time_vector8 >= autumnstart8 & time_vector8 <= autumnend8]))

#Vectors of subsetted variables
autumn_sal_vec_2020 <- as.vector(autumn_sal_2020)
autumn_sal_2020_df <- data.frame(cbind(autumn_lonlattime8, autumn_sal_vec_2020))
autumn_sal_2020_df <- rename(autumn_sal_2020_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2020) 

#2021
#Look directly into netcdf file and pull data directly from it
sal_autumn_2021 <- nc_open('sal_autumn_2021.nc')
#You may have a separate file for each variable - we can combine those later

#Identify variables - use the names used in the netCDF data
lon <- ncvar_get(sal_autumn_2021, "longitude")
lat <- ncvar_get(sal_autumn_2021, "latitude")
time9 <- ncvar_get(sal_autumn_2021, "time")
sal <- ncvar_get(sal_autumn_2021, "sss")

#Make time human-readable
#Check "tunits" and adjust accordingly, may differ a little from this example
tunits9 <- ncatt_get(sal_autumn_2021, "time", "units") #Look at time unit
time_vector9 <- as.POSIXct(time9, origin='1970-01-01 00:00:00', tz="GMT")

#Time subset from netcdf
autumnstart9 <- as.POSIXct("2021-10-01", tz="GMT")
autumnend9 <- as.POSIXct("2021-12-31", tz="GMT")
autumn_sub9 <- (time_vector9 > autumnstart9) & (time_vector9 < autumnend9)

#Bring in variables from subset
autumn_sal_2021 <- sal[,,autumn_sub9]
##Build a data frame out of netcdf bits

#Matrix of lon, lat, time (within subset)
autumn_lonlattime9 <- as.matrix(expand.grid(lon, lat, time_vector9[time_vector9 >= autumnstart9 & time_vector9 <= autumnend9]))

#Vectors of subsetted variables
autumn_sal_vec_2021 <- as.vector(autumn_sal_2021)
autumn_sal_2021_df <- data.frame(cbind(autumn_lonlattime9, autumn_sal_vec_2021))
autumn_sal_2021_df <- rename(autumn_sal_2021_df, longitude = Var1, latitude=Var2, time=Var3, sal = autumn_sal_vec_2021) 

#MATURE MALES
autumn_whitemale_df <- data.frame(rbind(autumn_sal_2017_df, autumn_sal_2018_df, autumn_sal_2019_df, 
                                        autumn_sal_2020_df, autumn_sal_2021_df))
autumn_whitemale_df$sal = as.numeric(autumn_whitemale_df$sal)
autumn_whitemale_df$longitude = as.numeric(autumn_whitemale_df$longitude)
autumn_whitemale_df$latitude = as.numeric(autumn_whitemale_df$latitude)
autumn_whitemale_df2 <- autumn_whitemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#MATURE FEMALES
autumn_whitefemale_df <- data.frame(rbind(autumn_sal_2013_df, autumn_sal_2014_df, autumn_sal_2015_df, autumn_sal_2016_df, autumn_sal_2017_df, 
                                          autumn_sal_2018_df, autumn_sal_2019_df, autumn_sal_2020_df))
autumn_whitefemale_df$sal = as.numeric(autumn_whitefemale_df$sal)
autumn_whitefemale_df$longitude = as.numeric(autumn_whitefemale_df$longitude)
autumn_whitefemale_df$latitude = as.numeric(autumn_whitefemale_df$latitude)
autumn_whitefemale_df2 <- autumn_whitefemale_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#SUB-ADULTS
autumn_sub_df <- data.frame(rbind(autumn_sal_2013_df, autumn_sal_2014_df, autumn_sal_2015_df, autumn_sal_2016_df, autumn_sal_2017_df, 
                                  autumn_sal_2018_df, autumn_sal_2019_df, autumn_sal_2020_df, autumn_sal_2021_df))
autumn_sub_df$sal = as.numeric(autumn_sub_df$sal)
autumn_sub_df$longitude = as.numeric(autumn_sub_df$longitude)
autumn_sub_df$latitude = as.numeric(autumn_sub_df$latitude)
autumn_sub_df2 <- autumn_sub_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#YOY
autumn_yoy_df <- data.frame(rbind(autumn_sal_2016_df, autumn_sal_2017_df, autumn_sal_2018_df))
autumn_yoy_df$sal = as.numeric(autumn_yoy_df$sal)
autumn_yoy_df$longitude = as.numeric(autumn_yoy_df$longitude)
autumn_yoy_df$latitude = as.numeric(autumn_yoy_df$latitude)
autumn_yoy_df2 <- autumn_yoy_df %>% mutate(across(everything(), ~ifelse(is.nan(.), NA, .))) #change NaNs to NAs

#save all the big data frames
#winter
save(winter_whitemale_df2, file = "WM_sal_winter_df")
save(winter_whitefemale_df2, file= "WF_sal_winter_df")
save(winter_sub_df2, file = "WSA_sal_winter_df")
save(winter_yoy_df2, file = "WYOY_sal_winter_df")
#spring
save(spring_whitemale_df2, file = "WM_sal_spring_df")
save(spring_whitefemale_df2, file = "WF_sal_spring_df")
save(spring_sub_df2, file = "WSA_sal_spring_df")
save(spring_yoy_df2, file = "WYOY_sal_spring_df")
#summer
save(summer_whitemale_df2, file = "WM_sal_summer_df")
save(summer_whitefemale_df2, file = "WF_sal_summer_df")
save(summer_sub_df2, file = "WSA_sal_summer_df")
save(summer_yoy_df2, file = "WYOY_sal_summer_df")
#autumn
save(autumn_whitemale_df2, file = "WM_sal_autumn_df")
save(autumn_whitefemale_df2, file = "WF_sal_autumn_df")
save(autumn_sub_df2, file = "WSA_sal_autumn_df")
save(autumn_yoy_df2, file = "WYOY_sal_autumn_df")

#___________________________________________________________________________________________
#NEED TO RASTERIZE DATA FRAMES
#Winter
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/NC_white/Salinity/Winter")
load("WM_sal_winter_df")
load("WF_sal_winter_df")
load("WSA_sal_winter_df")
load("WYOY_sal_winter_df")

#Mature males
WM_sal_winter_df2<-winter_whitemale_df2[,c(1,2,4)]

winter_WM_mask <- rast(nrows = length(unique(round(WM_sal_winter_df2$latitude, 5))),
                       ncol = length(unique(round(WM_sal_winter_df2$longitude, 5))),
                       xmin = min(WM_sal_winter_df2$longitude), xmax = max(WM_sal_winter_df2$longitude),
                       ymin = min(WM_sal_winter_df2$latitude), ymax = max(WM_sal_winter_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

winter_WM_vect <- vect(
  WM_sal_winter_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WM_winter_sal_rast <- terra::rasterize(
  winter_WM_vect,
  winter_WM_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WM_winter_sal_rast<- rename(WM_winter_sal_rast, salinity=last)

#Mature females
WF_sal_winter_df2<-winter_whitefemale_df2[,c(1,2,4)]

winter_WF_mask <- rast(nrows = length(unique(round(WF_sal_winter_df2$latitude, 5))),
                       ncol = length(unique(round(WF_sal_winter_df2$longitude, 5))),
                       xmin = min(WF_sal_winter_df2$longitude), xmax = max(WF_sal_winter_df2$longitude),
                       ymin = min(WF_sal_winter_df2$latitude), ymax = max(WF_sal_winter_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

winter_WF_vect <- vect(
  WF_sal_winter_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WF_winter_sal_rast <- terra::rasterize(
  winter_WF_vect,
  winter_WF_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WF_winter_sal_rast<- rename(WF_winter_sal_rast, salinity=last)

#Sub-adults
WSA_sal_winter_df2<-winter_sub_df2[,c(1,2,4)]

winter_WSA_mask <- rast(nrows = length(unique(round(WSA_sal_winter_df2$latitude, 5))),
                        ncol = length(unique(round(WSA_sal_winter_df2$longitude, 5))),
                        xmin = min(WSA_sal_winter_df2$longitude), xmax = max(WSA_sal_winter_df2$longitude),
                        ymin = min(WSA_sal_winter_df2$latitude), ymax = max(WSA_sal_winter_df2$latitude),
                        crs = '+proj=longlat +datum=WGS84')

winter_WSA_vect <- vect(
  WSA_sal_winter_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WSA_winter_sal_rast <- terra::rasterize(
  winter_WSA_vect,
  winter_WSA_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WSA_winter_sal_rast<- rename(WSA_winter_sal_rast, salinity=last)

#Young of year
WYOY_sal_winter_df2<-winter_yoy_df2[,c(1,2,4)]

winter_WYOY_mask <- rast(nrows = length(unique(round(WYOY_sal_winter_df2$latitude, 5))),
                         ncol = length(unique(round(WYOY_sal_winter_df2$longitude, 5))),
                         xmin = min(WYOY_sal_winter_df2$longitude), xmax = max(WYOY_sal_winter_df2$longitude),
                         ymin = min(WYOY_sal_winter_df2$latitude), ymax = max(WYOY_sal_winter_df2$latitude),
                         crs = '+proj=longlat +datum=WGS84')

winter_WYOY_vect <- vect(
  WYOY_sal_winter_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WYOY_winter_sal_rast <- terra::rasterize(
  winter_WYOY_vect,
  winter_WYOY_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WYOY_winter_sal_rast<- rename(WYOY_winter_sal_rast, salinity=last)

#___________________________________________________________________________________________
#Spring
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/NC_white/Salinity/Spring")
load("WM_sal_spring_df")
load("WF_sal_spring_df")
load("WSA_sal_spring_df")
load("WYOY_sal_spring_df")

#Mature males
WM_sal_spring_df2<-spring_whitemale_df2[,c(1,2,4)]

spring_WM_mask <- rast(nrows = length(unique(round(WM_sal_spring_df2$latitude, 5))),
                       ncol = length(unique(round(WM_sal_spring_df2$longitude, 5))),
                       xmin = min(WM_sal_spring_df2$longitude), xmax = max(WM_sal_spring_df2$longitude),
                       ymin = min(WM_sal_spring_df2$latitude), ymax = max(WM_sal_spring_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

spring_WM_vect <- vect(
  WM_sal_spring_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WM_spring_sal_rast <- terra::rasterize(
  spring_WM_vect,
  spring_WM_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WM_spring_sal_rast<- rename(WM_spring_sal_rast, salinity=last)

#Mature females
WF_sal_spring_df2<-spring_whitefemale_df2[,c(1,2,4)]

spring_WF_mask <- rast(nrows = length(unique(round(WF_sal_spring_df2$latitude, 5))),
                       ncol = length(unique(round(WF_sal_spring_df2$longitude, 5))),
                       xmin = min(WF_sal_spring_df2$longitude), xmax = max(WF_sal_spring_df2$longitude),
                       ymin = min(WF_sal_spring_df2$latitude), ymax = max(WF_sal_spring_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

spring_WF_vect <- vect(
  WF_sal_spring_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WF_spring_sal_rast <- terra::rasterize(
  spring_WF_vect,
  spring_WF_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WF_spring_sal_rast<- rename(WF_spring_sal_rast, salinity=last)

#Sub-adults
WSA_sal_spring_df2<-spring_sub_df2[,c(1,2,4)]

spring_WSA_mask <- rast(nrows = length(unique(round(WSA_sal_spring_df2$latitude, 5))),
                        ncol = length(unique(round(WSA_sal_spring_df2$longitude, 5))),
                        xmin = min(WSA_sal_spring_df2$longitude), xmax = max(WSA_sal_spring_df2$longitude),
                        ymin = min(WSA_sal_spring_df2$latitude), ymax = max(WSA_sal_spring_df2$latitude),
                        crs = '+proj=longlat +datum=WGS84')

spring_WSA_vect <- vect(
  WSA_sal_spring_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WSA_spring_sal_rast <- terra::rasterize(
  spring_WSA_vect,
  spring_WSA_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WSA_spring_sal_rast<- rename(WSA_spring_sal_rast, salinity=last)

#Young of year
WYOY_sal_spring_df2<-spring_yoy_df2[,c(1,2,4)]

spring_WYOY_mask <- rast(nrows = length(unique(round(WYOY_sal_spring_df2$latitude, 5))),
                         ncol = length(unique(round(WYOY_sal_spring_df2$longitude, 5))),
                         xmin = min(WYOY_sal_spring_df2$longitude), xmax = max(WYOY_sal_spring_df2$longitude),
                         ymin = min(WYOY_sal_spring_df2$latitude), ymax = max(WYOY_sal_spring_df2$latitude),
                         crs = '+proj=longlat +datum=WGS84')

spring_WYOY_vect <- vect(
  WYOY_sal_spring_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WYOY_spring_sal_rast <- terra::rasterize(
  spring_WYOY_vect,
  spring_WYOY_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WYOY_spring_sal_rast<- rename(WYOY_spring_sal_rast, salinity=last)

#___________________________________________________________________________________________
#Summer
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/NC_white/Salinity/Summer")
load("WM_sal_summer_df")
load("WF_sal_summer_df")
load("WSA_sal_summer_df")
load("WYOY_sal_summer_df")

#Mature males
WM_sal_summer_df2<-summer_whitemale_df2[,c(1,2,4)]

summer_WM_mask <- rast(nrows = length(unique(round(WM_sal_summer_df2$latitude, 5))),
                       ncol = length(unique(round(WM_sal_summer_df2$longitude, 5))),
                       xmin = min(WM_sal_summer_df2$longitude), xmax = max(WM_sal_summer_df2$longitude),
                       ymin = min(WM_sal_summer_df2$latitude), ymax = max(WM_sal_summer_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

summer_WM_vect <- vect(
  WM_sal_summer_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WM_summer_sal_rast <- terra::rasterize(
  summer_WM_vect,
  summer_WM_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WM_summer_sal_rast <- rename(WM_summer_sal_rast, salinity=last)

#Mature females
WF_sal_summer_df2<-summer_whitefemale_df2[,c(1,2,4)]

summer_WF_mask <- rast(nrows = length(unique(round(WF_sal_summer_df2$latitude, 5))),
                       ncol = length(unique(round(WF_sal_summer_df2$longitude, 5))),
                       xmin = min(WF_sal_summer_df2$longitude), xmax = max(WF_sal_summer_df2$longitude),
                       ymin = min(WF_sal_summer_df2$latitude), ymax = max(WF_sal_summer_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

summer_WF_vect <- vect(
  WF_sal_summer_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WF_summer_sal_rast <- terra::rasterize(
  summer_WF_vect,
  summer_WF_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WF_summer_sal_rast <- rename(WF_summer_sal_rast, salinity=last)

#Sub-adults
WSA_sal_summer_df2<-summer_sub_df2[,c(1,2,4)]

summer_WSA_mask <- rast(nrows = length(unique(round(WSA_sal_summer_df2$latitude, 5))),
                        ncol = length(unique(round(WSA_sal_summer_df2$longitude, 5))),
                        xmin = min(WSA_sal_summer_df2$longitude), xmax = max(WSA_sal_summer_df2$longitude),
                        ymin = min(WSA_sal_summer_df2$latitude), ymax = max(WSA_sal_summer_df2$latitude),
                        crs = '+proj=longlat +datum=WGS84')

summer_WSA_vect <- vect(
  WSA_sal_summer_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WSA_summer_sal_rast <- terra::rasterize(
  summer_WSA_vect,
  summer_WSA_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WSA_summer_sal_rast <- rename(WSA_summer_sal_rast, salinity=last)

#Young of year
WYOY_sal_summer_df2<-summer_yoy_df2[,c(1,2,4)]

summer_WYOY_mask <- rast(nrows = length(unique(round(WYOY_sal_summer_df2$latitude, 5))),
                       ncol = length(unique(round(WYOY_sal_summer_df2$longitude, 5))),
                       xmin = min(WYOY_sal_summer_df2$longitude), xmax = max(WYOY_sal_summer_df2$longitude),
                       ymin = min(WYOY_sal_summer_df2$latitude), ymax = max(WYOY_sal_summer_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

summer_WYOY_vect <- vect(
  WYOY_sal_summer_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WYOY_summer_sal_rast <- terra::rasterize(
  summer_WYOY_vect,
  summer_WYOY_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WYOY_summer_sal_rast <- rename(WYOY_summer_sal_rast, salinity=last)

#___________________________________________________________________________________________
#Autumn
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/NC_white/Salinity/Autumn")
load("WM_sal_autumn_df")
load("WF_sal_autumn_df")
load("WSA_sal_autumn_df")
load("WYOY_sal_autumn_df")

#Mature males
WM_sal_autumn_df2<-autumn_whitemale_df2[,c(1,2,4)]

autumn_WM_mask <- rast(nrows = length(unique(round(WM_sal_autumn_df2$latitude, 5))),
                       ncol = length(unique(round(WM_sal_autumn_df2$longitude, 5))),
                       xmin = min(WM_sal_autumn_df2$longitude), xmax = max(WM_sal_autumn_df2$longitude),
                       ymin = min(WM_sal_autumn_df2$latitude), ymax = max(WM_sal_autumn_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

autumn_WM_vect <- vect(
  WM_sal_autumn_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WM_autumn_sal_rast <- terra::rasterize(
  autumn_WM_vect,
  autumn_WM_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WM_autumn_sal_rast<- rename(WM_autumn_sal_rast, salinity=last)

#Mature females
WF_sal_autumn_df2<-autumn_whitefemale_df2[,c(1,2,4)]

autumn_WF_mask <- rast(nrows = length(unique(round(WF_sal_autumn_df2$latitude, 5))),
                       ncol = length(unique(round(WF_sal_autumn_df2$longitude, 5))),
                       xmin = min(WF_sal_autumn_df2$longitude), xmax = max(WF_sal_autumn_df2$longitude),
                       ymin = min(WF_sal_autumn_df2$latitude), ymax = max(WF_sal_autumn_df2$latitude),
                       crs = '+proj=longlat +datum=WGS84')

autumn_WF_vect <- vect(
  WF_sal_autumn_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WF_autumn_sal_rast <- terra::rasterize(
  autumn_WF_vect,
  autumn_WF_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WF_autumn_sal_rast<- rename(WF_autumn_sal_rast, salinity=last)

#Sub-adults
WSA_sal_autumn_df2<-autumn_sub_df2[,c(1,2,4)]

autumn_WSA_mask <- rast(nrows = length(unique(round(WSA_sal_autumn_df2$latitude, 5))),
                        ncol = length(unique(round(WSA_sal_autumn_df2$longitude, 5))),
                        xmin = min(WSA_sal_autumn_df2$longitude), xmax = max(WSA_sal_autumn_df2$longitude),
                        ymin = min(WSA_sal_autumn_df2$latitude), ymax = max(WSA_sal_autumn_df2$latitude),
                        crs = '+proj=longlat +datum=WGS84')

autumn_WSA_vect <- vect(
  WSA_sal_autumn_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WSA_autumn_sal_rast <- terra::rasterize(
  autumn_WSA_vect,
  autumn_WSA_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WSA_autumn_sal_rast<- rename(WSA_autumn_sal_rast, salinity=last)

#Young of year
WYOY_sal_autumn_df2<-autumn_yoy_df2[,c(1,2,4)]

autumn_WYOY_mask <- rast(nrows = length(unique(round(WYOY_sal_autumn_df2$latitude, 5))),
                         ncol = length(unique(round(WYOY_sal_autumn_df2$longitude, 5))),
                         xmin = min(WYOY_sal_autumn_df2$longitude), xmax = max(WYOY_sal_autumn_df2$longitude),
                         ymin = min(WYOY_sal_autumn_df2$latitude), ymax = max(WYOY_sal_autumn_df2$latitude),
                         crs = '+proj=longlat +datum=WGS84')

autumn_WYOY_vect <- vect(
  WYOY_sal_autumn_df2,
  crs = '+proj=longlat +datum=WGS84',
  geom=c('longitude', 'latitude')
)

WYOY_autumn_sal_rast <- terra::rasterize(
  autumn_WYOY_vect,
  autumn_WYOY_mask,
  'sal' #or whatever variable name you're dealing with
)

#sal column has now been changed to "last" so must rename
WYOY_autumn_sal_rast<- rename(WYOY_autumn_sal_rast, salinity=last)