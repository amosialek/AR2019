#!/bin/bash
for i in $(seq 1 1 5); do
for program in Jacobi GSB ; do
    for localesNum in $(seq 1 1 10); do 
        for gridSize in $(seq 200 200 1000); do 
            #echo $program $localesNum $gridSize
	    itersCount=10;
            outfile=out/single-$program-$itersCount-$gridSize-$localesNum.out
	    touch $outfile
	    outfile=$outfile program=$program localesNum=$localesNum gridSize=$gridSize itersCount=$itersCount sbatch --nodes=$localesNum --cpus-per-task=1 --time=20:00 --output=out/$program-$localesNum-$gridSize.out sbatchExperiment.sh 
	    itersCount=100;
            outfile=out/mult-$program-$itersCount-$gridSize-$localesNum.out
	    touch $outfile
            outfile=$outfile program=$program localesNum=1 gridSize=$gridSize itersCount=$itersCount sbatch --nodes=1 --cpus-per-task=$localesNum --time=20:00 --output=out/singleNode-$program-$localesNum-$gridSize.out sbatchExperiment.sh 
        done;
    done;
done;
done;
