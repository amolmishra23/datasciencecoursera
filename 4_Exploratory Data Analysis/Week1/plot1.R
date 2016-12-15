<<<<<<< HEAD
power<-data.table(read.csv("cleaned.csv"))
png("plot1.png",width=480,height = 480,units="px")
colnames(power)
hist(power$Globalactivepower,col="red",xlab = "Global Active Power (kilowatts)")
x<-dev.off()
=======
power<-data.table(read.csv("cleaned.csv"))
png("plot1.png",width=480,height = 480,units="px")
colnames(power)
hist(power$Globalactivepower,col="red",xlab = "Global Active Power (kilowatts)")
x<-dev.off()
>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
