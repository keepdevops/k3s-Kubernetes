#!/bin/bash

while :
do

xset -b
echo "/////////////////////////////"
echo "[METRICS DASHBOARD START] //"
echo "////////////////////////////"
echo "[CONTEXT]"
       kubectl config get-contexts
#echo ""
echo "[SERVICE]"
       kubectl get svc
#echo ""
echo "[REPLICASET]"
echo "kubectl get rs"
      kubectl get rs
#echo ""
echo "[CLUSTER NODES METRICS]"
       kubectl top nodes
#echo "" 
#echo "[HORIZONTAL POD AUTOSCALER]"
#       kubectl get hpa
#echo ""
echo " [PODS ON NODES]"
echo " kubectl get pods -o wide"
      kubectl get pods -o wide 
#echo ""
echo "[POD LABELS]"
echo " kubectl get po --show-labels"
       kubectl get po --show-labels
#echo ""
echo "[PODS METRICS]"
       kubectl top pods
echo "//////////////////////////"
echo "[METRICS DASHBOARD END]//"
echo "/////////////////////////"
sleep 7
done

#EOF
