#As in the example, we create a special object that stores a matrix and caches its inverse doing these steps:
        # 1) set the value of the matrix
        # 2) get the value of the matrix
        # 3) set the value of the inverse
        # 4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set,
             get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


# As in the example, the "cacheSolve calculates the inverse of the special "matrix" created with "makeCacheMatrix" 
#       1) First checks to see if the inverse matrix has already been calculated. 
#       2) If so, it gets the mean from the cache and skips the computation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
