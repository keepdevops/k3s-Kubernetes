#!/bin/bash

while :
do

xset -b
echo "-------------------------------------"
  head -n39 $1/deploy1.yaml
  sleep 10
  tput reset
  head -n39 $1/general-hpa.yaml
  sleep 10 
  tput reset
done

#EOF
