

con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
htmlCode
nchar(htmlCode[c(10,20,30,100)])
?read.fwf

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for","./Data/q2b.for")
file_name<-"./data/q2b.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
#each positive number means that many chars to be read in file
#each negative number means that many chars to skip in file
head(df)
sum(df[, 4])
