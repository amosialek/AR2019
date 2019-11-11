#!/bin/bash

module load plgrid/tools/chapel/1.20.0
export  GASNET_PHYSMEM_MAX='128MB'
executable=`mktemp tmp/tmpXXXXXXXXXXX`
chpl -o $executable $program.chpl
./$executable -nl $localesNum --n $gridSize --iters $itersCount 
