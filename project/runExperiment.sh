#!/bin/bash

itersCount=1000;
for program in Jacobi GSB ; do
    for localesNum in $(seq 1 1 10); do 
        for gridSize in $(seq 100 100 1000); do 
            #echo $program $localesNum $gridSize
            srun --ntasks=$localesNum --nodes=$localesNum ./$program -nl $localesNum --n $gridSize --iters $itersCount
            srun --ntasks=$localesNum --cpus-per-task=$localesNum --nodes=1 ./$program -nl $localesNum --n $gridSize --iters $itersCount
        done;
    done;
done;