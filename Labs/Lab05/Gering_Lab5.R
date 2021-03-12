# Lab 05 2/19/2021
# Updated 3/11/21

# Question 1 

x <- 8
threshold <- 5
if ( x > threshold ) {
  print(paste("x is larger than", threshold))
} else {
  print(paste("x is smaller than or equal to", threshold))
}

# Question 2a - change all negative values to NA

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

# Question 2b - using a vector code instead of a loop using logical indexing

logicalResults <- is.na(x)
x[logicalResults] <- NaN
x

# Question 2c

newResults <- which(is.nan(x)) 

x[newResults] <- 0 

x

# Question 2d - how many data points fall between 50 and 100 

FiftyToOneHundred <- subset(dataLab5, x > 50 & x < 100) # subset the values that range between 50 and 100

length(FiftyToOneHundred$x) # the length of the subset values is 498 are between 50 and 100

# Question 2e - create a 50 to 100 vector

FiftyToOneHundred 
FiftyToOneHundred <- FiftyToOneHundred$x
str(FiftyToOneHundred) # Now we have a vector of the 50 to 100 values

# Question 2f - write a csv of the 50 to 100 values

write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")

# Question 2f - imports CO2 emission data file

CO2_Emissions_Data <- read.csv("~/Documents/Classes/EBIO5420/compBioSandbox/CompBio_on_git/Labs/Lab04/CO2_data_cut_paste.csv")

# Question 3a - First year Gas wasn't zero

which(CO2_Emissions_Data$Gas == 0) # All rows are gas = 0, so row 135 is where it isn't going to be 0

which(CO2_Emissions_Data$Gas == 1) # it is on row 135 in the dataset

CO2_Emissions_Data[135,] #View row 135

# The first year CO2 gas emissions were above 0, was in 1885

# Question 3b

EmissionTotal <- subset(CO2_Emissions_Data, Total > 200, Total < 300) #subset total between 200 and 300

head(EmissionTotal$Year) # view first 6 years 
tail(EmissionTotal$Year) # view last 6 years

# Emission totals between years 1879 and 2013 were between 200 and 300 million metric tons of carbon.

# ----------------------------
  
# Part II. Loops + conditionals + biology
#Important pred prey model
# n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
# p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])

# n[t] = abundance of prey at time; p[t] = abundance of predators at time

totalGenerations <- 1000
n <- 100 	# initial prey abundance at time t = 1
p <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators
t <- 1:totalGenerations
threshold <- 0

prey <- rep(n, totalGenerations) # pre allocated the expected values to stoe the data
pred <- rep(p, totalGenerations)

for ( i in 2:totalGenerations ){
  prey[i] <- (prey[i-1] + (r * prey[i-1]) - (a * prey[i-1] * pred[i-1]))
  pred[i] <- pred[i-1] + (k * a * prey[i-1] * pred[i-1]) - (m * pred[i-1])
  if ( prey[i] < threshold ) {prey[i] <- threshold}
  if ( pred[i] < threshold ) { pred[i] <- threshold}
}
print(prey)
print(pred)

# plotting the graph with blue as prey and red as the predators. It appears that the populations both seem to die out.
# There are two reasons this may have happened, the prey population was so high it created too much competition among other prey and the predators conitued to increase in abundace and consumed consume all of the prey.. 
# The predators seems to hang on longer, but without any prey left and both population appeared to die out.

plot(t, prey, col="blue" )
points(t, pred, col="red")
lines(t, pred, col="red")

myResults <- data.frame("TimeStep" = t, "PreyAbundance" = prey, "PredatorAbundance" = pred)

View(myResults)

# Created a CSV file of the predator/prey results

write.csv(x = myResults, file = "PredPreyResults.csv")
