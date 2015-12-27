## begins with setting the mean called specialnumber <- NULL
## set <- function(y) {x <<- y; specialnumber <<- NULL} is a function to set the x to a y, and resets the mean, specialnumber, to NULL
## get <- function() x returns the x
## setmean <- function(mean) specialnumber <<- mean sets the mean, specialnumber, to mean
## getmean <- function() specialnumber returns the mean, specialnumber
## list(set = set, get = get,setmean = setmean,getmean = getmean) returns the 'special vector' 
## containing all of the functions just defined


makeCacheMatrix <- function(x = matrix()) {
specialnumber <- NULL
set <- function(y) {
  x <<- y
  specialnumber <<- NULL
}
get <- function() x
setmean <- function(mean) specialnumber <<- mean
getmean <- function() specialnumber
list(set = set, get = get,
     setmean = setmean,
     getmean = getmean)
}


## computes the inverse of the special "matrix" returned by makeCacheMatrix above


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getmean()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- mean(data, ...)
  x$setmean(inverse)
  inverse
}
