# Lab 03 2/3/2021

# Lab step #3: I have 8 guests coming to my Star Wars movie party and 5 bags of chips to serve so I have created to variables to represent both.

guests <- 8
chips <- 5

# Lab step #5: Each guest will eat 0.4 bags of chips

eat <- 0.4

# Lab step #7: Calculate the amount of leftover chips

leftover_chips <- (chips - (guests * eat))

leftover_chips

# Part 2 Vectors

# Lab Step #8: make four vectors based on you and your three friends ranking of all Star Was movies

selfVec <- c(7,9,8,1,2,3,4,6,5)
PenVec <- c(5,9,8,3,1,2,4,7,6)
LenVec <- c(6,5,4,9,8,7,3,2,1)
StewVec <- c(1,9,5,6,8,7,2,3,4)

# Lab step #9: Create indexes

PennyIV <- PenVec[4] 
LennyIV <- LenVec[4]

# Lab step #10: Concenate all 4 ranking of the movies

myMat <- cbind(selfVec, PenVec, LenVec, StewVec)
myMat

# Lab step #11: use str to investigate the structures of my matrix, Penny and Penny's ranking for the fourth movie
str(myMat)
str(PennyIV)
str(PenVec)

# Lab step #12: Making a dataframe with the 4 vectors and checking both ways work

myDf1 <- as.data.frame(myMat)

myDF2 <- data.frame(selfVec, PenVec, LenVec, StewVec)

# Lab step #13: Differences between building a matrix vs building a data frame. There are differences between a data frame and amtrix. Using structure can show a dataframe that looks like a matrix, but eahc number owuld be seen as a column and row, whereas a matrix is a grid of numbers. This is more apparent with using "typeof". The data frame is a list or seen as a table, and the matrix is a double and can be used for mathematical calculations.

str(myDf1)
str(myMat)

View(myDf1)

dim(myDf1)
dim(myMat)

typeof(myDf1)
typeof(myMat)

print(myDf1)
print(myMat)

# Lab step #14: make a vector of the episodes with roman numerals as names

Episodes <- c("I", "II", "III", "IV", "V", "VI", "VII", "VIII","IX")

# Lab step #15: add the roman numeral episode names to the rows of the dataframe  with you and friends ranking.

row.names(myDf1) <- Episodes
row.names(myMat) <- Episodes


# Lab step #16: accessing the third row of the matrix

myMat 

myMat[3,]

# Lab step #17: access fourth column

myDf1

myDf1[,4]

# Lab step # 18: access all ranking for episode V.

myDf1[5,]

# Lab step #19: Access pennys ranking for episode II, there are two ways

PenVec[2] 

myDf1[2,2]

# Lab step #20: Access everyone ranking for episodes II, V, VII

myDf1[c(4,5,6), ]

# Lab step #21: Access everyone ranking for episodes IV - VI

myDf1[c(2,5,7), ]

# Lab step #22: Access Penny and Stewie ranking for episodes IV  & VI

myDf1[c(4,6), c(2,4)]

# Lab step #23: Switch Lenny’s rankings for Episodes II and V

myDf1[c(2), c(3)] <- 8

myDf1[c(5), c(3)] <- 5

myDf1

# Lab step #24: Try (allRankings["III", "Penny"]) with the matrix from step 10 and  the data frames from step 12 

myDf1

myDf1["III", "PenVec"]

myMat

myMat["III", "Penvec"]

# Lab step #25: Use ranking to undo switch

myDf1["II", "LenVec"] <- 5
myDf1["V", "LenVec"] <- 8

myDf1

# Lab step #26: (26) Use the $ method to re-do the switch from step 23.

str(myDf1)

myDf1$LenVec[2] <- 8
myDf1$LenVec[5] <- 5

myDf1

# Lab step #27: Saved script and pushed to git

