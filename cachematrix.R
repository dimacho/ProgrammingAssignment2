## These two functions create a matrix and then the inverse of the matrix.
## The inverse is cached and if the same matrix is inverted it will read
## the cached version.

## Write a short comment describing this function
    # This function supplies setter and getter methods for the 
    # original matrix and the inverse
makeCacheMatrix <- function(x = matrix()) {
    matrix <- NULL 
    setMatrix <- function(y) {
        x <<- y
        matrix <<- NULL        
    }
    getMatrix <- function() x
    setMatrixInverse <- function(cacheMatrix) matrix <<- cacheMatrix        
    getMatrixInverse <- function() matrix
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setMatrixInverse = setMatrixInverse, getMatrixInverse = getMatrixInverse) 
}


## Write a short comment describing this function
    # This function checks to see if there is already a matrix stored 
    # in the variable matrix then returns the cached version if it exists
    # or creates one if it does not.
cacheSolve <- function(x, ...) {
    matrix <- x$getMatrixInverse()
    if(!is.null(matrix)) {
        message("getting cached data")
        return(matrix)
    }
    data <- x$getMatrix()
    cacheMatrix <- solve(data, ...)
    x$setMatrixInverse(cacheMatrix)
    cacheMatrix
}
