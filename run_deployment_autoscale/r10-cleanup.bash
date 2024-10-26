#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102x40+150+190 -e "$1/s10-cleanup.bash $1" & 

#EOF
