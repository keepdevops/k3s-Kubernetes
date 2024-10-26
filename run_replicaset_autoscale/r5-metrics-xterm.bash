#!/bin/bash

echo  "starting metrics.bash..."
xterm -hold -bg black -fg yellow -sb -sl 50 -geom 142x40+790+190 -e "$1/s5-metrics.bash $1" & 

#EOF
