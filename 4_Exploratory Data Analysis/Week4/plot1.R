<<<<<<< HEAD
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Emissions <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
Emissions$PM<-round(Emissions$x/1000000,2)
png("plot1.png")
par(mar=rep(4,4))
b<-barplot(Emissions$PM,Emissions$Group.1,col=Emissions$Group.1,main="Total emission of PM[2.5]",xlab="YEAR",ylab="PM 2.5 in Megatons")
dev.off()


=======
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Emissions <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
Emissions$PM<-round(Emissions$x/1000000,2)
png("plot1.png")
par(mar=rep(4,4))
b<-barplot(Emissions$PM,Emissions$Group.1,col=Emissions$Group.1,main="Total emission of PM[2.5]",xlab="YEAR",ylab="PM 2.5 in Megatons")
dev.off()


>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
#Answer: Yes, emissions have decreased over time