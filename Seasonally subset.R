#SEASONAL DATA#

#load necessary packages
library(lubridate)
library(rerddap)
library(rerddapXtracto)
library(plotdap)

#load necessary files
. <- setwd("/Users/emmabradshaw/Desktop/Lund- Thesis")
load("~/Desktop/Lund- Thesis/Code/LUThesis/mako_df2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_subadult2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_YOY2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_matureF2.Rdata")
load("~/Desktop/Lund- Thesis/Code/LUThesis/white_matureM2.Rdata")

#Files already all set to POSIX format
#Subset by month range
#Winter
mako_winter <- subset(mako_df2, as.numeric(format.Date(timestamp,"%m")) %in% c(01,02,03))
save(mako_winter, file = "mako_winter.Rdata")
WM_winter <- subset(white_matureM2, as.numeric(format.Date(Timestamp,"%m")) %in% c(01,02,03))
save(WM_winter, file = "WM_winter.Rdata")
WF_winter <- subset(white_matureF2, as.numeric(format.Date(Timestamp,"%m")) %in% c(01,02,03))
save(WF_winter, file = "WF_winter.Rdata")
WSA_winter <- subset(white_subadult2, as.numeric(format.Date(Timestamp,"%m")) %in% c(01,02,03))
save(WSA_winter, file = "WSA_winter.Rdata")
WYOY_winter <- subset(white_YOY2, as.numeric(format.Date(Timestamp,"%m")) %in% c(01,02,03))
save(WYOY_winter, file = "WYOY_winter.Rdata")

#Spring
mako_spring <- subset(mako_df2, as.numeric(format.Date(timestamp,"%m")) %in% c(04,05,06))
save(mako_spring, file = "mako_spring.Rdata")
WM_spring <- subset(white_matureM2, as.numeric(format.Date(Timestamp,"%m")) %in% c(04,05,06))
save(WM_spring, file = "WM_spring.Rdata")
WF_spring <- subset(white_matureF2, as.numeric(format.Date(Timestamp,"%m")) %in% c(04,05,06))
save(WF_spring, file = "WF_spring.Rdata")
WSA_spring <- subset(white_subadult2, as.numeric(format.Date(Timestamp,"%m")) %in% c(04,05,06))
save(WSA_spring, file = "WSA_summer.Rdata")
WYOY_spring <- subset(white_YOY2, as.numeric(format.Date(Timestamp,"%m")) %in% c(04,05,06))
save(WYOY_spring, file = "WYOY_spring.Rdata")

#Summer
mako_summer <- subset(mako_df2, as.numeric(format.Date(timestamp,"%m")) %in% c(07,08,09))
save(mako_summer, file = "mako_summer.Rdata")
WM_summer <- subset(white_matureM2, as.numeric(format.Date(Timestamp,"%m")) %in% c(07,08,09))
save(WM_summer, file = "WM_summer.Rdata")
WF_summer <- subset(white_matureF2, as.numeric(format.Date(Timestamp,"%m")) %in% c(07,08,09))
save(WF_summer, file = "WF_summer.Rdata")
WSA_summer <- subset(white_subadult2, as.numeric(format.Date(Timestamp,"%m")) %in% c(07,08,09))
save(WSA_summer, file = "WSA_summer.Rdata")
WYOY_summer <- subset(white_YOY2, as.numeric(format.Date(Timestamp,"%m")) %in% c(07,08,09))
save(WYOY_summer, file = "WYOY_suumer.Rdata")

#Autumn
mako_autumn <- subset(mako_df2, as.numeric(format.Date(timestamp,"%m")) %in% c(10,11,12))
save(mako_autumn, file = "mako_autumn.Rdata")
WM_autumn <- subset(white_matureM2, as.numeric(format.Date(Timestamp,"%m")) %in% c(10,11,12))
save(WM_autumn, file = "WM_autumn.Rdata")
WF_autumn <- subset(white_matureF2, as.numeric(format.Date(Timestamp,"%m")) %in% c(10,11,12))
save(WF_autumn, file = "WF_autumn.Rdata")
WSA_autumn <- subset(white_subadult2, as.numeric(format.Date(Timestamp,"%m")) %in% c(10,11,12))
save(WSA_autumn, file = "WSA_autumn.Rdata")
WYOY_autumn <- subset(white_YOY2, as.numeric(format.Date(Timestamp,"%m")) %in% c(10,11,12))
save(WYOY_autumn, file = "WYOY_autumn.Rdata")

