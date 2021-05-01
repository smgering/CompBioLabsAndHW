#  Lab #7 
# Sarah Gering
# March 05, 2021

# Problem 1.  Area of a triangle when given base and height

# Function definition:

myTriFunction <- function(base, height) {
  triangleArea <- 0.5 * base * height
  return(triangleArea)
}

# Demonstration of usage:

myTriFunction(10, 9)
myTriFunction(3, 4)
myTriFunction(30, 40)
myTriFunction(10, 10)

45 == myTriFunction(10,7) # This will let me know if its correct by assigning TRUE or FALSE
45 == myTriFunction(10,9) 

# Problem #2a.  Our own absolute value function
# sqrt of number squared or if negative number, multiply by -1

# Function definition - how to get absolute value of a number is by using...

myAbs <- function( x ) {
  for ( i in 1:length(x) ) {
    if ( is.na (x[i] ) ) {
    } else if ( x[i] < 0 ) {
      x[i] <- -x[i]
    }
  }
  return( x )
}

# Demonstration of usage:

myAbs(-5) 

myAbs(-2.3) 


# Problem #2b. vector function for absorbance values

# Function definition

myAbs <- function( x ) {
  for ( i in 1:length(x) ) {
    if ( is.na (x[i] ) ) {
    } else if ( x[i] < 0 ) {
      x[i] <- -x[i]
    }
  }
  return( x )
}

# Demonstration of usage:

vector <- c(1.1, 2, 0, -4.3, 9, -12)

myAbs(vector) # This worked!

# Problem #3 - Fibonacci functions

# Function definition

Fibonacci <- function( n ) {
  fibonacci_number <- rep(0, n)
  fibonacci_number[2] <- 1
  for ( i in 3:n ) {
    fibonacci_number[i] <- (fibonacci_number[i-1]) + (fibonacci_number[i-2])
  }
  return(fibonacci_number)
}

# Demonstration of usage:

Fibonacci(3)
Fibonacci(8)
Fibonacci(15)
# SMF COMMENT: Great job!  The one thing the function was missing was the ability to choose the
# SMF COMMENT: start value to be zero or one (see problem definition)

# Problem #4a

# Function definition

myFunction <- function(x, y) {
  simplefunc <- ( x - y )^2
  return(simplefunc)
}

# Demonstration of usage:

myFunction(3, 5) # My function works by returning 4

vector <- c(2, 4, 6)

myFunction(vector, 4) # Impressive, I though that I might have to use length for the vector.

# Problem #4b

# Function definition 
# Ok, I know that I need to create a function that captures not only the vector, but also the length of the numbers as I can average them.

# Updated this section and removed the for loop as it was unnecessary

myFunction2 <- function(x) {
  y <- length(x)
  func <- sum(x)/y
  return(func)
}

# Demonstration of usage:

vector2 <- c(5, 15, 10)
myFunction2(vector2)

#imported CSV file for Problem 4b prep
dataLab7 <- read.csv("~/Documents/Classes/EBIO5420/compBioSandbox/CompBio_on_git/Labs/Lab07/DataForLab07.csv")
length(dataLab7[[1]]) # Checking number of rows
col_x <- dataLab7$x # create a vector of these numbers
str(col_x)

myFunction2(col_x)

# Problem #4c - sum of squares function - Oh no, this one is really tricky

# Function definition 

myFunction3 <- function( x ) {
  y <- length( x )
  for ( i in 1:length(x) ) {
    mean <- sum( x[i] )/ y
    func <- sum((x[i] - mean[i])^2)
  }
  return(func)
}

# Demonstration of usage:

myFunction3(col_x)
# SMF COMMENT: your function didn't work because it only worked with the very last value of x.  Do you see why?
# SMF COMMENT: You would have been better served to NOT have a loop.
