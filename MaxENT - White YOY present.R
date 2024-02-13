#MAX ENT MODEL FOR WHITE YOY
library(dismo)
library(rJava)
library(terra)
library(raster) #might not need try to rasterize only using terra

#IMPORT YOY WHITE SHARK DATA
#Clean sf mako data to only include lat & long
.<- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
load("white_YOY3.Rdata")
keeps<-c('Longitude', 'Latitude')
WYOY_data=white_YOY3[keeps] #presence data file

write.csv(WYOY_data, "wyoy.csv")

WYOY_data<-read.csv("wyoy.csv", header=TRUE)[,-1] #have to do this step to make sure the integer are not separated by periods

#Retain 20% of presence points for model training
fold<- kfold(WYOY_data, k=5)
occtest<- WYOY_data[fold == 1, ]
occtrain<- WYOY_data[fold != 1, ]

#_______________________________________________________________________________________

#MATURE WHITE YOY IN WINTER
#Change SpatRaster to Raster
winter_rast_chla <- raster(WYOY_winter_chla_rast)
winter_rast_sst <- raster(WYOY_winter_sst_rast)
winter_rast_sal <- raster(WYOY_winter_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
winter_rast_sal_resized<- resample(winter_rast_sal, winter_rast_sst)
white_bathy_resized<-resample(white_bathy, winter_rast_sst) #only done once since this is not subset by season

#Now all have the same extent - Combine
winter_WYOY_env<-stack(winter_rast_chla, winter_rast_sst, winter_rast_sal_resized, white_bathy_resized)

#Fit model
winterwyoy_test_mod<- maxent(winter_WYOY_env, occtrain, a=NULL,factors=NULL)
winterwyoy_test_mod #opens results in a new tab
plot(winterwyoy_test_mod) #shows the importance of each variable
response(winterwyoy_test_mod) #response curves

#Predict to entire dataset
winter_wyoy_pred<- predict(winterwyoy_test_mod, winter_WYOY_env, args=c("outputformat=raw"), progress='text')
plot(winter_wyoy_pred, main = paste("Habitat suitability in winter 2016-2019 for YOY white sharks"))
points(WYOY_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(winter_WYOY_env, 1000) #create background points
e1 <- evaluate(winterwyoy_test_mod, p=occtest, a=bg, x=winter_WYOY_env)
plot(e1, 'ROC') #plots ROC and gives AUC 
#AUC=
#_________________________________________________________________________________________

#MATURE WHITE YOY IN SPRING
#Change SpatRaster to Raster
spring_rast_chla <- raster(WYOY_spring_chla_rast)
spring_rast_sst <- raster(WYOY_spring_sst_rast)
spring_rast_sal <- raster(WYOY_spring_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
spring_rast_sal_resized<- resample(spring_rast_sal, spring_rast_sst)

#Now all have the same extent - Combine
spring_WYOY_env<-stack(spring_rast_chla, spring_rast_sst, spring_rast_sal_resized, white_bathy_resized)

#Fit model
springwyoy_test_mod<- dismo::maxent(spring_WYOY_env, occtrain, a=NULL, factors=NULL)
springwyoy_test_mod #opens results in a new tab
plot(springwyoy_test_mod) #shows the importance of each variable
response(springwyoy_test_mod) #response curves

#Predict to entire dataset
spring_wyoy_pred<- predict(springwyoy_test_mod, spring_WYOY_env, args=c("outputformat=raw"), progress='text')
plot(spring_wyoy_pred, main = paste("Habitat suitability in spring 2016-2019 for YOY white sharks"))
points(WYOY_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(spring_WYOY_env, 1000) #create background points
e2 <- evaluate(springwyoy_test_mod, p=occtest, a=bg, x=spring_WYOY_env)
plot(e2, 'ROC') #plots ROC and gives AUC 
#AUC=
#_________________________________________________________________________________________

#MATURE WHITE YOY IN SUMMER
#Change SpatRaster to Raster
summer_rast_chla <- raster(WYOY_summer_chla_rast)
summer_rast_sst <- raster(WYOY_summer_sst_rast)
summer_rast_sal <- raster(WYOY_summer_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
summer_rast_sal_resized<- resample(summer_rast_sal, summer_rast_sst)

#Now all have the same extent - Combine
summer_WYOY_env<-stack(summer_rast_chla, summer_rast_sst, summer_rast_sal_resized, white_bathy_resized)

#Fit model
summerwyoy_test_mod<- maxent(summer_WYOY_env, occtrain, a=NULL,factors=NULL)
summerwyoy_test_mod #opens results in a new tab
plot(summerwyoy_test_mod) #shows the importance of each variable
response(summerwyoy_test_mod) #response curves

#Predict to entire dataset
summer_wyoy_pred<- predict(summerwyoy_test_mod, summer_WYOY_env, args=c("outputformat=raw"), progress='text')
plot(summer_wyoy_pred, main = paste("Habitat suitability in summer 2013-2022 for sub-adult white sharks"))
points(WYOY_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(summer_WYOY_env, 1000) #create background points
e3 <- evaluate(summerwyoy_test_mod, p=occtest, a=bg, x=summer_WYOY_env)
plot(e3, 'ROC') #plots ROC and gives AUC 
#AUC=
#_________________________________________________________________________________________
#MATURE WHITE YOY IN AUTUMN
#Change SpatRaster to Raster
autumn_rast_chla <- raster(WYOY_autumn_chla_rast)
autumn_rast_sst <- raster(WYOY_autumn_sst_rast)
autumn_rast_sal<- raster(WYOY_autumn_sal_rast)

#Rasters have different dimensions & extents so need to resample sal size to same dim as chla & sst
autumn_rast_sal_resized<- resample(autumn_rast_sal, autumn_rast_sst)

#Now all have the same extent - Combine
autumn_WYOY_env<-stack(autumn_rast_chla, autumn_rast_sst, autumn_rast_sal_resized, white_bathy_resized) #predictor variables

#Fit model
autumnwyoy_test_mod<-dismo::maxent(autumn_WYOY_env, occtrain, a=NULL, factors=NULL)
autumnwyoy_test_mod #opens results in a new tab
plot(autumnwyoy_test_mod) #shows the importance of each variable
response(autumnwyoy_test_mod) #response curves

#Predict to entire dataset
autumn_wyoy_pred<- predict(autumnwyoy_test_mod, autumn_WYOY_env, args=c("outputformat=raw"), progress='text')
plot(autumn_wyoy_pred, main = paste("Habitat suitability in autumn 2016-2019 for YOY white sharks"))
points(WYOY_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(autumn_WYOY_env, 1000) #create background points
e4 <- evaluate(autumnwyoy_test_mod, p=occtest, a=bg, x=autumn_WYOY_env)
plot(e4, 'ROC') #plots ROC and gives AUC 
#AUC=

#Save all models & environmental predictors
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/Models - Present")
#Winter
save(winterwyoy_test_mod, file = "winterWYOY_test_mod.Rdata")
save(winter_WYOY_env, file = "winter_WYOY_env.Rdata")
#Spring
save(springwyoy_test_mod, file = "springWYOY_test_mod.Rdata")
save(spring_WYOY_env, file = "spring_WYOY_env.Rdata")
#Summer
save(summerwyoy_test_mod, file = "summerWYOY_test_mod.Rdata")
save(summer_WYOY_env, file = "summer_WYOY_env.Rdata")
#Autumn
save(autumnwyoy_test_mod, file = "autumnWYOY_test_mod.Rdata")
save(autumn_WYOY_env, file = "autumn_WYOY_env.Rdata")
