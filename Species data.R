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
#Movement of all SF makos over time#
ggplot() +
  geom_point(data = mako_df, aes(timestamp, latitude, col=shark))

#Check individual sharks
sfshark1<- dplyr::filter(mako_df, shark %in% c("1"))
ggplot() +
  geom_point(data = sfshark1, aes(timestamp,latitude)) #good

sfshark2<- dplyr::filter(mako_df, shark %in% c("2"))
ggplot() +
  geom_point(data = sfshark2, aes(timestamp,latitude)) #good

sfshark3<- dplyr::filter(mako_df, shark %in% c("3"))
ggplot() +
  geom_point(data = sfshark3, aes(timestamp,latitude)) 
#Change of 627km (23 to 17) in 6 hours on May 12th 2013. Remove as outlier
# != 17.4035

sfshark4<- dplyr::filter(mako_df, shark %in% c("4"))
ggplot() +
  geom_point(data = sfshark4, aes(timestamp,latitude)) 
#Change of 632km (16 to 11) on July 21st 2013. Remove as outlier
#!= 11.2176

sfshark5<- dplyr::filter(mako_df, shark %in% c("5"))
ggplot() +
  geom_point(data = sfshark5, aes(timestamp,latitude)) #good

sfshark6<- dplyr::filter(mako_df, shark %in% c("6"))
ggplot() +
  geom_point(data = sfshark6, aes(timestamp,latitude)) #good

sfshark7<- dplyr::filter(mako_df, shark %in% c("7"))
ggplot() +
  geom_point(data = sfshark7, aes(timestamp,latitude)) #good

sfshark8<- dplyr::filter(mako_df, shark %in% c("8"))
ggplot() +
  geom_point(data = sfshark8, aes(timestamp,latitude)) #good

sfshark9<- dplyr::filter(mako_df, shark %in% c("9"))
ggplot() +
  geom_point(data = sfshark9, aes(timestamp,latitude)) 
#Change of 1000 km in an hour and change of 594km in an hour on May 21st 2014. Remove both as outliers
#!= 18.9448 and !=28.1689

sfshark10<- dplyr::filter(mako_df, shark %in% c("10"))
ggplot() +
  geom_point(data = sfshark10, aes(timestamp,latitude)) #good

sfshark11<- dplyr::filter(mako_df, shark %in% c("11"))
ggplot() +
  geom_point(data = sfshark11, aes(timestamp,latitude)) 
#Change of 1000km in 2 hours on May 19th 2015. Remove as outlier
#!= 34.4313

sfshark12<- dplyr::filter(mako_df, shark %in% c("12"))
ggplot() +
  geom_point(data = sfshark12, aes(timestamp,latitude)) #good

sfshark13<- dplyr::filter(mako_df, shark %in% c("13"))
ggplot() +
  geom_point(data = sfshark13, aes(timestamp,latitude)) #good

sfshark14<- dplyr::filter(mako_df, shark %in% c("14"))
ggplot() +
  geom_point(data = sfshark14, aes(timestamp,latitude)) #good

sfshark15<- dplyr::filter(mako_df, shark %in% c("15"))
ggplot() +
  geom_point(data = sfshark15, aes(timestamp,latitude)) #good

sfshark16<- dplyr::filter(mako_df, shark %in% c("16"))
ggplot() +
  geom_point(data = sfshark16, aes(timestamp,latitude)) #good

sfshark17<- dplyr::filter(mako_df, shark %in% c("17"))
ggplot() +
  geom_point(data = sfshark17, aes(timestamp,latitude)) #good

sfshark18<- dplyr::filter(mako_df, shark %in% c("18"))
ggplot() +
  geom_point(data = sfshark18, aes(timestamp,latitude)) #good

sfshark19<- dplyr::filter(mako_df, shark %in% c("19"))
ggplot() +
  geom_point(data = sfshark19, aes(timestamp,latitude)) #good

sfshark20<- dplyr::filter(mako_df, shark %in% c("20"))
ggplot() +
  geom_point(data = sfshark20, aes(timestamp,latitude)) #good

sfshark21<- dplyr::filter(mako_df, shark %in% c("21"))
ggplot() +
  geom_point(data = sfshark21, aes(timestamp,latitude)) #good

sfshark22<- dplyr::filter(mako_df, shark %in% c("22"))
ggplot() +
  geom_point(data = sfshark22, aes(timestamp,latitude)) 
#Change of 540km in 3 min on March 29th 2015. Remove as outlier
#!= 17.3056

sfshark23<- dplyr::filter(mako_df, shark %in% c("23"))
ggplot() +
  geom_point(data = sfshark23, aes(timestamp,latitude)) #good

