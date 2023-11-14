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
library(ggplot2)
library(gganimate)
library(plotdap)


#Open clean species data
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
load("~/Desktop/Lund- Thesis/Code/LUThesis/mako_df2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_subadult2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_YOY2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_matureF2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_matureM2.Rdata")

#Load environmental data
#chlorophyll a data
chlaInfo <- rerddap::info('erdMH1chla1day')
chlaInfo
#depth data
depthInfo <- rerddap::info('etopo1_bedrock')
depthInfo
#SST data
SSTInfo <- rerddap::info('erdMH1sstd1dayR20190SQ')
SSTInfo
#salinity data
pHInfo <- rerddap::info('')
pHInfo
#_________________________________________________________________________

##WHITE SHARKS#
#Mature males
whitemaledata <- white_matureM2
xposw1 <- white_matureM2$Longitude
yposw1 <- white_matureM2$Latitude
tposw1 <- white_matureM2$Timestamp

#Mature females
whitefemaledata <- white_matureF2
xposw2 <- whitefemaledata$Longitude
yposw2 <- whitefemaledata$Latitude
tposw2 <- c("2013-01-01", "2021-05-01")

#Link to chlorophyll a data
WFchla <- rxtractogon(chlaInfo, parameter = parameter, xcoord = xposw2, ycoord = yposw2, tcoord = tposw2)
#Link to SST data
WFtemp <- rxtractogon(SSTInfo, parameter = "sstMasked", xcoord = xposw2, ycoord = yposw2, tcoord = tposw2)

#Sub-adults
whitesubadultdata <- white_subadult2
xposw3 <- whitesubadultdata$Longitude
yposw3 <- whitesubadultdata$Latitude
tposw3 <- whitesubadultdata$Timestamp

#YOY
whiteyoungdata <- white_YOY2
xposw4 <- whiteyoungdata$Longitude
yposw4 <- whiteyoungdata$Latitude
tposw4 <- whiteyoungdata$Timestamp


##SHORTFIN MAKOS##
#First copy in tag data into a variable
#call it something else so that the subsequent code is more generic
SFMtagdata<- mako_df2
xpossf <- SFMtagdata$longitude
ypossf <- SFMtagdata$latitude
tpossf <-SFMtagdata$timestamp

#Combine chlorophyll a data to SF makos
#Combine depth data to SF makos
#Combine SST data to SF makos
#Combine salinity data to SF makos
