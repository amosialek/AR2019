#!/bin/bash

for measured in speedup time efficiency; do
    rm -r $measured
    mkdir $measured;
done;
cat all_avg2.csv | awk '{print $4 " " $5 " " $6}' > time/out
cat all_avg2.csv | awk '{print $4 " " $5 " " $7}' > speedup/out
cat all_avg2.csv | awk '{print $4 " " $5 " " $8}' > efficiency/out
for measured in speedup time efficiency; do
    
    cd $measured
    split -l 50 --numeric-suffixes out
    measured=$measured ../run_multiple_gnuplot.sh
    cd ..
done
