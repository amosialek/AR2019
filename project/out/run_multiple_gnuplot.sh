#!/bin/bash
i=00 measured=$measured program_name=GS type="multiple nodes" ../run_gnuplot.sh
i=01 measured=$measured program_name=Jacobi type="multiple nodes" ../run_gnuplot.sh
i=02 measured=$measured program_name=GS type="single node" ../run_gnuplot.sh
i=03 measured=$measured program_name=Jacobi type="single node" ../run_gnuplot.sh