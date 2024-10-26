#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102x40+790+190 -e "$1/s2-ready-to-start.bash $1" &

#EOF
