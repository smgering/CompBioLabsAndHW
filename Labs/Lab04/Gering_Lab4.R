# Lab_04

# 1 print hi 10 times to the console

for (hi in 1:10) {
  print ("hi")
}

#2 Tim's money total for 8 weeks

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

#3 Calculate population size for the next seven years

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

#4 models of a discrete-time logistic growth equation

#n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )

# t = time, r = intrinsic growth, k = carrying capacity. n[t-1] = abundance of population 

t <- 12
n <- 2500
K <- 10000
r <-  0.8

for (i in 1:t) {
  n1 <- ((n + ((r * n) * ((K - n) / K ))))
  n <- n1
  print(n)
} 

#The answer to n[12] is 9999.997. This makes sense because the carrying capacity is 10000, so the population cannot exceed that amount.

#5a

i <- rep(0, 18)
i

#5b

for ( i in seq(1,18) ) {
  i <- ( i * 3 )
  print( i )
}

#Or another way to answer 5b
x <- 0

for ( i in seq(1,18) ) {
  x <- ( x + 3 )
  print( x )
}


#5c

i2 <- rep(0, 18)

i2[1] <- 1

#5d

for ( i in i2 ) {
  i3 <- (1 + (2 * i2))
  i2 <- i3
  print(i2)
}

#6 Fibonacci sequences

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

#7 Redoing question 4, but storing data and plotting within the loop

t <- 12
n <- 2500
K <- 10000
r <-  0.8

for (i in 1:t) {
  n1 <- ((n + ((r * n) * ((K - n) / K ))))
  n <- n1
  print(n)
}

myResults <- data.frame("time" = 1:12, "abundance" = c(4000, 5920, 7852.288, 9201.444, 9789.274, 9954.302, 9990.693, 9998.132, 9999.626, 9999.925, 9999.985, 9999.997))
plot(myResults)

#Save and push to Github
