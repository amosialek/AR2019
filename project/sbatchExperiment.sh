#!/bin/bash

module load plgrid/tools/chapel/1.20.0
export  GASNET_PHYSMEM_MAX='128MB'
#executable=`mktemp tmp/tmpXXXXXXXXXXX`
#rm $executable
executable=$program
#echo "compiling"
#chpl -o $executable $program.chpl
#echo "compiled"
./$executable -nl $localesNum --n $gridSize --iters $itersCount >>  $outfile

