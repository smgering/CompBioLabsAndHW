# Lab_04

# Question 1 print hi 10 times to the console

for (hi in 1:10) {
  print ("hi")
}

# Question 2 Tim's money total for 8 weeks

piggyBank <- 10 # dollars
allowance <- 5 # dollars per week
gumCost <- 2 * 1.34 # cost of 2 packs of gum per week
weeks <- 8 # timeframe
 
x <- (piggyBank + allowance - gumCost)

for (i in 1:weeks) {
  newBalance <- piggyBank + allowance - gumCost
  piggyBank <- newBalance
  print( newBalance )
}

# Question 3 Calculate population size for the next seven years

currentpop <- 2000
shrink <- 0.05
years <- 7

shrinkamount <- (currentpop * shrink)
newpop <- (currentpop - shrinkamount)

for (i in 1:years) {
  newpop <- currentpop - (currentpop * shrink)
  currentpop <- newpop
  print( currentpop )
}

# Question 4 models of a discrete-time logistic growth equation

#n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )

# t = time, r = intrinsic growth, k = carrying capacity. n[t-1] = abundance of population 

t <- 12
n <- 2500
K <- 10000
r <-  0.8

for (i in 1:t) {
  print(n)
  n1 <- ((n + ((r * n) * ((K - n) / K ))))
  n <- n1
} 

#The answer to n[12] is 9999.985. Since the first set of abundance of 2500 was at time step 1. This makes sense because the carrying capacity is 10000, so the population cannot exceed that amount.

# Question 5a

x <- rep(0, 18)
x

# Question 5b
x <- rep(1,18)
for ( i in seq(1,18) ) {
  x[i] <- ( x[i] * 3 ) # SMF COMMENT: Don't change the value of the iterator inside a loop!
}
x
# SMF COMMENT: Part of the goal of 5b was to store the values in a vector, 
# SMF COMMENT: not print them out per se.

#Or another way to answer 5b
x <- 0

for ( i in seq(1,18) ) {
  x <- ( x + 3 )
  print( x )
}

# Question 5c

i2 <- rep(0, 18)

i2[1] <- 1

# Question 5d

for ( i in i2 ) {
  i3 <- (1 + (2 * i2))
  i2 <- i3
  print(i2)
}
# SMF COMMENT: similarly to 5b, part of the goal here was to store
# SMF COMMENT: the results of each step in a vector

# Question 6 - Fibonacci sequences

Ft <- rep(0, 20)
F1 <- 0
F2 <- 1
F3 <- (F1 + F2)

for ( i in seq(0,20) ) {
  F3 <- F1 + F2
  F1 <- F2
  F2 <- F3
  print(F3)
} 

# Question 7 - Redoing question 4, but storing data and plotting within the loop

t <- 12
n <- 2500
K <- 10000
r <-  0.8

abundance <- rep(n, t) # This is for storing the data prior to running the for loop

for (i in 2:t) {
  abundance[i] <- ((abundance[i-1] + ((r * abundance[i-1]) * ((K - abundance[i-1]) / K )))) 
}
print(abundance) 

# This process begin with a vector of 2500 in the first position, recursive steps

myResults <- data.frame("time" = 1:12, "abundance" = abundance)

plot(myResults)

#fibonacci is two steps of recursive where i-1 and i -2, then add them 
#Save and push to Github
