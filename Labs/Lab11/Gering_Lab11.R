#  Lab #11 
# Sarah Gering
# April 02, 2021

# Biological Question; How does wood density vary across families of tree species?

library(dplyr)
library(tidyr)
library(tidyverse)

# Citation for the database: Zanne, A.E., Lopez-Gonzalez, G.*, Coomes, D.A., Ilic, J., Jansen, S., Lewis, S.L., Miller, R.B., Swenson, N.G., Wiemann, M.C., and Chave, J. 2009. Global wood density database. Dryad. Identifier: http://hdl.handle.net/10255/dryad.235. 

# Read in data

WoodDensity <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

str(WoodDensity)
head( WoodDensity )

colnames(WoodDensity)[4] <- "Density" # Renamed long column

Bad_Row <- which( is.na( WoodDensity$Density )) # Find data that are NAs

NewWoodDensity <- WoodDensity[ -Bad_Row, ] # Remove NA row


#Section 5

Woodpart5 <- WoodDensity %>%
  group_by( Binomial, Family ) %>% 
  summarise ( Density = mean(density),
             .groups = "drop")
cmd+shift+m

%>% 
  %>% 
