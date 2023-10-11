##IMPORTING ENVIRONMENTAL DATA##
#Begin by installing necessary packages#
#install.packages("ncdf4", dependencies = TRUE) 
#install.packages("parsedate", dependencies = TRUE)
#install.packages("plotdap", dependencies = TRUE)
#install.packages("rerddap", dependencies = TRUE)
#install.packages("sp", dependencies = TRUE)
#install.packages("rerddapXtracto", dependencies = TRUE)

#Load necessary packages
library(ncdf4)
library(parsedate)
library(plotdap)
library(rerddap)
library(sp)
library(rerddapXtracto)
library(gganimate)
library(ggplot2)
library(plotdap)


#First copy in tag data into a variable
#call it something else so that the subsequent code is more generic
GWtagdata<- ##
xpos <- ##
ypos <- ##
tpos <-##
#download sst data
sstInfo <- info('noaa_psl_04af_50c4_3592')
sstInfo
#Combine them
blabla <- rxtracto(dataInfo, parameter = 'sst', xcoord = xpos, ycoord = ypos, tcoord = tpos, xlen = .2, ylen = .2)
