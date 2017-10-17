rankhospital<-function(state,outcome,num="best"){
    #reading input data
    full_data<-read.csv("outcome-of-care-measures.csv",colClasses="character")
    #As mentioned in the question
    valid_outcomes<-c("heart attack","heart failure","pneumonia")
    #finding valid outcomes column numbers to make the execution easier
    valid_column<-c(11,17,23)
    #we are creating their indexes to be used eaily in our program
    #finding a list of unique states available in the entire database.
    valid_state<-as.character(unique(full_data[,7]))
    #if we didnt find our input state in list of valid states means that the input is wrong
    if((state %in% valid_state)==FALSE) stop("invalid state")
    #if we didnt find our input outcome in list of valid outcome means that the input is wrong
    if((outcome %in% valid_outcomes)==FALSE) stop("invalid outcome")
    #saving the actual column names from table2
    column <- if (outcome == "heart attack") {
        11
    } else if (outcome == "heart failure") {
        17
    } else if (outcome == "pneumonia") {
        23
    } else {
        stop("invalid outcome")
    }
    column<-as.numeric(column)
    #apply condition to extract only input state data
    #extracting only hospital name and outcome columns
    #data_for_state <- full_data[full_data$State== state, c("Hospital.Name", column)]
    data_for_state<-subset(full_data,State==state,select=c(2,column))
    #convert it to numeric type as it was character class
    data_for_state[,2]<-as.numeric(data_for_state[,2])
    #we first sort the outcome data
    #if clash comes, for tie breaking we need to sort as per hospital name(thats why second column)
    ordered_data_for_state<-order(data_for_state[[2]],data_for_state[[1]],decreasing=FALSE,na.last=NA)
    #extracting the final result.
    if (num == "best") {
        as.character(data_for_state[[1]][ordered_data_for_state[1]])
    } else if (num == "worst") {
        as.character(data_for_state[[1]][ordered_data_for_state[length(ordered_data_for_state)]])
    } else if (is.numeric(num)) {
        as.character(data_for_state[[1]][ordered_data_for_state[num]])
    } else {
        stop("invalid num")
    }
}