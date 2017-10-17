library("data.table")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","q41.csv")
c<-data.table(read.csv("q41.csv"))
s<-strsplit(names(c),"wgtp")
s[123]
library("stringr")


q2 <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
               skip=4, stringsAsFactors=FALSE, nrows=190)
q2_GDP <- q2[,5]
mean(as.numeric(gsub("\\,", "", q2_GDP)))



q41<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              skip=4,stringsAsFactors = FALSE,nrows=190)
q42<-read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")
names(q42)
mergeddata<-merge(q41,q42,by.x="X",by.y="CountryCode",all=TRUE)
mergeddata$Special.Notes
r<-grepl("Fiscal year end: June 30",mergeddata$Special.Notes)
table(r)

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
table(grepl("^2012",sampleTimes))
monday_data<-sampleTimes[which(grepl("^2012",sampleTimes))]
table(grepl("Monday",weekdays(monday_data)))

