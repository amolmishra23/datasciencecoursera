source("complete.R")

corr<-function(directory="D:/New folder/rprog_data_specdata/specdata", threshold=0)
{
    data_frame<-complete(directory)
    data_filter_threshold<-which(data_frame$nobs>threshold)
    full_file_list<-list.files(directory,full.names=TRUE)
    correlation<-c()
    increment<-1
    if(length(data_filter_threshold)==0)
    {
        correlation
    }
    for(iterator in data_filter_threshold)
    {
        data_for_corr_all<-read.csv(full_file_list[iterator])
        data_for_corr<-na.omit(data_for_corr_all)
        correlation[increment]<-cor(data_for_corr[,2],data_for_corr[,3])
        increment<-increment+1
    }
    correlation
}