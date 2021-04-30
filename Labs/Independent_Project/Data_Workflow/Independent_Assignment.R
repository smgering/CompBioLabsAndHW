# Microbes in Arctic Lakes
# Assignment 9
# Sarah Gering
# April 19, 2021

# Pieces of Data

# Calculate relative abundances, calculate lipid profiles, correlation between the two.  
# Continuous variable are relative abundances, pH and lipid classes.  

setwd("~/Documents/Classes/EBIO5420/CompBioLabsAndHW/Labs/Independent_Project/Data_Workflow")

library(mctoolsr) # Important for early microbiome processing of sequencing data
library(tidyverse) # Important for tidying data and using ggplot2 for plotting graphs
library(cowplot) # Package allows plotting multiple graphs in one image

#input file names for combining mapping file and OTU table

tax_table_fp <- 'seqtab_wTax_mctoolsr.txt'
map_fp <- 'metadata.txt'

#Combine mapping file and table

input = load_taxa_table(tax_table_fp, map_fp) # This combines the mapping and metadata files together using package mctoolsr

# I need to rarefy microbiome data to lowest number of reads

seqcounts <- as.data.frame(sort(colSums(input$data_loaded)))

seqcounts # View lowest number of reads

# Rarefy at 19985 seqs/sample

input_rar = single_rarefy(input, 19985)

#After rarefied and filtering, I saved dataset as a .rds file.

saveRDS(input_rar, file = "input_rar.rds")

input_rar <- readRDS("input_rar.rds") # This is the point in which data is ready and we can begin analysis

#---------------------------

Microbial_Dataset <- input_rar # Rename dataset - there are three sections in this file

is.na(Microbial_Dataset) # Note there are three sections combined to this dataset
is.na(Microbial_Dataset$data_loaded) # Check for NAs in sequences data
is.na(Microbial_Dataset$map_loaded) # Check for NAs in metadata data
is.na(Microbial_Dataset$taxonomy_loaded) # Check for NAs at each taxonomy level

# Create a taxonomy table with relative abundances from phyla combined

tax_sum_phylum = summarize_taxonomy(Microbial_Dataset, level = 2, report_higher_tax = FALSE) # Summarize taxonomy relative abundace table from package mctoolsr

plot_ts_heatmap(tax_sum_phylum, Microbial_Dataset$map_loaded, 0.01,"Sample_type") # Used from mctoolsr package to see top phylum for dataset

write.csv(tax_sum_phylum, file = "rel_abundance_phyla")

Relative_Abundance <- read.csv("rel_abundance_phyla",  stringsAsFactors = F) # Read in new relative abundance csv

Metadata_Table <- read.csv("metadata2.csv",  stringsAsFactors = F) # Read in biolipid and pH metadata csv

# Transpose the relative abundance table
Relative_Abundance_Transposed <- as.data.frame(t(Relative_Abundance))

# Make both CSV files  are dataframes
Relative_Abundance_Data_Transposed<- as.data.frame(Relative_Abundance_Transposed)
Metadata_Table_Data <- as.data.frame(Metadata_Table)

# It worked, but in order to combine tables I need to rename the sample IDs to match to the metadata table

colnames(Relative_Abundance_Data_Transposed) <- as.character(Relative_Abundance_Data_Transposed[1,]) # Headers are good

Relative_Abundance_Data_Transposed = Relative_Abundance_Data_Transposed[-1,]  # Get rid of extra row header

View(Relative_Abundance_Data_Transposed)

length(Relative_Abundance_Data_Transposed[[1]]) # Checking number of rows
length(Metadata_Table_Data[[1]]) # Both are 73, which is good

Relative_Abundance_Data_Transposed[,1] == Metadata_Table_Data[,1] # Sample IDs do not match

rownames(Metadata_Table_Data) <- as.character(Metadata_Table_Data[,1]) # Headers are good

