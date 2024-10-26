#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102X40+790+190 -e "$1/s7-pod-stress.bash $1" &

#EOF
