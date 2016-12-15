<<<<<<< HEAD
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data<-subset(NEI,fips=="24510")
Emissions <- aggregate(data$Emissions, by=list(data$year), FUN=sum)
png("plot2.png")
par(mar=rep(4,4))
b<-barplot(Emissions$x,Emissions$Group.1,col=Emissions$Group.1,main="Total emission of Baltimore city, MD",xlab="YEAR",ylab="PM 2.5 in tons")
dev.off()


=======
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
data<-subset(NEI,fips=="24510")
Emissions <- aggregate(data$Emissions, by=list(data$year), FUN=sum)
png("plot2.png")
par(mar=rep(4,4))
b<-barplot(Emissions$x,Emissions$Group.1,col=Emissions$Group.1,main="Total emission of Baltimore city, MD",xlab="YEAR",ylab="PM 2.5 in tons")
dev.off()


>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
#Answer: Yes, total emissions in baltimore are lower in 2008 than they were in 1998