Metadata_Table_Data = Metadata_Table_Data[,-1]  # Get rid of extra column header

rownames(Relative_Abundance_Data_Transposed) == rownames(Metadata_Table_Data) # Check to make sure they match for merge of dataframes later

View(Relative_Abundance_Data_Transposed)
View(Metadata_Table_Data)

# Merge tables

require("dplyr")

CombinedData <- dplyr::bind_cols(Metadata_Table_Data, Relative_Abundance_Data_Transposed)

View(CombinedData) # One taxa column, 54 did not contain a header indicating those are unknown relative abundances

CombinedData <- CombinedData[,-54] # Removed NA column

write.csv(CombinedData, file = "CombinedData") # Save full combined table

# Correlations between lipid classes and top 5 taxa and some of the biolipid classes
# Since this dataset is so large with over 100s of taxa and several biolipid classes, I focused on small subset of the data 
# top 3 bundant phylum

str(CombinedData)

ggplot( data = CombinedData ) + geom_point( aes(Atribacteria , fIIIa_prime_meth, color = Sample_type) )
ggplot( data = CombinedData ) + geom_point( aes(Acidobacteria , fIIIa_prime_meth, color = Sample_type) )

# Make plot of all sample types with one taxa and one biolipid class
proteo_allsample <- ggplot( data = CombinedData ) + geom_point( aes(Proteobacteria , fIIIa_prime_meth, color = Sample_type) ) + 
  labs(x = "Relative Abundance", y = "Biolipid Class", colour = "") + # Adds labeles to axis
  theme(panel.border = element_rect(colour = "black", fill = NA, size = 1), panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(text = element_text(size = 10)) +
  theme_bw() + 
  ggtitle("Biolipid to Proteobacteria by Sample Type") + 
  theme(axis.title = element_text(face = "bold", size = 12), # bolds and changes size of axis fonts
        axis.text = element_text(size = 14),
        legend.position = "right", # places plot legend on bottom
        panel.grid = element_blank(), # Removes grid from plot background
        axis.text.x = element_blank())
        
proteo_allsample

# After viewing several plots, it appears that soil microbes are distinctly grouped from the same phyla in the sediments.
# Focusing on surface sediments only

names(CombinedData)

# Subset Acidobacteria, Atribacteria, Proteobacteria, Chloroflexi, Verrucomicrobia

(taxa_5_lipids <- CombinedData[, c(1,2, 3, 4, 5, 6, 7, 8, 10, 17, 23, 62, 69)]) # subset only rows of interest

names(taxa_5_lipids)
Sediments_Only <- filter(taxa_5_lipids, Sample_type == "Surface_Sediment") # Subset Surface Sediments

# Start regression analysis

names(Sediments_Only)
str(Sediments_Only)

# Change characters lists to factors and numeric

Sediments_Only$Region<-as.factor(Sediments_Only$Region)
Sediments_Only$Sample_type<-as.factor(Sediments_Only$Sample_type)
Sediments_Only$Acidobacteria<-as.numeric(Sediments_Only$Acidobacteria)
Sediments_Only$Atribacteria<-as.numeric(Sediments_Only$Atribacteria)
Sediments_Only$Chloroflexi<-as.numeric(Sediments_Only$Chloroflexi)
Sediments_Only$Proteobacteria<-as.numeric(Sediments_Only$Proteobacteria)
Sediments_Only$Verrucomicrobia<-as.numeric(Sediments_Only$Verrucomicrobia)

str(Sediments_Only) # Checked again

# linear regression models

lm_fit_acido <- lm(Acidobacteria ~ pH_mean + fIIIa_prime_meth + fIIIb_prime_meth + fIIIc_prime_meth + fIa_meth + fIIa_meth, data = Sediments_Only)
lm_fit_atri <- lm(Atribacteria ~ pH_mean + fIIIa_prime_meth + fIIIb_prime_meth + fIIIc_prime_meth + fIa_meth + fIIa_meth, data = Sediments_Only)
lm_fit_chlori <- lm(Chloroflexi ~ pH_mean + fIIIa_prime_meth + fIIIb_prime_meth + fIIIc_prime_meth + fIa_meth + fIIa_meth, data = Sediments_Only)
lm_fit_proteo <- lm(Proteobacteria ~ pH_mean + fIIIa_prime_meth + fIIIb_prime_meth + fIIIc_prime_meth + fIa_meth + fIIa_meth, data = Sediments_Only)
lm_fit_verruco <- lm(Verrucomicrobia ~ pH_mean + fIIIa_prime_meth + fIIIb_prime_meth + fIIIc_prime_meth + fIa_meth + fIIa_meth, data = Sediments_Only)

# summarise linear regression statistics for significance among groups

summary(lm_fit_acido) # three lipid classes and pH significant, use for graphs
summary(lm_fit_atri) # No significance
summary(lm_fit_chlori) # No significance, but almost with 1 class
summary(lm_fit_proteo) # pH significant
summary(lm_fit_verruco) # pH significant


Acido_lipid_plot <- ggplot(Sediments_Only, aes(Acidobacteria, fIIIa_prime_meth, shape = Region, colour = pH_mean)) +
  geom_point() + # Adds point to plot
  labs(x = "", y = "", colour = "") + # Adds labeles to axis
  theme(panel.border = element_rect(colour = "black", fill = NA, size = 1), panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(text = element_text(size = 10)) +
  theme_bw() + # Bolds title
  ggtitle("Lipid to Taxonomic Relative Abundance of Acidobacteria") + # Adds title to plot
  theme(axis.title = element_text(face = "bold", size = 12), # bolds and changes size of axis fonts
        axis.text = element_text(size = 14),
        legend.position = "none", # places plot legend on bottom
        panel.grid = element_blank(), # Removes grid from plot background
        axis.text.x = element_blank()) # removes excess tick and number marks

Acido_lipid_plot_2 <- ggplot(Sediments_Only, aes(Acidobacteria, fIIIb_prime_meth, shape = Region, colour = pH_mean)) +
  geom_point() + # Adds point to plot
  labs(x = "", y = "Lipid Fractional Abundace", colour = "pH") + # Adds labeles to axis
  theme(panel.border = element_rect(colour = "black", fill = NA, size = 1), panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(text = element_text(size = 10)) +
  theme_bw() + # Bolds title
  theme(axis.title = element_text(face = "bold", size = 12), # bolds and changes size of axis fonts
        axis.text = element_text(size = 14),
        legend.position = "none", # removes plot legend on bottom
        panel.grid = element_blank(), # Removes grid from plot background
        axis.text.x = element_blank()) # removes excess tick and number marks

Acido_lipid_plot_3 <- ggplot(Sediments_Only, aes(Acidobacteria, fIIa_meth, shape = Region, colour = pH_mean)) +
  geom_point() + # Adds point to plot
  labs(x = "Phyla Relative Abundance", y = "", colour = "pH") + # Adds labeles to axis
  theme(panel.border = element_rect(colour = "black", fill = NA, size = 1), panel.background = element_rect(fill = "white"), panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(text = element_text(size = 10)) +
  theme_bw() + # Bolds title
  theme(axis.title = element_text(face = "bold", size = 12), # bolds and changes size of axis fonts
        axis.text = element_text(size = 14),
        legend.position = "right", # places plot legend on bottom
        panel.grid = element_blank(), # Removes grid from plot background
        axis.text.x = element_blank()) # removes excess tick and number marks

library(cowplot) # Package allows multiple graphs in one image

# Plot all three biolipid classes with taxa together

plot_grid(Acido_lipid_plot, Acido_lipid_plot_2, Acido_lipid_plot_3, nrow = 3, labels = c('A', '', 'C'))

print(summary(lm_fit_acido)) # three lipid classes and pH significant used with graphs
