## The following functions create a matrix, take its inverse,
## cache, and later when called produce the cached inverse of
## the matrix. The functions closely follow the logic provided
## in professor's example.

## This function sets and gets the value of a matrix and
## sets and gets the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
 get <- function() x
 setMyinverse <- function(solve) m <<- solve
 getMyinverse <- function() m
 list(set = set, get = get,
      setMyinverse = setMyinverse,
      getMyinverse = getMyinverse)
  
}

## This function calculates the inverse of the matrix.
## If the cached values exist, it will skip the calculation
## step and will return the cached inverse of the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
    m <- x$getMyinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setMyinverse(m)
    m  
}

