# Lab #8 
# Sarah Gering
# March 12, 2021

# Question 3a - logistic model copied and pasted from Lab 04
# n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )

t <- 12
n <- 2500
K <- 10000
r <-  0.8

abundance <- rep(n, t) # This is for storing the data prior to running the for loop

for (i in 2:t) {
  abundance[i] <- ((abundance[i-1] + ((r * abundance[i-1]) * ((K - abundance[i-1]) / K )))) 
}
print(abundance) 

# Question 3b - turn the logistic into a function

# Function Definition
Logistic_Growth <- function( r, K, t, n) {
  abundance <- rep(n, t)
  for (i in 2:t) {
    abundance[i] <- ((abundance[i-1] + ((r * abundance[i-1]) * ((K - abundance[i-1]) / K )))) 
  }
  return(abundance)
}

# Demonstration of Usage

Logistic_Growth(0.8, 10000, 12, 2500) # It works ven if you change the time value or the initial population size

# Question 3c - produce a plot with function

r <- 0.8
K <- 10000

Logistic_Growth <- function( n, t ) {
  abundance <- rep(n, t)
  generations <- rep(2:t)
  for (i in 2:t) {
    abundance[i] <- ((abundance[i-1] + ((r * abundance[i-1]) * ((K - abundance[i-1]) / K )))) 
  } 
  return(abundance)
  return(generations)
}

# Demonstration of Usage

myResults <- Logistic_Growth( 2500, 12 )

Logistic_Plot <- plot(myResults, xlab="generations", ylab="abundance") # plot results based on function parameters and change labels

# Questions 3d

newfunctioncall <- Logistic_Growth( 100, 15 ) # I changed the carrying capacity and initial abundances

# Question 3e

myResults <- Logistic_Growth( 2500, 12 )

myResults <- data.frame("generations" = 1:12, "abundance" = myResults)

write.csv(x = myResults, file = "LogisticGrowth.csv", row.names = FALSE)

# Question 3f - make a markdown document with script


