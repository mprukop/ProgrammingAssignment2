## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

## Making 'makeCacheMatrix' function, which requires vector
## m (inverse matrix) is nullified

	m <- NULL
	set <- function(y) {
		x<<-y
		m<<-NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
	getinverse <- function() m

## 4 functions that can be called with object made
## by 'makeCacheMatrix' function: 'set': set new data,
## 'get': get data (given matrix), 'setinverse': solve inverse
## matrix and assign it to 'm' value, getinverse: get inverse matrix
## stored in 'm'
## These 4 function can be called later on

	list(set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'
## Function is writing to m value from object
## If it's not null, it writes inverted matrix
## in console and ends;

	m <- x$getinverse()
	if(!is.null(m)) {
		message("Getting cached data...")
		return(m)
	}

## If it's null, function gets matrix to solve,
## solves it and sets inverted matrix in object,
## then gives inverted matrix

	data <- x$get()
	m <- solve (data, ...)
	x$setinverse (m)
	m
}
