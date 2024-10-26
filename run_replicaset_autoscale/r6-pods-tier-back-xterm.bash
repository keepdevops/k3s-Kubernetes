#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102x40+154+190 -e "$1/s6-pods-tier-back.bash $1" &

#EOF
