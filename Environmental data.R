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
library(sf)

#Open clean species data
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis")
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
pHInfo <- rerddap::info(datasetid = "coastwatchSMOSv662SSS1day", url = "https://coastwatch.pfeg.noaa.gov/erddap/")
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
save(chlaWM, file = "chlaWM2.Rdata")

#Link to SST data
sstWM <- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw1, ycoord = yposw1, tcoord = tposw1, xlen = xlen, ylen = ylen)
plotTrack(sstWM, xposw1, yposw1, tposw1, plotColor = 'thermal')
save(sstWM, file = "sstWM2.Rdata")

#link to depth data
depthWM <- rxtracto(depthInfo, parameter = "z", xcoord = xposw1, ycoord = yposw1, xlen = .1, ylen = .1)
plotTrack(depthWM, xposw1, yposw1, NA, plotColor = "dense", name = "Depth")
save(depthWM, file = "depthWM2.Rdata")

#link to salinity data
phWM<- rxtracto(pHInfo, parameter = "sss", xcoord = xposw1, ycoord = yposw1, tcoord = tposw1, zcoord = zposw1, xlen = xlen, ylen = ylen)
plotTrack(phWM, xposw1, yposw1, NA, plotColor = "haline", name = "pH")
save(phWM, file = "phWM2.Rdata")

##Mature females##
whitefemaledata <- white_matureF2
xposw2 <- whitefemaledata$Longitude
yposw2 <- whitefemaledata$Latitude
tposw2 <- whitefemaledata$Timestamp

#Link to chlorophyll a data
chlaWF <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw2, ycoord = yposw2, tcoord = tposw2, xlen = xlen, ylen = ylen)
plotTrack(chlaWF, xposw2, yposw2, tposw2, plotColor = 'algae')
save(chlaWF, file = "chlaWF2.Rdata")

#Link to SST data
sstWF <- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw2, ycoord = yposw2, tcoord = tposw2, xlen = xlen, ylen = ylen)
plotTrack(sstWF2, xposw2, yposw2, tposw2, plotColor = 'thermal', name = "SST")
save(sstWF, file = "sstWF2.Rdata")

#link to depth data
depthWF <- rxtracto(depthInfo, parameter = "z", xcoord = xposw2, ycoord = yposw2, xlen = .1, ylen = .1)
plotTrack(depthWF, xposw2, yposw2, NA, plotColor = "dense", name = "Depth")
save(depthWF, file = "depthWF2.Rdata")

#link to salinity data
phWF<- rxtracto(pHInfo, parameter = "sss", xcoord = xposw2, ycoord = yposw2, tcoord = tposw2, zcoord = zposw2, xlen = xlen, ylen = ylen)
plotTrack(phWF, xposw2, yposw2, NA, plotColor = "haline", name = "Salinity")
save(phWF, file = "phWF2.Rdata")

##Sub-adults##
whitesubadultdata <- white_subadult2
xposw3 <- whitesubadultdata$Longitude
yposw3 <- whitesubadultdata$Latitude
tposw3 <- whitesubadultdata$Timestamp
zposw3 <- rep(0., length(xposw3))

#link to chlorophyll data
chlaWSA <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw3, ycoord = yposw3, tcoord = tposw3, xlen = xlen, ylen = ylen)
plotTrack(chlaWSA, xposw3, yposw3, tposw3, plotColor = 'algae')
save(chlaWSA, file = "chlaWSA2.Rdata")

#link to SST data
sstWSA<- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw3, ycoord = yposw3, tcoord = tposw3, xlen = xlen, ylen = ylen)
plotTrack(sstWSA, xposw3, yposw3, tposw3, plotColor = 'thermal')
save(sstWSA, file = "sstWSA2.Rdata")

#link to depth data
depthWSA <- rxtracto(depthInfo, parameter = "z", xcoord = xposw3, ycoord = yposw3, xlen = .1, ylen = .1)
plotTrack(depthWSA, xposw3, yposw3, NA, plotColor = "dense", name = "Depth")
save(depthWSA, file = "depthWSA2.Rdata")

