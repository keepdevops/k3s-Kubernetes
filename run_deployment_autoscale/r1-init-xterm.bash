#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102X40+154+190 -e "$1/s1-initial-conditions.bash $1" &

#EOF