sfshark24<- dplyr::filter(mako_df, shark %in% c("24"))
ggplot() +
  geom_point(data = sfshark24, aes(timestamp,latitude)) #good

sfshark25<- dplyr::filter(mako_df, shark %in% c("25"))
ggplot() +
  geom_point(data = sfshark25, aes(timestamp,latitude)) #good

sfshark26<- dplyr::filter(mako_df, shark %in% c("26"))
ggplot() +
  geom_point(data = sfshark26, aes(timestamp,latitude)) 
#Change of 480km in 35 min on September 12th 2014. Remove as outlier
#!= 45.3202

#Create new data set of sf makos with outliers removed
mako_df2 <- mako_df[mako_df$latitude != '17.4035' & mako_df$latitude != '11.2176' & mako_df$latitude != '18.9448' & mako_df$latitude != '28.1689' & mako_df$latitude != '34.4313' & mako_df$latitude != '17.3056' & mako_df$latitude != '45.3202', ] #good now
remove(mako_df)
ggplot() +
  geom_point(data = mako_df2, aes(timestamp, latitude, col='shark')) +
  ggtitle("Latitudinal movements of shortfin mako sharks over time")

#Save clean dataset
save(mako_df2, file="mako_df2.Rdata")

#####################################################################################

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
white_YOY<-dplyr::filter(white_df, white_df$`Shark Name` %in% c("Hudson","Gurney", "Mission", "J.D", "Manhattan", "Gratitude", "Finn", "Laurel Jean", "Singles U Up", "Azlyn"))

#10 subadults, 5 male, 5 female
white_subadult<-dplyr::filter(white_df, white_df$`Shark Name` %in% c("Yeti", "Betsy", "Miss Costa", "Helena", "Edithe", "Ormond", "Hirtle", "Ocracoke", "Teazer", "Nova"))

