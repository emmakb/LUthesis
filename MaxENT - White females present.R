#MAX ENT MODEL FOR MATURE WHITE FEMALES
library(dismo)
library(rJava)
library(terra)
library(raster) #might not need try to rasterize only using terra

#IMPORT FEMALE WHITE SHARK DATA
#Clean sf mako data to only include lat & long
.<- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
load("white_matureF3.Rdata")
keeps<-c('Longitude', 'Latitude')
WF_data=white_matureF3[keeps] #presence data file

write.csv(WF_data, "wf.csv")

WF_data<-read.csv("wf.csv", header=TRUE)[,-1] #have to do this step to make sure the integer are not separated by periods

#Retain 20% of presence points for model training
fold<- kfold(WF_data, k=5)
occtest<- WF_data[fold == 1, ]
occtrain<- WF_data[fold != 1, ]

#_______________________________________________________________________________________

#MATURE WHITE FEMALES IN WINTER
#Change SpatRaster to Raster
winter_rast_chla <- raster(WF_winter_chla_rast)
winter_rast_sst <- raster(WF_winter_sst_rast)
winter_rast_sal <- raster(WF_winter_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
winter_rast_sal_resized<- resample(winter_rast_sal, winter_rast_sst)
white_bathy_resized<-resample(white_bathy, winter_rast_sst) #only done once since this is not subset by season

#Now all have the same extent - Combine
winter_WF_env<-stack(winter_rast_chla, winter_rast_sst, winter_rast_sal_resized, white_bathy_resized)

#Fit model
winterwf_test_mod<- maxent(winter_WF_env, occtrain, a=NULL,factors=NULL)
winterwf_test_mod #opens results in a new tab
plot(winterwf_test_mod) #shows the importance of each variable
response(winterwf_test_mod) #response curves

#Predict to entire dataset
winter_wf_pred<- predict(winterwf_test_mod, winter_WF_env, args=c("outputformat=raw"), progress='text')
plot(winter_wf_pred, main = paste("Habitat suitability in winter 2013-2021 for mature female white sharks"))
points(WF_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(winter_WF_env, 1000) #create background points
e1 <- evaluate(winterwf_test_mod, p=occtest, a=bg, x=winter_WF_env)
plot(e1, 'ROC') #plots ROC and gives AUC 
#AUC= 0.786
#_________________________________________________________________________________________

#MATURE WHITE FEMALES IN SPRING
#Change SpatRaster to Raster
spring_rast_chla <- raster(WF_spring_chla_rast)
spring_rast_sst <- raster(WF_spring_sst_rast)
spring_rast_sal <- raster(WF_spring_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
spring_rast_sal_resized<- resample(spring_rast_sal, spring_rast_sst)

#Now all have the same extent - Combine
spring_WF_env<-stack(spring_rast_chla, spring_rast_sst, spring_rast_sal_resized, white_bathy_resized)

#Fit model
springwf_test_mod<- maxent(spring_WF_env, occtrain, factors=NULL)
springwf_test_mod #opens results in a new tab
plot(springwf_test_mod) #shows the importance of each variable
response(springwf_test_mod) #response curves

#Predict to entire dataset
spring_wf_pred<- predict(springwf_test_mod, spring_WF_env, args=c("outputformat=raw"), progress='text')
plot(spring_wf_pred, main = paste("Habitat suitability in spring 2013-2021 for mature female white sharks"))
points(WF_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(spring_WF_env, 1000) #create background points
e2 <- evaluate(springwf_test_mod, p=occtest, a=bg, x=spring_WF_env)
plot(e2, 'ROC') #plots ROC and gives AUC 
#AUC=0.775
#_________________________________________________________________________________________

#MATURE WHITE FEMALES IN SUMMER
#Change SpatRaster to Raster
summer_rast_chla <- raster(WF_summer_chla_rast)
summer_rast_sst <- raster(WF_summer_sst_rast)
summer_rast_sal <- raster(WF_summer_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
summer_rast_sal_resized<- resample(summer_rast_sal, summer_rast_sst)

#Now all have the same extent - Combine
summer_WF_env<-stack(summer_rast_chla, summer_rast_sst, summer_rast_sal_resized, white_bathy_resized)

#Fit model
summerwf_test_mod<- maxent(summer_WF_env, occtrain, a=NULL,factors=NULL)
summerwf_test_mod #opens results in a new tab
plot(summerwf_test_mod) #shows the importance of each variable
response(summerwf_test_mod) #response curves

#Predict to entire dataset
summer_wf_pred<- predict(summerwf_test_mod, summer_WF_env, args=c("outputformat=raw"), progress='text')
plot(summer_wf_pred, main = paste("Habitat suitability in summer 2013-2021 for mature female white sharks"))
points(WF_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(summer_WF_env, 1000) #create background points
e3 <- evaluate(summerwf_test_mod, p=occtest, a=bg, x=summer_WF_env)
plot(e3, 'ROC') #plots ROC and gives AUC 
#AUC=0.783
#_________________________________________________________________________________________
#MATURE WHITE FEMALES IN AUTUMN
#Change SpatRaster to Raster
autumn_rast_chla <- raster(WF_autumn_chla_rast)
autumn_rast_sst <- raster(WF_autumn_sst_rast)
autumn_rast_sal<- raster(WF_autumn_sal_rast)

#Rasters have different dimensions & extents so need to resample sal size to same dim as chla & sst
autumn_rast_sal_resized<- resample(autumn_rast_sal, autumn_rast_sst)

#Now all have the same extent - Combine
autumn_WF_env<-stack(autumn_rast_chla, autumn_rast_sst, autumn_rast_sal_resized, white_bathy_resized) #predictor variables

#Fit model
autumnwf_test_mod<-dismo::maxent(autumn_WF_env, occtrain, a=NULL, factors=NULL)
autumnwf_test_mod #opens results in a new tab
plot(autumnwf_test_mod) #shows the importance of each variable
response(autumnwf_test_mod) #response curves

#Predict to entire dataset
autumn_wf_pred<- predict(autumnwf_test_mod, autumn_WF_env, args=c("outputformat=raw"), progress='text')
plot(autumn_wf_pred, main = paste("Habitat suitability in autumn 2013-2021 for mature female white sharks"))
points(WF_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(autumn_WF_env, 1000) #create background points
e4 <- evaluate(autumnwf_test_mod, p=occtest, a=bg, x=autumn_WF_env)
plot(e4, 'ROC') #plots ROC and gives AUC 
#AUC=0.761

#Save all models & environmental predictors
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/Models - Present/White females")
#Winter
save(winterwf_test_mod, file = "winterWF_test_mod.Rdata")
save(winter_WF_env, file = "winter_WF_env.Rdata")
#Spring
save(springwf_test_mod, file = "springWF_test_mod.Rdata")
save(spring_WF_env, file = "spring_WF_env.Rdata")
#Summer
save(summerwf_test_mod, file = "summerWF_test_mod.Rdata")
save(summer_WF_env, file = "summer_WF_env.Rdata")
#Autumn
save(autumnwf_test_mod, file = "autumnWF_test_mod.Rdata")
save(autumn_WF_env, file = "autumn_WF_env.Rdata")
