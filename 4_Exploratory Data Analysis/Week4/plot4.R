<<<<<<< HEAD
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
merge.sum$round<-round(merge.sum[,2]/1000,2)
png("plot4.png",width=1200,height=800,units="px")
qplot(Group.1,round,data=merge.sum)+geom_smooth(col="red")+
    xlab("YEAR")+ylab("Emissions in kilotons")+ggtitle("Total emission of PM[2.5]")
dev.off()

=======
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
merge.sum$round<-round(merge.sum[,2]/1000,2)
png("plot4.png",width=1200,height=800,units="px")
qplot(Group.1,round,data=merge.sum)+geom_smooth(col="red")+
    xlab("YEAR")+ylab("Emissions in kilotons")+ggtitle("Total emission of PM[2.5]")
dev.off()

>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
#From 1999 to 2008, emissions from coal combustion sources have dropped sharply with the most pronounced decreases occurring from 2005 to 2008