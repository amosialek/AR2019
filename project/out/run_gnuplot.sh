#!/bin/bash
gnuplot -e "filename='chart$i.png';measured='$measured';mytitle='$measured $program_name $type';input_filename='x$i'" ../gnuplot_script.txt 