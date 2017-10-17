best<-function(state,outcome){
    #reading the data, predefining colClasses as character to reduce time of execution
    outcome_data<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
    #As mentioned in the question
    valid_outcomes<-c("heart attack","heart failure","pneumonia")
    #finding valid outcomes column numbers to make the execution easier
    valid_column<-c(11,17,23)
    #finding a list of unique states available in the entire database.
    valid_state<-as.character(unique(outcome_data[,7]))
    #if we didnt find our input state in list of valid states means that the input is wrong
    if((state %in% valid_state)==FALSE) stop("invalid state")
    #if we didnt find our input outcome in list of valid outcome means that the input is wrong
    if((outcome %in% valid_outcomes)==FALSE) stop("invalid outcome")
    #extracting only useful columns from such a big table for our convenience
    #it contain hospital name, state, heart attack, heart failure and pneumonia
    outcome_data<-outcome_data[c(2,7,11,17,23)]
    #as the last 3 columns contain heart attack, heart failure and pneumonia
    #we are creating their indexes to be used eaily in our program
    if(outcome=="heart attack") valid_column=3
    if(outcome=="heart failure") valid_column=4
    if(outcome=="pneumonia") valid_column=5
    # subset is a new function having 3 arguments
    # 1. input data frame
    # 2. conditions to be applied
    # 3. what data we want to extract from data frame
    # here
    # 1. input being outcome_data
    # 2. condition is we retreive the rows only for the input state
    # 3. we are selecting only the hospital name and for the input outcome column
    bystate_data<-subset(outcome_data,State==state,select=c(1,valid_column))
    # order function is used to make elements in a particular order.
     #it finally will return index of elements. indexes are actually in sorted order
    # it has got many arguments. few which we are using over here.
    # 1. the data to be sorted is the input outcome data(2nd column in our data)
    # 2. decreasing=FALSE means that we want it sorted in ascending order.
    # 3. na.last=NA to delete all the na values.
    index<-order(as.numeric(bystate_data[,2]),decreasing=FALSE,na.last=NA)
    #we are retrieving the values in sorted order.
    ordered_bystate_data<-bystate_data[index,]
    #returning only first row, first column as it contains our required hospital name
    return(ordered_bystate_data[1,1])
}