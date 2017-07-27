## Using Lexical Scoping of [R] to provide caching

## makeCacheMatrix function allows to cache a matrix which is passed as a formal argument to this function
## and it's inverse matrix as well. This funtion provides the get and set functions to 
## access the matrix and inverse matrix

makeCacheMatrix<- function(y=matrix()) 
{
        inverse<- NULL
    	  set <- function(x) {
                y <<- x
                inverse<<- NULL
        }
        get <- function() { y }
        setinv <- function() { inverse<<-solve(y) }
        getinv <- function() { inverse}
        list(setmatrix = set, getmatrix = get,
             setinverse = setinv  ,
             getinverse = getinv )
 }


## cacheSolve allows to return the cached or normal inverse matrix 

cacheSolve<-function(y,...)
{
	inv<-NULL
	inv<-y$getinverse()
	if(!is.null(inv))
	{ 	
		message("Getting cached Inverse")
      	return(inv)
      }
	# set the inverse and then fetch it
      y$setinverse()
      inv<-y$getinverse()
	message("Getting Inverse")
	inv
}
