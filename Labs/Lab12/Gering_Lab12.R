# Lab #12
# Sarah Gering
# April 9, 2021

#Part 1: Get DataSet into Shape
library(tidyverse)

stateStatsData <- read.csv("CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                           stringsAsFactors = F) # Read in data

View(stateStatsData)
# 1. subset the data so that we only keep the rows where the text in the column (variable) named "Name" is "Colorado"

ColoradoData <- filter(stateStatsData, Name == "Colorado")

# 2. subset to keep (select) only the columns "Date", "Cases", and "Deaths"

ColoradoData <-ColoradoData %>%
  select("Date", "Cases", "Deaths")

# 3. change the data in the "Date" column to be actual dates rather than a character

library("lubridate")
str(ColoradoData)

ColoradoData <- parse_date_time(x = ColoradoData$Date, orders = c("mdy")) # This make it diffcutl to work with becasue now it is in the POSIXct format

# 4. sort the data so that the rows are in order by date from earliest to latest

ColoradoData <- ColoradoData %>% 
  arrange(Date)

# 5. subset the data so that we only have dates prior to May 15th, 2020

earlydate <- as.Date("2020-05-15")
index <- which(as.Date(ColoradoData$Date) < earlydate)
priorDates <- ColoradoData[index , ]

View(priorDates)

# Combine all steps into one block of code using pipes

ColoradoData <- stateStatsData %>% 
  filter( Name == "Colorado") %>% 
  select(Date, Cases, Deaths) %>% 
  mutate( Date = mdy(Date) ) %>% 
  arrange( Date ) %>% 
  filter( Date < as.Date("2020-05-15") )
as_tibble(ColoradoData)

# Make Plots from tibble dataframe
library(ggplot2)

ggplot(ColoradoData, aes(Date,Cases)
       
