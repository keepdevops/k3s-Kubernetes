#!/bin/bash

tput reset
echo "[DEPLOYMENT]"
echo "kubectl apply -f deploy1.yaml"
      kubectl apply -f $1/deploy1.yaml
      echo "-----------------------------------"
      sleep 4
echo ""

tput reset

while :
do
    xset -b
    echo "-----------------------------------"
    echo "[PODS]"
    echo "kubectl get pods"
    kubectl get pods

    echo ""
    echo "[DEPLOYMENT]"
    echo "kubectl get deployment"
    kubectl get deployment

    echo ""
    echo "[REPLICASET]"
    echo "kubectl get rs"
    kubectl get rs

    echo ""
    echo "[HPA]"
    echo "kubectl get hpa"
    kubectl get hpa

    sleep 4
    tput reset
done

#EOF
