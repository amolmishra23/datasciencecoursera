pollutantmean <- function(dir,pol,id=1:332)
{
    file1<-list.files(dir,full.names=TRUE)
    data1<-data.frame()
    
    for (i in id)
    {
        data1<-rbind(data1,read.csv(file1[i]))
    }
    mean_data<-mean(data1[,pol],na.rm=TRUE)
    round(mean_data,digits=3)
}




