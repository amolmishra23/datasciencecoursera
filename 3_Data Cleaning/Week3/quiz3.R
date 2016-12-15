download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","q1.csv")
df<-data.frame(read.csv("q1.csv"))
str(df)
agricultureLogical <- df$ACR == 3 & df$AGS == 6
which(agricultureLogical)[1:3]



install.packages("jpeg")
library("jpeg")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg","q2.jpg",mode="wb")
img<-readJPEG("q2.jpg",native=TRUE)
quantile(img,c(0.3,0.8))



gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
eduURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
gdpFile <- tempfile()
eduFile <- tempfile()
download.file(gdpURL, gdpFile, method = "curl")
download.file(eduURL, eduFile, method = "curl")
gdpData <- read.csv(gdpFile, skip = 4, nrows = 190)
eduData <- read.csv(eduFile)
gdpData <- gdpData[, c(1, 2, 4, 5)]
colnames(gdpData) <- c("CountryCode", "Rank", "Country.Name", "GDP.Value")
gdpData$GDP.Value <- as.numeric(gdpData$GDP.Value)
matchedData <- merge(gdpData, eduData, by.x = "CountryCode", by.y = "CountryCode")
dim(matchedData)[1]
library(plyr)
arrange(matchedData, desc(Rank))[13, 3]




mean(subset(matchedData, Income.Group %in% "High income: OECD", select = c(Rank))$Rank)
mean(subset(matchedData, Income.Group %in% "High income: nonOECD", select = c(Rank))$Rank)


library(Hmisc)
matchedData$Rank.Groups = cut2(matchedData$Rank, g = 5)
table(matchedData$Income.Group, matchedData$Rank.Groups)