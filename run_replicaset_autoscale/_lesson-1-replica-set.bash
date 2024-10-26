#!/bin/bash

HERE=`pwd`

$HERE/r10-cleanup.bash  $HERE
sleep 10
pgrep -f s10-cleanup
pkill -f s10-cleanup

sleep 10

$HERE/r5-metrics-xterm.bash   $HERE
$HERE/r3-start-rs-xterm.bash  $HERE

sleep 90

pgrep -f s3-start-replicaset
pkill -f s3-start-replicaset
pgrep -f s5-metrics.bash
pkill -f s5-metrics.bash

$HERE/r6-pods-tier-back-xterm.bash $HERE 
$HERE/r5-metrics-xterm.bash        $HERE

sleep 90

pgrep -f s6-pods-tier-back
pkill -f s6-pods-tier-back
pgrep -f s5-metrics.bash
pkill -f s5-metrics.bash

$HERE/r10-cleanup.bash      $HERE

sleep 10

pgrep -f s10-cleanup
pkill -f s10-cleanup


