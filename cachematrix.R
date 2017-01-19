## Two functions that 1) creates a cached inverse matrix object and 2) computes the invers of the supplied matrix. 

## Making and caching the inverse of a matrix. 

makeCacheMatrix <- function(x = matrix()) {
  verse <- NULL
  set <- function(y) {
    x <<- y
    verse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) verse <<- inverse
  getinverse <- function() verse
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Calculating the inverse of the cached matrix

cacheSolve <- function(x, ...) {
  verse <- x$getinverse()
  if(!is.null(verse)) {
    message("getting cached data")
    return(verse)
  }
  data <- x$get()
  verse <- solve(data)
  x$setinverse(verse)
  verse
        ## Return a matrix that is the inverse of 'x'
}
