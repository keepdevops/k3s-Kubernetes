#!/bin/bash

echo "[DELETE DEPLOYMENT]"
echo "kubectl delete -f deploy1.yaml"
      kubectl delete -f $1/deploy1.yaml
      echo ""
sleep 4

echo "[DELETE HPA-V2]"
echo "kubectl delete -f general-hpa.yaml "
      kubectl delete -f $1/general-hpa.yaml
      echo ""

sleep 8
tput reset

while :
do
  xset -b
  echo "------------------------------------------------"
  echo "[ CLEANUP ... CHECK STATUS IF FOUND OR RUNNING ]"
  echo ""

  echo "[PODS]"
  kubectl get pods

  echo ""
  echo "[DEPLOYMENT]"
  kubectl get deployment

  echo ""
  echo "[RS]"
  kubectl get rs

  echo ""
  echo "[HPA]"
  kubectl get hpa 

  sleep 4
  tput reset
done

#EOF
