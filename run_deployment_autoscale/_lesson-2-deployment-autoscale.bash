#!/bin/bash

HERE=`pwd`

$HERE/r10-cleanup.bash  $HERE
sleep 20
pgrep -f s10-cleanup
pkill -f s10-cleanup

echo "CLEAN DONE"

echo "STARTING UP 1/3"
$HERE/r1-init-xterm.bash   $HERE
sleep 60
echo "STARTING UP 2/3"

$HERE/r3-start-deployment-xterm.bash   $HERE
echo "STARTING UP 3/3"

$HERE/r4-hpa-v2-xterm.bash  $HERE
sleep 30

pgrep -f r1-init-xterm.bash   
pkill -f r1-init-xterm.bash   
pgrep -f s3-start-deployment-xterm.bash
pkill -f s3-start-deployment-xterm.bash
pgrep -f s4-hpa-v2
pkill -f s4-hpa-v2

echo "STRESS STRESS"
$HERE/r8-HPA-describe.bash           $HERE
$HERE/r7-exercise-hpa.bash	     $HERE

sleep 120
echo "STRESS DONE"


pgrep -f s7-pod-stress
pkill -f s7-pod-stress

$HERE/r9-cat-file.bash               $HERE

sleep 30

pgrep -f s8-view-hpa-status
pkill -f s8-view-hpa-status
pgrep -f s9-cat-file
pkill -f s9-cat-file


echo "DONE - CLEANUP"

$HERE/r10-cleanup.bash               $HERE
sleep 30
pgrep -f s10-cleanup
pkill -f s10-cleanup

kubectl get deployments
kubectl get replicasets
kubectl get statefulsets
kubectl get daemonsets

killall xterm

#EOF
