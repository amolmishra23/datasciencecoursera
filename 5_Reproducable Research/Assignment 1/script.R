data<-read.csv("activity.csv")
library(ggplot2)
total.steps<-tapply(data$steps,data$date,FUN=sum,na.rm=TRUE)
png("plot1.png")
qplot(total.steps,binwidth=1000,xlab="Total number of steps taken each day")
dev.off()
mean(total.steps,na.rm=TRUE)
median(total.steps,na.rm=TRUE)

class(data$steps)
averages<-aggregate(list(steps=data$steps),list(interval=data$interval),FUN=mean,na.rm=TRUE)
png("plot2.png")
ggplot(data=averages,aes(x=interval,y=steps))+geom_line()+
    xlab("5-minute interval")+ylab("average number of steps taken")
dev.off()
averages[which.max(averages$steps),]

missing<-is.na(data$steps)
table(missing)


fill.value<-function(steps,interval){
    filled<-NA
    if (!is.na(steps)){
        filled<-c(steps)
    }
    else {
        filled<-(averages[averages$interval==interval,"steps"])
    }
    return(filled)
}
filled.data<-data
filled.data$steps<-mapply(fill.value,filled.data$steps,filled.data$interval)



total.steps<-tapply(filled.data$steps,filled.data$date,FUN=sum)
png("plot3.png")
qplot(total.steps,binwidth=1000,xlab="total number of steps taken each day")
dev.off()

mean(total.steps)
median(total.steps)



weekday.or.weekend <- function(date){
    day<-weekdays(date)
    if(day %in% c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")){
        return ("weekday")
    }
    else if(day %in% c("Saturday","Sunday")){
        return ("weekend")
    }
    else{
        stop("invalid date")
    }
}
filled.data$date<-as.Date(filled.data$date)
filled.data$day<-sapply(filled.data$date,FUN=weekday.or.weekend)


averages<-aggregate(steps~interval+day,data=filled.data,mean)
png("plot4.png")
ggplot(averages,aes(interval,steps))+geom_line()+
    facet_grid(day~.)+xlab("5-minute interval")+
    ylab("Number of steps")
dev.off()