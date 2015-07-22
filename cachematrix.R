## These functions stores a matrix and its inverse -also calculate the last-. 
## Assuming that matrix is a valid square matrix.
## In order to get the inverse matrix, first the fuction "makeCacheMatrix"
## must be called passing the matrix as parameter. The second step is pass
## the returned list of "makeCacheAtrix" to "cacheSolve" function to get 
## the inverse matrix. The list is of functions to set and get, these functions
## have access to the values of matrix and its inverse.
## e.g.:
# m <- matrix(c(1,3,5,7,9,8,6,4,3),3,3)
# x <- makeCacheMatrix(m)
# cacheSolve(x)

## makeCaheMatrix stores tha matrix and its inverse matrix, returning a list of
## functions that can set and get the matrix and its inverse.
## The function receives the matrix as parameter and assigns it to x

makeCacheMatrix <- function(x = matrix()) {  
    inv <- NULL                  # Inicializes inv (inverse matrix) with null        
    set <- function (y) {        # Set matrix function 
        x <<- y                  # <<- operator lets y replace the value of x
        inv <<- NULL             # and inv, both variables are out of set funct.
    }
    get <- function() {          # Get matrix function
        x                        # returns matrix x
    }
    setInv <- function(minv) {   # Set inverse matrix function
        inv <<- minv             # <<- lets minv replace the value of inv, which
    }                            # is another's environment variable
    getInv <- function() {       # Get inverse matrix function
        inv                      # Returns inv, which is the inverse matrix
    }
    list(set = set               # Return a list of functions
          , get = get
          , setInv = setInv
          , getInv = getInv)
}


## cacheSolve function returns the inverse matrix of a matrix. 
## First look for the inverse matrix and if this does not exists then calculate
## it. 
## Receive the list of functions to set and get declared in makeCacheMatrix,
## these functions have access to the values of the matrix and the inverse matrix

cacheSolve <- function(x) {
    minv <- x$getInv()           # Get inverse matrix from function getInv
    if(!is.null(minv)) {         # If there is the inverse matrix then return it
        return(minv)             # Returned previously stored inverse matrix and
    }                            # end cacheSolve function
    ## The next four lines are excuted if there is not an inverse matrix in cache
    mat <- x$get()               # Get the matrix from cache
    minv <- solve(mat)           # Calculate the inverse of the matrix
    x$setInv(minv)               # Store the inverse matrix in cache
    minv                         # Return the inverse matrix
}