#link to salinity data
phWSA<- rxtracto(pHInfo, parameter = "sss", xcoord = xposw3, ycoord = yposw3, tcoord = tposw3, zcoord = zposw3, xlen = xlen, ylen = ylen)
plotTrack(phWSA, xposw3, yposw3, NA, plotColor = "haline", name = "salinity")
save(phWSA, file = "phWSA2.Rdata")

##YOY##
whiteyoungdata <- white_YOY2
xposw4 <- whiteyoungdata$Longitude
yposw4 <- whiteyoungdata$Latitude
tposw4 <- whiteyoungdata$Timestamp
zposw4 <- rep(0., length(xposw4))

#link to chlorophyll data
chlaWYOY <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xposw4, ycoord = yposw4, tcoord = tposw4, xlen = xlen, ylen = ylen)
plotTrack(chlaWYOY, xposw4, yposw4, tposw4, plotColor = 'algae', name = "Chlorophyll")
save(chlaWYOY, file = "chlaWYOY2.Rdata")

#link to SST data
sstWYOY<- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xposw4, ycoord = yposw4, tcoord = tposw4, xlen = xlen, ylen = ylen)
plotTrack(sstWYOY, xposw4, yposw4, tposw4, plotColor = 'thermal', name = "SST")
save(sstWYOY, file = "sstWYOY2.Rdata")

#link to depth data
depthWYOY <- rxtracto(depthInfo, parameter = "z", xcoord = xposw4, ycoord = yposw4, xlen = .1, ylen = .1)
plotTrack(depthWYOY, xposw4, yposw4, NA, plotColor = "dense", name = "Depth")
save(depthWYOY, file = "depthWYOY2.Rdata")

#link to salinity data
phWYOY<- rxtracto(pHInfo, parameter = "sss", xcoord = xposw4, ycoord = yposw4, tcoord = tposw4, zcoord = zposw4, xlen = xlen, ylen = ylen)
plotTrack(phWYOY, xposw4, yposw4, NA, plotColor = "haline", name = "Salinity")
save(phWYOY, file = "phWYOY2.Rdata")

#_________________________________________________________________________

##SHORTFIN MAKOS##
#First copy in tag data into a variable
#call it something else so that the subsequent code is more generic
SFMtagdata<- mako_df2
xpossf <- SFMtagdata$longitude
ypossf <- SFMtagdata$latitude
tpossf <- SFMtagdata$timestamp
zpossf <- rep(0., length(xpossf))

#link to chlorophyll data
chlaSF <- rxtracto(chlaInfo, parameter = "chlorophyll", xcoord = xpossf, ycoord = ypossf, tcoord = tpossf, xlen = xlen, ylen = ylen)
plotTrack(chlaSF, xpossf, ypossf, tpossf, plotColor = "algae")
save(chlaSF, file = "chlaSF.Rdata")

#link to SST data
sstSF<- rxtracto(sstInfo, parameter = "sstMasked", xcoord = xpossf, ycoord = ypossf, tcoord = tpossf, xlen = xlen, ylen = ylen)
plotTrack(sstSF, xpossf, ypossf, tpossf, plotColor = "thermal")
save(sstSF, file = "sstSF.Rdata")

#link to depth
depthSF <- rxtracto(depthInfo, parameter = "z", xcoord = xpossf, ycoord = ypossf, xlen = .1, ylen = .1)
plotTrack(depthSF, xpossf, ypossf, NA, plotColor = "dense", name = "Depth")
save(depthSF, file = "depthSF.Rdata")

#link to salinity
phSF<- rxtracto(pHInfo, parameter = "sss", xcoord = xpossf, ycoord = ypossf, tcoord = tpossf, zcoord = zpossf, xlen = xlen, ylen = ylen)
plotTrack(phSF, xpossf, ypossf, NA, plotColor = "haline", name = "pH")
save(phSF, file = "phSF.Rdata")
