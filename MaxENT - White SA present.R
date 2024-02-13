#MAX ENT MODEL FOR WHITE SUB-ADULTS
library(dismo)
library(rJava)
library(terra)
library(raster) #might not need try to rasterize only using terra

#IMPORT SUB-ADULT WHITE SHARK DATA
#Clean sf mako data to only include lat & long
.<- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
load("white_subadult3.Rdata")
keeps<-c('Longitude', 'Latitude')
WSA_data=white_subadult3[keeps] #presence data file

write.csv(WSA_data, "wsa.csv")

WSA_data<-read.csv("wsa.csv", header=TRUE)[,-1] #have to do this step to make sure the integer are not separated by periods

#Retain 20% of presence points for model training
fold<- kfold(WSA_data, k=5)
occtest<- WSA_data[fold == 1, ]
occtrain<- WSA_data[fold != 1, ]

#_______________________________________________________________________________________

#MATURE WHITE SUB-ADULTS IN WINTER
#Change SpatRaster to Raster
winter_rast_chla <- raster(WSA_winter_chla_rast)
winter_rast_sst <- raster(WSA_winter_sst_rast)
winter_rast_sal <- raster(WSA_winter_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
winter_rast_sal_resized<- resample(winter_rast_sal, winter_rast_sst)
white_bathy_resized<-resample(white_bathy, winter_rast_sst) #only done once since this is not subset by season

#Now all have the same extent - Combine
winter_WSA_env<-stack(winter_rast_chla, winter_rast_sst, winter_rast_sal_resized, white_bathy_resized)

#Fit model
winterwsa_test_mod<- maxent(winter_WSA_env, occtrain, a=NULL,factors=NULL)
winterwsa_test_mod #opens results in a new tab
plot(winterwsa_test_mod) #shows the importance of each variable
response(winterwsa_test_mod) #response curves

#Predict to entire dataset
winter_wsa_pred<- predict(winterwsa_test_mod, winter_WSA_env, args=c("outputformat=raw"), progress='text')
plot(winter_wsa_pred, main = paste("Habitat suitability in winter 2013-2022 for sub-adult white sharks"))
points(WSA_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(winter_WSA_env, 1000) #create background points
e1 <- evaluate(winterwsa_test_mod, p=occtest, a=bg, x=winter_WSA_env)
plot(e1, 'ROC') #plots ROC and gives AUC 
#AUC=0.907
#_________________________________________________________________________________________

#MATURE WHITE SUB-ADULTS IN SPRING
#Change SpatRaster to Raster
spring_rast_chla <- raster(WSA_spring_chla_rast)
spring_rast_sst <- raster(WSA_spring_sst_rast)
spring_rast_sal <- raster(WSA_spring_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
spring_rast_sal_resized<- resample(spring_rast_sal, spring_rast_sst)

#Now all have the same extent - Combine
spring_WSA_env<-stack(spring_rast_chla, spring_rast_sst, spring_rast_sal_resized, white_bathy_resized)

#Fit model
springwsa_test_mod<- maxent(spring_WSA_env, occtrain, factors=NULL)
springwsa_test_mod #opens results in a new tab
plot(springwsa_test_mod) #shows the importance of each variable
response(springwsa_test_mod) #response curves

#Predict to entire dataset
spring_wsa_pred<- predict(springwsa_test_mod, spring_WSA_env, args=c("outputformat=raw"), progress='text')
plot(spring_wsa_pred, main = paste("Habitat suitability in spring 2013-2022 for sub-adult white sharks"))
points(WSA_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(spring_WSA_env, 1000) #create background points
e2 <- evaluate(springwsa_test_mod, p=occtest, a=bg, x=spring_WSA_env)
plot(e2, 'ROC') #plots ROC and gives AUC 
#AUC=0.871
#_________________________________________________________________________________________

#MATURE WHITE SUB-ADULTS IN SUMMER
#Change SpatRaster to Raster
summer_rast_chla <- raster(WSA_summer_chla_rast)
summer_rast_sst <- raster(WSA_summer_sst_rast)
summer_rast_sal <- raster(WSA_summer_sal_rast)

#Rasters have different dimensions & extents so need to resample sal & depth size to same dim as chla & sst
summer_rast_sal_resized<- resample(summer_rast_sal, summer_rast_sst)

#Now all have the same extent - Combine
summer_WSA_env<-stack(summer_rast_chla, summer_rast_sst, summer_rast_sal_resized, white_bathy_resized)

#Fit model
summerwsa_test_mod<- maxent(summer_WSA_env, occtrain, a=NULL,factors=NULL)
summerwsa_test_mod #opens results in a new tab
plot(summerwsa_test_mod) #shows the importance of each variable
response(summerwsa_test_mod) #response curves

#Predict to entire dataset
summer_wsa_pred<- predict(summerwsa_test_mod, summer_WSA_env, args=c("outputformat=raw"), progress='text')
plot(summer_wsa_pred, main = paste("Habitat suitability in summer 2013-2022 for sub-adult white sharks"))
points(WSA_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(summer_WSA_env, 1000) #create background points
e3 <- evaluate(summerwsa_test_mod, p=occtest, a=bg, x=summer_WSA_env)
plot(e3, 'ROC') #plots ROC and gives AUC 
#AUC=0.905
#_________________________________________________________________________________________
#MATURE WHITE SUB-ADULTS IN AUTUMN
#Change SpatRaster to Raster
autumn_rast_chla <- raster(WSA_autumn_chla_rast)
autumn_rast_sst <- raster(WSA_autumn_sst_rast)
autumn_rast_sal<- raster(WSA_autumn_sal_rast)

#Rasters have different dimensions & extents so need to resample sal size to same dim as chla & sst
autumn_rast_sal_resized<- resample(autumn_rast_sal, autumn_rast_sst)

#Now all have the same extent - Combine
autumn_WSA_env<-stack(autumn_rast_chla, autumn_rast_sst, autumn_rast_sal_resized, white_bathy_resized) #predictor variables

#Fit model
autumnwsa_test_mod<-dismo::maxent(autumn_WSA_env, occtrain, a=NULL, factors=NULL)
autumnwsa_test_mod #opens results in a new tab
plot(autumnwsa_test_mod) #shows the importance of each variable
response(autumnwsa_test_mod) #response curves

#Predict to entire dataset
autumn_wsa_pred<- predict(autumnwsa_test_mod, autumn_WSA_env, args=c("outputformat=raw"), progress='text')
plot(autumn_wsa_pred, main = paste("Habitat suitability in autumn 2013-2022 for sub-adult white sharks"))
points(WSA_data, col="lightblue",pch=16, cex=1)

#Testing
bg <- randomPoints(autumn_WSA_env, 1000) #create background points
e4 <- evaluate(autumnwsa_test_mod, p=occtest, a=bg, x=autumn_WSA_env)
plot(e4, 'ROC') #plots ROC and gives AUC 
#AUC=0.886

#Save all models & environmental predictors
setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis/Models - Present/White subadult")
#Winter
save(winterwsa_test_mod, file = "winterWSA_test_mod.Rdata")
save(winter_WSA_env, file = "winter_WSA_env.Rdata")
#Spring
save(springwsa_test_mod, file = "springWSA_test_mod.Rdata")
save(spring_WSA_env, file = "spring_WSA_env.Rdata")
#Summer
save(summerwsa_test_mod, file = "summerWSA_test_mod.Rdata")
save(summer_WSA_env, file = "summer_WSA_env.Rdata")
#Autumn
save(autumnwsa_test_mod, file = "autumnWSA_test_mod.Rdata")
save(autumn_WSA_env, file = "autumn_WSA_env.Rdata")
