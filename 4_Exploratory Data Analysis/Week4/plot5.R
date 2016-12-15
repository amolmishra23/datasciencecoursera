<<<<<<< HEAD
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
MD.onroad <- subset(NEI, fips == "24510" & type == 'ON-ROAD')
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
MD.df$round<-round(MD.df[,2],2)
png("plot5.png",width=1200,height=800,units="px")
qplot(Group.1,round,data=MD.df)+geom_smooth(col="red")+
    xlab("YEAR")+ylab("Emissions in tons")+ggtitle("Total emission of PM[2.5]")
dev.off()

=======
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
MD.onroad <- subset(NEI, fips == "24510" & type == 'ON-ROAD')
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
MD.df$round<-round(MD.df[,2],2)
png("plot5.png",width=1200,height=800,units="px")
qplot(Group.1,round,data=MD.df)+geom_smooth(col="red")+
    xlab("YEAR")+ylab("Emissions in tons")+ggtitle("Total emission of PM[2.5]")
dev.off()

>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
#Emissions from cars in Baltimore have decreased by more than half from 1999 to 2008