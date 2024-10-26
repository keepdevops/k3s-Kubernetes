#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102x40+300+300 -e "$1/s8-view-hpa-status.bash $1" &

#EOF
