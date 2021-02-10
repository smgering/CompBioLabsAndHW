cut -f 2-4 -d , PredPreyData.csv > PredPrey2_4.csv

head -n 1 PredPrey2_4.csv > PredPreyOut.csv

tail PredPrey2_4.csv >> PredPreyOut.csv

wc PredPreyOut.csv

rm PredPrey2_4.csv

