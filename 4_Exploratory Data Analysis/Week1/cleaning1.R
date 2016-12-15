<<<<<<< HEAD
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('week1.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]
write.table(power.consumption,file='power_consumption.txt',sep='|',row.names=FALSE)
=======
variable.class<-c(rep('character',2),rep('numeric',7))
power.consumption<-read.table('week1.txt',header=TRUE,
                              sep=';',na.strings='?',colClasses=variable.class)
power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
        'SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]
write.table(power.consumption,file='power_consumption.txt',sep='|',row.names=FALSE)
>>>>>>> 00819531fb3b7665a19fbb382713afe1d2884d3c
