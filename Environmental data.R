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
library(plotdap)
library(sf)

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
sstInfo <- rerddap::info('erdMH1sstd1dayR20190SQ')
sstInfo
#salinity data
pHInfo <- rerddap::info('')
pHInfo

xlen<- 0.2
ylen<- 0.2
#_________________________________________________________________________

##WHITE SHARKS#
##Mature males##
whitemaledata <- white_matureM2
xposw1 <- white_matureM2$Longitude
yposw1 <- white_matureM2$Latitude
tposw1 <- white_matureM2$Timestamp

#Link to chlorophyll a data
chlaWM <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw1, ycoord = yposw1, tcoord = tposw1, xlen = xlen, ylen = ylen)
plotTrack(chlaWM, xposw1, yposw1, tposw1, plotColor = "algae")

#Link to SST data
sstWM <- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw1, ycoord = yposw1, tcoord = tposw1, xlen = xlen, ylen = ylen)
plotTrack(sstWF, xposw2, yposw2, tposw2, plotColor = 'thermal')

#link to depth data
depthWM <- rxtracto(depthInfo, parameter = "z", xcoord = xposw1, ycoord = yposw1, xlen = .1, ylen = .1)
plotTrack(depthWM, xposw1, yposw1, NA, plotColor = "dense", name = "Depth")

#link to salinity data


##Mature females##
whitefemaledata <- white_matureF2
xposw2 <- whitefemaledata$Longitude
yposw2 <- whitefemaledata$Latitude
tposw2 <- whitefemaledata$Timestamp

#Link to chlorophyll a data
chlaWF <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw2, ycoord = yposw2, tcoord = tposw2, xlen = xlen, ylen = ylen)
plotTrack(clhaWF, xposw2, yposw2, tposw2, plotColor = 'algae')

#Link to SST data
sstWF <- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw2, ycoord = yposw2, tcoord = tposw2, xlen = xlen, ylen = ylen)
plotTrack(sstWF, xposw2, yposw2, tposw2, plotColor = 'thermal')

#link to depth data
depthWF <- rxtracto(depthInfo, parameter = "z", xcoord = xposw2, ycoord = yposw2, xlen = .1, ylen = .1)
plotTrack(depthWF, xposw2, yposw2, NA, plotColor = "dense", name = "Depth")

#link to salinity data

##Sub-adults##
whitesubadultdata <- white_subadult2
xposw3 <- whitesubadultdata$Longitude
yposw3 <- whitesubadultdata$Latitude
tposw3 <- whitesubadultdata$Timestamp

#link to chlorophyll data
chlaWSA <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw3, ycoord = yposw3, tcoord = tposw3, xlen = xlen, ylen = ylen)
plotTrack(clhaWSA, xposw3, yposw3, tposw3, plotColor = 'algae')

#link to SST data
sstWSA<- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw3, ycoord = yposw3, tcoord = tposw3, xlen = xlen, ylen = ylen)
plotTrack(sstWSA, xposw3, yposw3, tposw3, plotColor = 'thermal')

#link to depth data
depthWSA <- rxtracto(depthInfo, parameter = "z", xcoord = xposw3, ycoord = yposw3, xlen = .1, ylen = .1)
plotTrack(depthWSA, xposw3, yposw3, NA, plotColor = "dense", name = "Depth")
#link to salinity data

##YOY##
whiteyoungdata <- white_YOY2
xposw4 <- whiteyoungdata$Longitude
yposw4 <- whiteyoungdata$Latitude
tposw4 <- whiteyoungdata$Timestamp
zposw4 <- rep(0., length(xposw4))

#link to chlorophyll data
chlaWYOY <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw4, ycoord = yposw4, tcoord = tposw4, xlen = xlen, ylen = ylen)
plotTrack(chlaWYOY, xposw4, yposw4, tposw4, plotColor = 'algae', name = "Chlorophyll")

#link to SST data
sstWYOY<- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw4, ycoord = yposw4, tcoord = tposw4, xlen = xlen, ylen = ylen)
plotTrack(sstWYOY, xposw4, yposw4, tposw4, plotColor = 'thermal', name = "SST")

#link to depth data
depthWYOY <- rxtracto(depthInfo, parameter = "z", xcoord = xposw4, ycoord = yposw4, xlen = .1, ylen = .1)
plotTrack(depthWYOY, xposw4, yposw4, NA, plotColor = "dense", name = "Depth")
#link to salinity data


#_________________________________________________________________________

##SHORTFIN MAKOS##
#First copy in tag data into a variable
#call it something else so that the subsequent code is more generic
SFMtagdata<- mako_df2
xpossf <- SFMtagdata$longitude
ypossf <- SFMtagdata$latitude
tpossf <- SFMtagdata$timestamp

#link to chlorophyll data
chlaSF <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xpossf, ycoord = ypossf, tcoord = tpossf, xlen = xlen, ylen = ylen)
plotTrack(chlaSF, xpossf, ypossf, tpossf, plotColor = "algae")

#link to SST data
sstSF<- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xpossf, ycoord = ypossf, tcoord = tpossf, xlen = xlen, ylen = ylen)
plotTrack(sstSF, xpossf, ypossf, tpossf, plotColor = "thermal")

#link to depth
depthSF <- rxtracto(depthInfo, parameter = "z", xcoord = xpossf, ycoord = ypossf, xlen = .1, ylen = .1)
plotTrack(depthSF, xpossf, ypossf, NA, plotColor = "dense", name = "Depth")

#link to salinity
