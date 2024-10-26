#!/bin/bash
xset -b





echo "[INITIAL CONDITIONS]"


echo " kubectl apply -f ./metrics-server-components.yaml"
       kubectl apply -f ./metrics-server-components.yaml
sleep 45
kubectl top pod -A
sleep 2
kubectl top nodes -A
sleep 2

echo "[SYSTEM DEFAULTS kube-system]"
echo " kubectl get deployment metrics-server -n kube-system"
       kubectl get deployment metrics-server -n kube-system
       kubectl get deployment metrics-server --all-namespaces
echo "[CLUSTER]"
echo " kubectl get svc -n kube-system"
       kubectl get svc -n kube-system
echo " [DEPLOYMENT] "
echo " kubectl get deployment -n kube-system"
       kubectl get deployment -n kube-system
echo "[END OF INITIAL CONDITIONS]"

#EOF
