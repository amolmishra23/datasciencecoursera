dt<-data.table(read.csv("a.csv"))
setkey(dt,VAL)
z<-dt[,.N,by=VAL]
print(z)



setkey(dt, FES)
dt[, .N, key(dt)]

library("xlsx")
install.packages("xlsx")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","2.xlsx",mod="wb")
dat<-read.xlsx("./2.xlsx",sheetIndex=1,rowIndex=18:23,colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T)


library("XML")
install.packages("XML")

fileurl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc<-xmlTreeParse(fileurl,useInternal=TRUE)
rootnode<-xmlRoot(doc)
# xmlName(rootnode)
# xmlName(rootnode[[1]])
# names(rootnode[[1]])
# xmlName(rootnode[[1]][[1]])
# names(rootnode[[1]][[1]])
zipcode<-xpathSApply(rootnode, "//zipcode", xmlValue)
table(zipcode == 21231)
# table(zipcode)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","2.csv")


library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile="./microdata3.csv")
DT <- fread("./microdata3.csv")
file.info("./microdata3.csv")$size
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1])+system.time(rowMeans(DT)[DT$SEX==2]
)