#Exploratory plots#
#Movement of mature males over time
ggplot() +
  geom_point(data = white_matureM, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature male white sharks over time")
#Check individual males
#Vimy
vimy<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Vimy"))
ggplot() +
  geom_point(data = vimy, aes(Timestamp, Latitude, col='Shark Name')) #good

#Sydney
sydney<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Sydney"))
ggplot() +
  geom_point(data = sydney, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 247km in 12 min on October 26th at 11pm (40 and 42 degrees). Remove 40 degree point of class B as outlier. 
#!= '40.33185'

#Ulysses
ulysses<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Ulysses"))
ggplot() +
  geom_point(data = ulysses, aes(Timestamp, Latitude, col='Shark Name')) #good

#Scot
scot<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Scot"))
ggplot() +
  geom_point(data = scot, aes(Timestamp, Latitude, col='Shark Name')) #good

#Murdoch
murdoch<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Murdoch"))
ggplot() +
  geom_point(data = murdoch, aes(Timestamp, Latitude, col='Shark Name')) #good

#Mahone
mahone<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Mahone"))
ggplot() +
  geom_point(data = mahone, aes(Timestamp, Latitude, col='Shark Name')) #good

#Jefferson
jefferson<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Jefferson"))
ggplot() +
  geom_point(data = jefferson, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1000km in 3 min on March 25th at 11pm so remove as outlier. 
#!= '43.42363'

#Hilton
hilton<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Hilton"))
ggplot() +
  geom_point(data = hilton, aes(Timestamp, Latitude, col='Shark Name')) #good

#Hal
hal<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Hal"))
ggplot() +
  geom_point(data = hal, aes(Timestamp, Latitude, col='Shark Name')) #good

#Bob
bob<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Bob"))
ggplot() +
  geom_point(data = bob, aes(Timestamp, Latitude, col='Shark Name')) #good

#Create new data set of white mature males with outliers removed
white_matureM2<- white_matureM[white_matureM$Latitude != '43.42363' & white_matureM$Latitude != '40.33185', ] #good now
remove(white_matureM)
 ggplot() +
  geom_point(data = white_matureM2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature male white sharks over time")

##Movement of mature females over time##
ggplot() +
  geom_point(data = white_matureF, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature female white sharks over time")
#Check individual females
#Unama'ki
unamaki<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Unama'ki"))
ggplot() +
  geom_point(data = unamaki, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 650km in 4 min on November 11th 2019 at noon. Remove as outlier
# != 22.24411

#Nukumi
nukumi<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Nukumi"))
ggplot() +
  geom_point(data = nukumi, aes(Timestamp, Latitude, col='Shark Name')) # good

#Lydia
lydia<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Lydia"))
ggplot() +
  geom_point(data = lydia, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1150km in 10 hours on December 24th/25th 2014. Remove as outlier
# != 21.602

#Luna
luna<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Luna"))
ggplot() +
  geom_point(data = luna, aes(Timestamp, Latitude, col='Shark Name')) #good

#Katharine
katharine<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Katharine"))
ggplot() +
  geom_point(data = katharine, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 3445km in 5 hours on Feb 16th 2015. Remove as outlier
# != 4.842

#Genie
genie<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Genie"))
ggplot() +
  geom_point(data = genie, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1100 km in 9min on October 6th 2013. Remove as outlier. 
# != 51.222

#Create new dataset of mature females with outliers removed
white_matureF2 <- white_matureF[white_matureF$Latitude != '22.24411' & white_matureF$Latitude != '21.602' & white_matureF$Latitude != '4.842' & white_matureF$Latitude != '51.222' , ]
remove(white_matureF)
ggplot() +
  geom_point(data = white_matureF2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature female white sharks over time")

##Movement of sub-adults over time##
ggplot() +
  geom_point(data = white_subadult, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of sub-adult white sharks over time")
#Check individual sub-adults
#Yeti
yeti<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Yeti"))
ggplot() +
  geom_point(data = yeti, aes(Timestamp, Latitude, col='Shark Name')) #good

#Teazer
teazer<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Teazer"))
ggplot() +
  geom_point(data = teazer, aes(Timestamp, Latitude, col='Shark Name')) #good

#Ormond
ormond<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Ormond"))
ggplot() +
  geom_point(data = ormond, aes(Timestamp, Latitude, col='Shark Name')) #good

#Ocracoke
ocracoke<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Ocracoke"))
ggplot() +
  geom_point(data = ocracoke, aes(Timestamp, Latitude, col='Shark Name')) #good

#Nova
nova<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Nova"))
ggplot() +
  geom_point(data = nova, aes(Timestamp, Latitude, col='Shark Name')) #good

#Miss Costa
misscosta<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Miss Costa"))
ggplot() +
  geom_point(data = misscosta, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1203 km in 40 min on June 13th 2019. Remove outlier
#!= 26.71676

#Hirtle
hirtle<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Hirtle"))
ggplot() +
  geom_point(data = hirtle, aes(Timestamp, Latitude, col='Shark Name')) #good

#Helena
helena<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Helena"))
ggplot() +
  geom_point(data = helena, aes(Timestamp, Latitude, col='Shark Name')) #good

#Edithe
edithe<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Edithe"))
ggplot() +
  geom_point(data = edithe, aes(Timestamp, Latitude, col='Shark Name')) #good

#Betsy
betsy<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Betsy"))
ggplot() +
  geom_point(data = betsy, aes(Timestamp, Latitude, col='Shark Name'))

#Create new dataset of subadults with outliers removed
white_subadult2 <- white_subadult[white_subadult$Latitude != '26.71676', ]
remove(white_subadult)
ggplot() +
  geom_point(data = white_subadult2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of sub-adult white sharks over time")

##Movement of YOY over time##
ggplot() +
  geom_point(data = white_YOY, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of YOY white sharks over time")
#Check individual YOY
#Singles U Up
singlesuup<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Singles U Up"))
ggplot() +
  geom_point(data = singlesuup, aes(Timestamp, Latitude, col='Shark Name')) #good

#Mission
mission<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Mission"))
ggplot() +
  geom_point(data = mission, aes(Timestamp, Latitude, col='Shark Name')) #good

#Hudson
hudson<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Hudson"))
ggplot() +
  geom_point(data = hudson, aes(Timestamp, Latitude, col='Shark Name')) #good

#Gurney
gurney<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Gurney"))
ggplot() +
  geom_point(data = gurney, aes(Timestamp, Latitude, col='Shark Name')) #good

#Gratitude
gratitude<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Gratitude"))
ggplot() +
  geom_point(data = gratitude, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 400km in 40 min March 10th. Remove as outlier
#!= 35.496

#Finn
finn<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Finn"))
ggplot() +
  geom_point(data = finn, aes(Timestamp, Latitude, col='Shark Name')) #good

#Azlyn
azlyn<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Azlyn"))
ggplot() +
  geom_point(data = azlyn, aes(Timestamp, Latitude, col='Shark Name')) #good

#Create new YOY dataset with outliers removed
white_YOY2 <- white_YOY[white_YOY$Latitude != '35.496', ]
remove(white_YOY)
ggplot() +
  geom_point(data = white_YOY2, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of YOY white sharks over time")

#Save clean datasets
save(white_matureM2, file = "white_matureM2.Rdata")
save(white_matureF2, file = "white_matureF2.Rdata")
save(white_subadult2, file = "white_subadult2.Rdata")
save(white_YOY2, file = "white_YOY2.Rdata")
