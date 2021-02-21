# Lab 05 2/19/2021

# This is important for setting if else loops when the first isn't necessarily accurate so the second will cover

x <- 1:10 # this can't work because you cant place vectors in if then statements.If you have a vector you can use x[i] with square brackets.
threshold <- 5
for( i in sequence(1:10)) {
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



dataLab5 <- read.csv("~/Documents/Classes/EBIO5420/compBioSandbox/CompBio_on_git/Labs/Lab05/ExampleData.csv")
View(dataLab5)

