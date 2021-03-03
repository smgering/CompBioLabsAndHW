# Lab 05 2/19/2021

# This is important for setting if else loops when the first isn't necessarily accurate so the second will cover
# Other types of practice
# question 1 - What is wrong with the code and 
# question 2 - predict wha the code will actually do?

threshold <- 6
X <- c(5, 4, 6.5, 8, 2.3, 6)
for ( i in 1:length(X) ) {
  if ( X[i] >= threshold ) {
    print(paste("Element #", i, "of X is >= threshold"))
  }
} 

X <- c(5, 4, 6.5, 8, 2.3, 6)
for ( i in 1:length(X) ) {
  if ( X[i] >= 6 ) { #made this so that the loop goes through all through the vector X
    print(paste("Element #",i,"of X is >= 6"))
  }
} #moved brace here from third line


X <- c(5, 4, 6.5, 8, 2.3, 6)
for ( i in X ) {
  if ( i >= 6 ) {
    print(paste("Element #",i,"of X is >= 6"))
  }
}
  
x < 4 # this can't work because you cant place vectors in if then statements.If you have a vector you can use x[i] with square brackets.
threshold <- 5

for( i in sequence(1,10)) {
  print(x)
} if ( x[i] > threshold ) {
  print(paste("x is larger than", threshold))
} else {
  print(paste("x is smaller than or equal to", threshold))
}

# recommend starting with print paste statements. One way o check is to check the if and if it works then build the else statement

# Question 1 

x <- 8
threshold <- 5
if ( x > threshold ) {
  print(paste("x is larger than", threshold))
} else {
  print(paste("x is smaller than or equal to", threshold))
}

# Question 2a change all negative values to NA

dataLab5 <- read.csv("~/Documents/Classes/EBIO5420/compBioSandbox/CompBio_on_git/Labs/Lab05/ExampleData.csv")
str(dataLab5) # checking what kind of object
length(dataLab5[[1]]) # Checking number of rows

threshold <- 0
n <- length(dataLab5[[1]]) # Checking number of rows
x <- dataLab5$x
str(x)

for( i in 1:n ) { 
  if (x[i] < threshold ) { # set threshold to below 0
    x[i] <- NA # replace values below zero with NA
    print(x) # print new dataset with NA values
  }
}

# Question 2b using a vector code instead of a loop using logical indexing

logicalResults <- is.na(x)
x[logicalResults] <- NaN
x

# Question 2c

newResults <- which(is.nan(x)) 

x[newResults] <- 0 

x

# Question 2d. how many data points fall between 50 and 100

n <- length(dataLab5[[1]]) # Checking number of rows
threshold <- seq(50,100)

# Question 2e

FiftyToOneHundred <- 