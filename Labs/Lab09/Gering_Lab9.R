# Lab #9
# Sarah Gering
# March 19, 2021

# Import datafile

camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
str(camData) # The structure of the data in these columns is listed as characters and I think the classes are incorrect and need to be changed.

# I've converted the character lists to factors
camData$Placement <- as.factor(camData$Placement)
camData$Season <- as.factor(camData$Season)
camData$Station <- as.factor(camData$Station)
camData$Species <- as.factor(camData$Species)

str(camData)



# Now to work on the dates

smallVec <- camData$DateTime[1:5] # work on small vector for converting the date and time

smallVec2 <- as_datetime(smallVec) # I wanted to see what this would do

smallVec # view changes for comparison
smallVec2 # The as_datetime converted the date incorrectly

?strptime # conversion editor information

smallVec3 <- strptime(as.character(smallVec), "%d/%m/%Y %H:%M") # This worked!

# Problem 1.3 - Now try it on whole file

camData$DateTime <- strptime(as.character(camData$DateTime), "%d/%m/%Y %H:%M") # It worked, but removed the times
str(camData)
View(camData)

summary(camData$DateTime)
min(camData$DateTime)
max(camData$DateTime)

dates <- as.numeric(format( x = camData$DateTime, "%Y"))

table(dates)

  
# Summarizing data table, widening table and plot in scatter plot
  
GroupSpeciesbyStation <- summarise( group_by(camData, Station, Species),
                                      Freq = n(),
                                      .groups = "drop")

NewSpeciesTable <-  pivot_wider(GroupSpeciesbyStation,
                                values_from = Freq,
                                names_from = Species,     # what new columns we want
                                values_fill = 0)          # converts NAs to zeros


ggplot(NewSpeciesTable, aes( x = Elephant, y = Impala )) +
  geom_point()+
  geom_smooth (method = lm)

