#!/bin/bash

xterm -hold -bg black -fg yellow -sb -sl 50 -geom 102x40+154+190 -e "$1/s3-start-replicaset.bash $1" &

#EOF