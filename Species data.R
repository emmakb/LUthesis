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

#No outliers "on land" 
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
  geom_point(data = vimy, aes(Longitude, Timestamp, col='Shark Name')) 
#Point on land December 24th 2020 & December 25th 202 & August 15th 2021, remove as outlier
#!= "31.06614"(#1732) & !="26.75044" (#2178) & 48.00224 (#1886)

#Sydney
sydney<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Sydney"))
ggplot() +
  geom_point(data = sydney, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 247km in 12 min on October 26th 2020 at 11pm (40 and 42 degrees). Remove 40 degree point of class B as outlier. 
#!= '40.33185' (#1622)
#Point on land on October 26th 2020, remove as outlier
#!= "42.55950" (#1621)

#Ulysses
ulysses<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Ulysses"))
ggplot() +
  geom_point(data = ulysses, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, September 30th 2021 
#!="44.61136"(#1932) 

#Scot
scot<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Scot"))
ggplot() +
  geom_point(data = scot, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, July 1st 2022 & April 20th 2022 & June 5th 2022 & April 20th 2022 remove as outlier
#!= "38.01821" (#2434) + !="27.11272" (#2319) + !="28.17471' (#2422) + !="26.92095" (#2316)

#Murdoch
murdoch<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Murdoch"))
ggplot() +
  geom_point(data = murdoch, aes(Timestamp, Latitude, col='Shark Name')) #good

#Mahone
mahone<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Mahone"))
ggplot() +
  geom_point(data = mahone, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land November 7th 2020
#!="44.88211" (#1630)

#Jefferson
jefferson<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Jefferson"))
ggplot() +
  geom_point(data = jefferson, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1000km in 3 min on March 25th 2019 at 11pm so remove as outlier. 
#!= '43.42363' (#790)
#Point on land, October 21st 2018 
#!="34.22706"(#563) 

#Hilton
hilton<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Hilton"))
ggplot() +
  geom_point(data = hilton, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land October 4th 2018 & December 30th 2018 & March 4th 2018 & June 13th 2018 & October 19th 2017 & November 6th 2017, February 6th 2019 x2 remove as outlier
#!= "47.39731" (#515)+ != "30.32050" (#704) + !="28.74019" (#327) + !="34.95270" (#416) + !="44.01800" (#187?) + !="44.33861" (#202) 
#Point on land, November 7th 2017
#45.00898 (#204) 

#Hal
hal<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Hal"))
ggplot() +
  geom_point(data = hal, aes(Timestamp, Latitude, col='Shark Name'))
#Points on land December 14th 2018 & May 30th 2019 & July 31st 2020 & February 6th 2020 & April 9th 2019, remove as outliers
#!= "21.50314" (#693)+ != "35.73477" (#821)+ != "46.29630" (#1450) + !="34.25591" (#1254) + !="35.32429" (#809)
#Point on land, November 14th 2018
#37.68169 (#615)

#Bob
bob<-dplyr::filter(white_matureM, white_matureM$`Shark Name` %in% c("Bob"))
ggplot() +
  geom_point(data = bob, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land on October 21st 2021, remove as outlier
#!= "39.42980" (#1951)

#Create new data set of white mature males with 27 outliers removed
#Set a limit on the date to match those of the env. variables
whitematureMordered<-white_matureM %>% arrange(Timestamp)
white_matureM2<-whitematureMordered[-c(187,202,204,327,416,515,563,615,693,704,790,809,821,1254,1450,1621,1622,1630,1732,1886,1932,1951,2178,2316,2319,2422,2434,2430:2655),]
remove(white_matureM)
 ggplot(data = white_matureM2, aes(Timestamp, Latitude)) +
  geom_point(col="blue") + xlab("Time (Years)") + scale_y_continuous(limits=c(20,50)) + 
   theme_classic() + 
  ggtitle("Latitudinal movements of 10 mature male white sharks over time")

##Movement of mature females over time##
ggplot() +
  geom_point(data = white_matureF, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of mature female white sharks over time")
#Check individual females
#Unama'ki
unamaki<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Unama'ki"))
ggplot() +
  geom_point(data = unamaki, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 650km in 4 min on November 13th 2019 at noon. Remove as outlier
# != 22.24411 (#4848)

#Nukumi
nukumi<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Nukumi"))
ggplot() +
  geom_point(data = nukumi, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land on November 15th 2020, remove as outlier
#36.59307 (#5141)

#Lydia
lydia<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Lydia"))
ggplot() +
  geom_point(data = lydia, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1150km in 10 hours on October 24th/25th 2014. Remove as outlier
# != 21.602 (#2534)
#Points on land, October 27th 2013 x 4, remove as outliers
#47.12100 (#973) + 47.05000 (#974) + 47.17500 (#975) + 47.16100 (#976)
#Points on land October 28th 2013
#47.25900 (#978)

#Luna
luna<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Luna"))
ggplot() +
  geom_point(data = luna, aes(Timestamp, Latitude, col='Shark Name')) 
#Point in St-Lawrence on December 2nd 2018, remove as outlier
#48.82158 (#4681)

#Katharine
katharine<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Katharine"))
ggplot() +
  geom_point(data = katharine, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 3445km in 5 hours on Feb 16th 2015. Remove as outlier
# != 4.842 (#3102)
#Point on land, January 23rd 2015 and May 1st 2015 + May 12th and 13th 2014, remove as outliers
#30.68300 (#2993) + 30.31800 (#3313) + 27.82900 (#2238) + 27.84000 (#2239)

#Genie
genie<-dplyr::filter(white_matureF, white_matureF$`Shark Name` %in% c("Genie"))
ggplot() +
  geom_point(data = genie, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 1100 km in 9min on October 6th 2013. Remove as outlier. 
# != 51.222 (#842)

#Create new dataset of mature females with 15 outliers removed
whitematureFordered<-white_matureF %>% arrange(Timestamp)
white_matureF2<-whitematureFordered[-c(842,973,974,975,976,978,2238,2239,2993,2534,3102,3313,4681,4848,5141),]
##all clean##
remove(white_matureF)
ggplot(white_matureF2, aes(Timestamp, Latitude)) +
  geom_line(col="blue") + xlab("Years") + ylab("Latitude") +
  ggtitle("Latitudinal movements of 7 mature female white sharks over time")

##Movement of sub-adults over time##
ggplot() +
  geom_point(data = white_subadult, aes(Timestamp, Latitude, col='Shark Name')) +
  ggtitle("Latitudinal movements of sub-adult white sharks over time")
#Check individual sub-adults
#Yeti
yeti<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Yeti"))
ggplot() +
  geom_point(data = yeti, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, May 20th 2018 & November 30th 2018 x2 & November 22nd 2016, remove as outlier
#31.03487(#281) + 38.30823(#358) 38.39456 (#357)+ 35.57700(#131)

#Teazer
teazer<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Teazer"))
ggplot() +
  geom_point(data = teazer, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, November 6th 2020 & July 15th 2020, remove as outlier
#33.77154 (#904) + 46.20452 (#725)

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
#!= 26.71676 (#452)
#Points on land, June 17th 2019, June 13th 2019, November 19th 2016, June 24th 2018, December 1st 2018, February 9th 2018, March 7th 2019, April 3rd 2019, remove as outliers
#40.90745 (#454)+ 37.54695 (#453)+ 20.89400 (#130) + 35.09038 (#282) + 36.45897(#362) + 25.57978(#249) + 27.60256 (#412) + 26.37422(#428)

#Hirtle
hirtle<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Hirtle"))
ggplot() +
  geom_point(data = hirtle, aes(Timestamp, Latitude, col='Shark Name')) #good

#Helena
helena<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Helena"))
ggplot() +
  geom_point(data = helena, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, May 23rd 2020 & November 21st 2020, remove as outlier
#37.96828(#689) + 26.37422(#949)

#Edithe
edithe<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Edithe"))
ggplot() +
  geom_point(data = edithe, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, January 11th 2021, November 24th 2020, remove as outlier
#30.02627 (#1011) + 27.60256(#958)

#Betsy
betsy<-dplyr::filter(white_subadult, white_subadult$`Shark Name` %in% c("Betsy"))
ggplot() +
  geom_point(data = betsy, aes(Timestamp, Latitude, col='Shark Name'))
#Points in pacific on September 21st 2014 & April 4th 2015 & September 25th 2014 & November 10th 2015, remove as outliers
#54.21600 (#18) + 35.47400 (#29) + 38.69600 (#19) + 41.003 (#35)

#Create new dataset of subadults with 23 outliers removed
#Set a limit on the date to match that of the env. varibales
whitesubadultordered<-white_subadult %>% arrange(Timestamp)
white_subadult2 <- whitesubadultordered[-c(18,19,29,35,130,131,249,281,357,358,362,412,428,452,453,454,689,725,904,949,958,1011,1523:1654), ]
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
  geom_point(data = hudson, aes(Timestamp, Latitude, col='Shark Name')) 
#Points on land, May 21st 2019 x2 & November 8th 2017, remove as outliers
#25.61974 (#413) + 25.61780 (#414) + 36.66339 (#360)

#Gurney
gurney<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Gurney"))
ggplot() +
  geom_point(data = gurney, aes(Timestamp, Latitude, col='Shark Name')) 
#Point on land, January 13th 2018, remove as outlier
#35.20161 (#375)

#Gratitude
gratitude<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Gratitude"))
ggplot() +
  geom_point(data = gratitude, aes(Timestamp, Latitude, col='Shark Name'))
#Change of 400km in 40 min March 10th 2017. Remove as outlier
#!= 35.496 (#67)

#Finn
finn<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Finn"))
ggplot() +
  geom_point(data = finn, aes(Timestamp, Latitude, col='Shark Name')) #good

#Azlyn
azlyn<-dplyr::filter(white_YOY, white_YOY$`Shark Name` %in% c("Azlyn"))
ggplot() +
  geom_point(data = azlyn, aes(Timestamp, Latitude, col='Shark Name')) #good

#Create new YOY dataset with 5 outliers removed
whiteYOYordered<-white_YOY %>% arrange(Timestamp)
white_YOY2 <- whiteYOYordered[-c(67,360,375,413,414),]
##all clean
remove(white_YOY)
ggplot(data = white_YOY2, aes(Timestamp, Latitude)) +
  geom_point(col="blue") + xlab("Time (Years)") + scale_y_continuous(limits=c(25, 45)) + 
  ggtitle("Latitudinal movements of 10 YOY white sharks over time")

#Save clean datasets
save(white_matureM2, file = "white_matureM2.Rdata") #clean
save(white_matureF2, file = "white_matureF2.Rdata") #clean
save(white_subadult2, file = "white_subadult2.Rdata") #clean
save(white_YOY2, file = "white_YOY2.Rdata") #clean
