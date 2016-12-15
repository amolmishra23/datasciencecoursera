##**Merges the training and the test sets to create one data set.**

Initially, it reads the training and test data and merges them into one data table. It reads the data from each of &quot;test&quot; and &quot;train&quot; folder. This process occurs independently for each of &quot;x&quot;,&quot;subj&quot;,&quot;y&quot; variable.

##**Extracts only the measurements on the mean and standard deviation for each measurement**.

We read features data. Using pattern matching, we find all the feature names which have either &quot;mean&quot; or &quot;std&quot; in it and only extract those column indexes from our &quot;x&quot; dataset.

##**Uses descriptive activity names to name the activities in the data set**

In &quot;x&quot; dataset, we rename the columns using the names from &quot;features&quot; data frame. In addition we also convert all the names to lower case and remove any &quot;(&quot; or &quot;)&quot; characters.
In addition to that we also read activities from activity\_labels file and do all the text pre formatting and then merge those names as the column names of &quot;y&quot; data table.

##**Appropriately labels the data set with descriptive variable names.**

We now merge all the 3 data tables and as its a properly formatted data we write it into &quot;merged.txt&quot; file.

##**From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

We find the mean based on activity and subject variables. And hence we have our average values data set also which is written onto disk as &quot;average.txt&quot;.