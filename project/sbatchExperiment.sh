#!/bin/bash

module load plgrid/tools/chapel/1.20.0
export  GASNET_PHYSMEM_MAX='128MB'

chpl -o $program $program.chpl
./$program -nl $localesNum --n $gridSize --iters $itersCount 
