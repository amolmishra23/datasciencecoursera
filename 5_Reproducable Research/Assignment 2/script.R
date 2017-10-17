library(dplyr)
library(ggplot2)
library(knitr)


setwd("D:/Data Science Certification/datasciencecoursera/5_Reproducable Research/Assignment 2")
data <- read.csv("StormData.csv.bz2")
dim(data)


storm_damage <- select(data, BGN_DATE,STATE, EVTYPE,
                       FATALITIES, INJURIES, PROPDMG, PROPDMGEXP,CROPDMG,CROPDMGEXP)
str(storm_damage)
head(storm_damage,100)


storm_damage$PROP_US <- 0
storm_damage$CROP_US <- 0
storm_damage$damage  <- 0
storm_damage$health  <- 0


#1 billion = 1,000,000,000
storm_damage$PROP_US <- ifelse(storm_damage$PROPDMGEXP =="H" | storm_damage$PROPDMGEXP =="h",
                               storm_damage$PROPDMG*0.0000001, storm_damage$PROP_US)
storm_damage$CROP_US <- ifelse(storm_damage$CROPDMGEXP =="H"|  storm_damage$CROPDMGEXP =="h",
                               storm_damage$CROPDMG*0.0000001, storm_damage$CROP_US)
storm_damage$PROP_US <- ifelse(storm_damage$PROPDMGEXP =="K"|  storm_damage$PROPDMGEXP =="k",
                               storm_damage$PROPDMG*0.000001,  storm_damage$PROP_US)
storm_damage$CROP_US <- ifelse(storm_damage$CROPDMGEXP =="K"|  storm_damage$CROPDMGEXP =="k",
                               storm_damage$CROPDMG*0.000001,  storm_damage$CROP_US)
storm_damage$PROP_US <- ifelse(storm_damage$PROPDMGEXP =="M"|  storm_damage$PROPDMGEXP =="m", 
                               storm_damage$PROPDMG*0.001,     storm_damage$PROP_US)
storm_damage$CROP_US <- ifelse(storm_damage$CROPDMGEXP =="M"|  storm_damage$CROPDMGEXP =="m", 
                               storm_damage$CROPDMG*0.001,     storm_damage$CROP_US)
storm_damage$PROP_US <- ifelse(storm_damage$PROPDMGEXP =="B"|  storm_damage$PROPDMGEXP =="b", 
                               storm_damage$PROPDMG*1,         storm_damage$PROP_US)
storm_damage$CROP_US <- ifelse(storm_damage$CROPDMGEXP =="B"|  storm_damage$CROPDMGEXP =="b",
                               storm_damage$CROPDMG*1,         storm_damage$CROP_US)


head(storm_damage,100)
storm_damage$health <- storm_damage$FATALITIES + storm_damage$INJURIES
storm_damage$damage <- storm_damage$PROP_US + storm_damage$CROP_US



health <- aggregate(storm_damage$health, by=list(storm_damage$EVTYPE), FUN = sum)
health <- arrange(health, desc(x))
health <- head(health,10)
health <- select(health, Event_Type = Group.1, Number_of_Injuries= x)



storm_PDMG <- aggregate(storm_damage$damage, by=list(storm_damage$EVTYPE), FUN = sum)
storm_PDMG <- arrange(storm_PDMG, desc(x))
storm_PDMG <- head(storm_PDMG,10)
storm_PDMG <- select(storm_PDMG, Event_Type = Group.1, Economic_Impact= x)



g<- ggplot(health, aes(reorder(Event_Type,-Number_of_Injuries), Number_of_Injuries)) + 
    labs(title="Total Fatalities & Injuries") +
    xlab("") + ylab("Number of injuries")
plot1<- g + geom_bar(aes(fill=Event_Type),stat="identity") + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
print(plot1)



g<- ggplot(storm_PDMG, aes(reorder(Event_Type,-Economic_Impact), Economic_Impact)) + 
    labs(title="Total Properties & Crop Damages") +
    xlab("") + ylab("U$ Billions")
plot2<- g + geom_bar(aes(fill=Event_Type), stat="identity") + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
print(plot2)


