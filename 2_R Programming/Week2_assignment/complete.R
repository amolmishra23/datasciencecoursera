complete <- function(directory,id=1:332)
{
	all_files<-list.files(directory,full.names=TRUE)
	list_id=c(id);
	list_nobs=c();
	counter<-1;
	for (i in id)
	{
		frame<-read.csv(all_files[i])
		list_nobs[counter]=nrow(na.omit(frame))
		counter<-counter+1
	}
	total_data<-data.frame(id=list_id,nobs=list_nobs)
	total_data
}
