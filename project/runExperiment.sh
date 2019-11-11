#!/bin/bash

itersCount=1000;
for program in Jacobi GSB ; do
    for localesNum in $(seq 1 1 10); do 
        for gridSize in $(seq 100 100 100); do 
            #echo $program $localesNum $gridSize
            program=$program localesNum=$localesNum gridSize=$gridSize itersCount=$itersCount sbatch --ntasks=$localesNum --cpus-per-task=1 --time=10:00 sbatchExperiment.sh 
            program=$program localesNum=$localesNum gridSize=$gridSize itersCount=$itersCount sbatch --ntasks=1 --cpus-per-task=$localesNum --time=10:00 sbatchExperiment.sh 
        done;
    done;
done;
