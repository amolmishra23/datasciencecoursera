## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function



# just like the example question. asuuming we get a matrix as argument.
# inv is set to NULL
# set is used to initialize the orignal matrix and inverse matrix
# setinverse is used to set the inverse matrix
# getinverse is used to get the inverse matrix



makeCacheMatrix <- function(x = matrix()) {
    inv<-NULL
    set<-function(y){
        x<<-y
        inv<<-NULL
    }
    get<-function() x
    setinverse<-function(inverse){
        inv<<-inverse
    }
    getinverse<-function() inv
    list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Write a short comment describing this function

# just like the given example. first we get the inverse from the argument
# if it returns a null means we cant extract inverse from it and need to calculate for first time.
# whereas if inverse exists we retrieve it and return it off.
# else we calculate the inverse newly and set the new inverse
# in the end we also return it off.

cacheSolve <- function(x, ...) {
    inv<-x$getinverse()
    if(!is.null(null)){
        message("getting cached data.")
        return(inv)
    }
    data<x$get()
    inv<-solve(data)
    x$setinverse(inv)
    inv
}
