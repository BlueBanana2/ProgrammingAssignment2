# The function creates a list object with the functions that are used to store and get the matrix iteself and to store and get the inverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  retval <- list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
  retval$set(x)
  retval
}


## The function checks, via the call of the function getinverse, if the inverse has been computed for the matrix. Otherwise it computes the inverse and returns it.

cacheSolve <- function(x) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
  
  ## Return a matrix that is the inverse of 'x'
}
