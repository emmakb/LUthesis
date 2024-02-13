#MAX ENT MODEL FOR MATURE WHITE MALES
library(dismo)
library(rJava)
library(terra)
library(raster) #might not need try to rasterize only using terra

#IMPORT MALE WHITE SHARK DATA
#Clean sf mako data to only include lat & long
.<- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
load("white_matureM3.Rdata")
keeps<-c('Longitude', 'Latitude')
WM_data=white_matureM3[keeps] #presence data file

write.csv(WM_data, "wm.csv")

WM_data<-read.csv("wm.csv", header=TRUE)[,-1] #have to do this step to make sure the integer are not separated by periods

#Retain 20% of presence points for model training
fold<- kfold(WM_data, k=5)
occtest<- WM_data[fold == 1, ]
occtrain<- WM_data[fold != 1, ]

#_______________________________________________________________________________________

#MATURE WHITE MALES IN WINTER
#Change SpatRaster to Raster
winter_rast_chla <- raster(winter_chla_rast)
winter_rast_sst <- raster(winter_sst_rast)
winter_rast_sal <- raster(winter_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
winter_rast_sal_resized<- resample(winter_rast_sal, winter_rast_sst)
white_bathy_resized<-resample(white_bathy, winter_rast_sst) #only done once since this is not subset by season

#Now all have the same extent - Combine
winter_WM_env<-stack(winter_rast_chla, winter_rast_sst, winter_rast_sal_resized, white_bathy_resized)

#Fit model
winterwm_test_mod<- maxent(winter_WM_env, occtrain, a=NULL,factors=NULL)
winterwm_test_mod #opens results in a new tab
plot(winterwm_test_mod) #shows the importance of each variable
response(winterwm_test_mod) #response curves

#Predict to entire dataset
winter_wm_pred<- predict(winterwm_test_mod, winter_WM_env, args=c("outputformat=raw"), progress='text')
plot(winter_wm_pred, main = paste("Habitat suitability in winter 2017-2022 for mature male white sharks"))
points(WM_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(winter_WM_env, 1000) #create background points
e1 <- evaluate(winterwm_test_mod, p=occtest, a=bg, x=winter_WM_env)
plot(e1, 'ROC') #plots ROC and gives AUC 
#AUC=0.923
#_________________________________________________________________________________________

#MATURE WHITE MALES IN SPRING
#Change SpatRaster to Raster
spring_rast_chla <- raster(WM_spring_chla_rast)
spring_rast_sst <- raster(WM_spring_sst_rast)
spring_rast_sal <- raster(WM_spring_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
spring_rast_sal_resized<- resample(spring_rast_sal, spring_rast_sst)

#Now all have the same extent - Combine
spring_WM_env<-stack(spring_rast_chla, spring_rast_sst, spring_rast_sal_resized, white_bathy_resized)

#Fit model
springwm_test_mod<-dismo::maxent(spring_WM_env, occtrain, a=NULL, factors=NULL)
springwm_test_mod #opens results in a new tab
plot(springwm_test_mod) #shows the importance of each variable
response(springwm_test_mod) #response curves

#Predict to entire dataset
spring_wm_pred<- predict(springwm_test_mod, spring_WM_env, args=c("outputformat=raw"), progress='text')
plot(spring_wm_pred, main = paste("Habitat suitability in spring 2017-2022 for mature male white sharks"))
points(WM_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(spring_WM_env, 1000) #create background points
e2 <- evaluate(springwm_test_mod, p=occtest, a=bg, x=spring_WM_env)
plot(e2, 'ROC') #plots ROC and gives AUC 
#AUC=0.911
#_________________________________________________________________________________________

#MATURE WHITE MALES IN SUMMER
#Change SpatRaster to Raster
summer_rast_chla <- raster(WM_summer_chla_rast)
summer_rast_sst <- raster(WM_summer_sst_rast)
summer_rast_sal <- raster(WM_summer_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
summer_rast_sal_resized<- resample(summer_rast_sal, summer_rast_sst)

#Now all have the same extent - Combine
summer_WM_env<-stack(summer_rast_chla, summer_rast_sst, summer_rast_sal_resized, white_bathy_resized)

#Fit model
summerwm_test_mod<- maxent(summer_WM_env, occtrain, a=NULL,factors=NULL)
summerwm_test_mod #opens results in a new tab
plot(summerwm_test_mod) #shows the importance of each variable
response(summerwm_test_mod) #response curves

#Predict to entire dataset
summer_wm_pred<- predict(summerwm_test_mod, summer_WM_env, args=c("outputformat=raw"), progress='text')
plot(summer_wm_pred, main = paste("Habitat suitability in summer 2017-2022 for mature male white sharks"))
points(WM_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(summer_WM_env, 1000) #create background points
e3 <- evaluate(summerwm_test_mod, p=occtest, a=bg, x=summer_WM_env)
plot(e3, 'ROC') #plots ROC and gives AUC 
#AUC=0.934
#_________________________________________________________________________________________
#MATURE WHITE MALES IN AUTUMN
#Change SpatRaster to Raster
autumn_rast_chla <- raster(WM_autumn_chla_rast)
autumn_rast_sst <- raster(WM_autumn_sst_rast)
autumn_rast_sal<- raster(WM_autumn_sal_rast)

#Rasters have different dimensions & extents so need to resample sal size to same dim as chla & sst
autumn_rast_sal_resized<- resample(autumn_rast_sal, autumn_rast_sst)

#Now all have the same extent - Combine
autumn_WM_env<-stack(autumn_rast_chla, autumn_rast_sst, autumn_rast_sal_resized, white_bathy_resized) #predictor variables

#Fit model
autumnwm_test_mod<-dismo::maxent(autumn_WM_env, occtrain, a=NULL, factors=NULL)
autumnwm_test_mod #opens results in a new tab
plot(autumnwm_test_mod) #shows the importance of each variable
response(autumnwm_test_mod) #response curves

#Predict to entire dataset
autumn_wm_pred<- predict(autumnwm_test_mod, autumn_WM_env, args=c("outputformat=raw"), progress='text')
plot(autumn_wm_pred, main = paste("Habitat suitability in autumn 2017-2022 for mature male white sharks"))
points(WM_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(autumn_WM_env, 1000) #create background points
e4 <- evaluate(autumnwm_test_mod, p=occtest, a=bg, x=autumn_WM_env)
plot(e4, 'ROC') #plots ROC and gives AUC 
#AUC=0.91

#Save all models & environmental predictors
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/Models - Present/White males")
#Winter
save(winterwm_test_mod, file = "winterWM_test_mod.Rdata")
save(winter_WM_env, file = "winter_WM_env.Rdata")
#Spring
save(springwm_test_mod, file = "springWM_test_mod.Rdata")
save(spring_WM_env, file = "spring_WM_env.Rdata")
#Summer
save(summerwm_test_mod, file = "summerWM_test_mod.Rdata")
save(summer_WM_env, file = "summer_WM_env.Rdata")
#Autumn
save(autumnwm_test_mod, file = "autumnWM_test_mod.Rdata")
save(autumn_WM_env, file = "autumn_WM_env.Rdata")
