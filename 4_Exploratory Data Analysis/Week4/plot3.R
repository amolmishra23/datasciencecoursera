<<<<<<< HEAD
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
MD <- subset(NEI, fips=="24510")
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))
png("plot3.png",width=1200,height=800,units="px")
ggplot(data=MD, aes(x=year,y=log(Emissions)))+facet_grid(.~type)+
    geom_boxplot(aes(fill=type))+xlab('YEAR')+ylab("Log of PM[2.5] emissions")+
    ggtitle("Emission per type in Baltimore, MArylans")
dev.off()


=======
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
MD <- subset(NEI, fips=="24510")
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))
png("plot3.png",width=1200,height=800,units="px")
ggplot(data=MD, aes(x=year,y=log(Emissions)))+facet_grid(.~type)+
    geom_boxplot(aes(fill=type))+xlab('YEAR')+ylab("Log of PM[2.5] emissions")+
    ggtitle("Emission per type in Baltimore, MArylans")
dev.off()


>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
#Answer: Emissions for Non-road, nonpoint and on-road have all decreased. Emissions for point have increased. 