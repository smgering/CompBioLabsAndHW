Lab 01 Output - Sarah Gering

$ cd /Users/sarahgering/Documents/Classes/EBIO5420/compBioSandbox/CompBio_on_git/Labs/Lab01/

#5. A data-subsetting problem to only have swallows without the 

$ grep -w Swallow BirdList.txt | grep -v Swallow-tail | grep -v Hirundinidae | wc -l

#5 Homework

$ file PredPreyData.csv
$ less PredPreyData.csv
$ head PredPreyData.csv
$ tail PredPreyData.csv

$ wc PredPreyData.csv

$ command PredPreyData.csv

$ command options PredPreyData.csv

$ wc -l PredPreyData.csv

$ grep ??? PredPreyData.csv >> Predator.txt

# Create new file with only columns 2 through 4

# 1. Which tool from above could you add on to the cut example above to get the output to go into a file instead of into the terminal window? Answer: We can use the tool condensate or redirection to create a new file with the columns we want work with.

$ cut -f 2-4 -d , PredPreyData.csv >> PredPrey2_4.txt

# 2. How could you combine the cut example above with some other tools above to see only the last 10 lines of output?

$ cut -f 2-4 -d , PredPreyData.csv > PredPrey2_4.txt | tail 

# 3. How could you, perhaps in multiple commands, make a new data file that had (i) only columns 2-4, (ii) the header row, and (iii) only the last 10 lines of data? In other words, what commands could you issue to create a new .csv file with 11 lines of data total and three columns total, in which the top line should be the original headers, and the other 10 lines should be the last 10 lines of the original data?

$ cut -f 2-4 -d , PredPreyData.csv > PredPrey2_4.csv

$ head -n 1 PredPrey2_4.csv > PredPreyOut.csv
$ tail PredPrey2_4.csv >> PredPreyOut.csv

#View new file with header and last 10 lines
$ less PredPreyOut.csv
$ wc PredPreyOut.csv
$ wc -l PredPreyOut.csv
