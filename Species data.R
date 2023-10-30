#SPECIES DISTRIBUTION DATA#
#Load necessary packages#
library(tidyverse)
library(dplyr) 
library(raster)
library(ggplot2)
library(rlang)
library(sp)
library(sf)
library(ncdf4)
library(parsedate)
library(plotdap)
library(rerddap)
library(rerddapXtracto)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggspatial)
library(csvread)
library(readxl)

##SHORTFIN MAKO DATA##
#Load in CSV data
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
mako_df <- read.csv("Shortfin_mako_raw_data.csv")

#Exploratory plots#
#Movement of 5 individual sharks over time#
sfshark1<- dplyr::filter(mako_df, shark %in% c("1"))
ggplot() +
  geom_point(data = sfshark1, aes(timestamp,latitude)) 

sfshark2<- dplyr::filter(mako_df, shark %in% c("2"))
ggplot() +
  geom_point(data = sfshark2, aes(timestamp,latitude)) 

sfshark3<- dplyr::filter(mako_df, shark %in% c("3"))
ggplot() +
  geom_point(data = sfshark3, aes(timestamp,latitude)) 

sfshark4<- dplyr::filter(mako_df, shark %in% c("4"))
ggplot() +
  geom_point(data = sfshark4, aes(timestamp,latitude)) 

sfshark5<- dplyr::filter(mako_df, shark %in% c("5"))
ggplot() +
  geom_point(data = sfshark5, aes(timestamp,latitude)) 

#Movement of all the sharks over time#
ggplot() +
  geom_point(data = mako_df, aes(timestamp, latitude, col=shark))

#Abacus plot#???
#data==shortfinmako_data %>% group_by_(shortfinmako_data$shark=="1")
#abacus.plot(n=25,time = "timestamp", id="shark", )

##WHITE SHARK DATA##
#Load in xcel data#
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis/Code/LUThesis")
white_df <- read_excel("White shark_Data_Emma_Bradshaw_Oct20_2023.xlsx")
#Create new dataset with sharks chosen
#10 mature males
white_matureM<-dplyr::filter(white_df, white_df$`Shark Name` %in% c("Vimy", "Hilton", "Jefferson", "Hal", "Sydney", "Murdoch", "Bob", "Ulysses", "Scot", "Mahone"))
#7 mature females
white_matureF<-dplyr::filter(white_df, white_df$`Shark Name` %in% c("Nukumi","Luna","Unama'ki","Katharine", "Lydia", "Genie", "Marie-Lee"))
#10 YOY, 5 male, 5 female
white_YOY<-dplyr::filter(white_df, white_df$`Shark Name` %in% c("Hudson","Gurney", "Mission", "J.D", "Manhattan", "Gratitude", "Finn", "Laurel Jean", "Paumanok", "Azlyn"))
#10 subadults, 5 male, 5 female
white_subadult<-dplyr::filter(white_df, white_df$`Shark Name` %in% c("Yeti", "Betsy", "Miss Costa", "Helena", "Edithe", "Ormond", "Hirtle", "Ocracoke", "Teazer", "Nova"))

#Exploratory plots#
#Movement of mature males over time
ggplot() +
  geom_point(data = white_matureM, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature male white sharks over time")

#Movement of mature females over time
ggplot() +
  geom_point(data = white_matureF, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature female white sharks over time")
#-> Removed outlier of Katharine found at ~5 degrees
white_matureF2 <- white_matureF[white_matureF$Latitude >5, ]
ggplot() +
  geom_point(data = white_matureF2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature female white sharks over time")

#Movement of sub-adults over time
ggplot() +
  geom_point(data = white_subadult, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of sub-adult white sharks over time")
#-> Removed outlier of Betsy at ~55 degrees
white_subadult2 <- white_subadult[white_subadult$Latitude <50, ]
ggplot() +
  geom_point(data = white_subadult2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of sub-adult white sharks over time")

#Movement of YOY over time
ggplot() +
  geom_point(data = white_YOY, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of YOY white sharks over time")
#-> Removed outlier of Hudson at ~25 degrees
white_YOY2 <- white_YOY[white_YOY$Latitude >30, ]
ggplot() +
  geom_point(data = white_YOY2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of YOY white sharks over time")
