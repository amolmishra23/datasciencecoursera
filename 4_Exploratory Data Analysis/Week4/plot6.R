NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# NEI$year<-factor(NEI$year,levels = c("1999","2002","2005","2008"))
MD.onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA.onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
MD.df<-aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
CA.df<-aggregate(CA.onroad[, 'Emissions'], by=list(CA.onroad$year), sum)
MD.df$round<-round(MD.df[,2],2)
CA.df$round<-round(CA.df[,2],2)
png("plot6.png",width=1200,height=800,units="px")
p1<-qplot(Group.1,round,data=MD.df)+geom_smooth(col="red")+
    xlab("YEAR")+ylab("Emissions in tons")+ggtitle("Total emission of PM[2.5] in BAltimore")
p2<-qplot(Group.1,round,data=CA.df)+geom_smooth(col="magenta")+
    xlab("YEAR")+ylab("Emissions in tons")+ggtitle("Total emission of PM[2.5] in Los Angeles")
grid.arrange(p1,p2,ncol=2)
dev.off()
#we can see Baltimore has had a larger proportionate reduction in emissions from 1998 to 2008