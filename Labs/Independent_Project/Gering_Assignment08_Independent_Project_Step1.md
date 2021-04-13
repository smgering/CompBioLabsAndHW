# Microbes in Arctic Lakes 
## By Sarah Gering

### Assignment 08: Independent Project Computational Biology EBIO 5420

## **Introduction**

This project aims to determine microbial community composition and distribution from arctic soils and sediments collected from lake sites in Canada and Iceland. Samples were collected and provided by collaborators with the Institute of Arctic and Alpine Research (Raberg et al., 2021).

## **Summary of Data to be Analyzed**

The sequencing data were processed within the Fierer lab from DNA extracted from 150 samples and sequenced for the 16S rRNA gene using the Illumina MiSeq. I processed these sequences using the DADA2 bioinformatics pipeline in R (Callahan et al., 2016; Oliverio and Holland-Moritz, 2019) to create an ASV table for further exploratory bacterial analysis, relative abundances, and regional and global trends associated with these types of samples.

I have three data pieces for use in the project to include a relative abundance table with taxonomic information for 150 soil and sediment samples. I have a second table with climactic variables such as latitude, longitude, and elevation and environmental variables such as temperature, pH, and depth. Lastly, I have a fractional abundance table, including different biolipids provided by collaborators, to compare 16S rRNA sequencing data to biolipid information.

## **Description of Analysis and Challenges Involved**

My goal for this project is to illuminate the community composition and distribution of microbes among different sample types and compare regional trends while identifying specific taxa driving dissimilarity within microbial communities. Further, I would like to compare biolipid abundances to relative abundances of microbial taxa associated with sample types. **My driving question for this project is to determine if there are trends associated with specific taxa that correlate with lipid classes within these arctic soils and sediments and are linked to environmental conditions**. The relationship between biolipids and environmental variables is well known, but the taxa linked with these biolipid trends are unknown.

The environmental metadata information is not consistent across all samples and may present computational challenges. It will require ensuring my analysis includes samples with complete environmental information to ensure accuracy. Also, analyzing these types of data will require more packages in R beyond *tidyverse* (Wickham et al, 2019), *lubridate* (Grolemund and Wickham, 2011) , and *ggplot2* (Wickham et al, 2016), which may increase the computational challenges associated with exploring this dataset.

### **References**

 1. Raberg, J. H., Blumm, A., Harning, D. J., Crump, S. E., de Wet, G., Dildar, N., Kopf, S., Geirsdóttir, Á., Miller, G. H., and Sepúlveda, J.: Revised brGDGT fractional abundances and warm-season temperatures strengthen relationships between brGDGTs and environmental variables, EGU General Assembly 2021, online, 19–30 Apr 2021, EGU21-8362, https://doi.org/10.5194/egusphere-egu21-8362, 2021.
 2. Callahan, B. J., McMurdie, P. J., Rosen, M. J., Han, A. W., Johnson, A. J. A., & Holmes, S. P. (2016). DADA2: High-resolution sample inference from illumina amplicon data. Nature Methods, 13(7), 581-583. https://doi.org/10.1038/nmeth.3869
 3. Oliverio, A., Holland-Moritz, H. (2019). Dada2 tutorial with MiSeq dataset for Fierer Lab. Retrieved from https://github.com/amoliverio/dada2_fiererlab
 4. Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L. D. A., François, R., ... & Yutani, H. (2019). Welcome to the Tidyverse. _Journal of Open Source Software_, _4_(43), 1686
 5. Wickham, H., Chang, W., & Wickham, M. H. (2016). Package ‘ggplot2’. _Create Elegant Data Visualisations Using the Grammar of Graphics. Version_, _2_(1), 1-189
 6. Grolemund, G., & Wickham, H. (2011). Dates and times made easy with lubridate. _Journal of statistical software_, _40_(3), 1-25

