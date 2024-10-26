#!/bin/bash

echo "[DELETE REPLICASET]"
echo "kubectl delete -f frontend.yaml"
      kubectl delete -f $1/frontend.yaml
sleep 2
echo "[DELETE HPA-V2]"

echo "kubectl delete -f hpa-v2.yaml"
      kubectl delete -f $1/hpa-v2.yaml

echo "kubectl delete -f controllers-hpa-rs.yaml"
      kubectl delete -f $1/controllers-hpa-rs.yaml

echo "[DELETE PODS]"
      kubectl delete -f $1/pods-ns.yaml
      kubectl delete -f $1/pods-rs.yaml
sleep 2

while :
do
  xset -b
  echo "------------------------------------"
  echo "[CHECK STATUS IF FOUND OR RUNNING]"
  kubectl get hpa frontend-scaler
  kubectl get rs
  kubectl get pods
  echo ""
  sleep 2
  tput reset
done

#EOF
