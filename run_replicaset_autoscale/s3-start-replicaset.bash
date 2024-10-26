#!/bin/bash
#echo "[NODES]"
#     "kubectl get nodes"
#    kubectl get nodes


echo "############"
echo $1
echo "############"


echo "//////////////"
echo "[PODS] //////"
echo "////////////"
echo  "kubectl apply -f pods-rs.yaml"
       kubectl apply -f $1/pods-rs.yaml
       sleep 10
echo "////////////////////"
echo "[REPLICATIONSET] //"
echo "//////////////////"
echo " kubectl apply -f frontend.yaml"
       kubectl apply -f $1/frontend.yaml
       sleep 10
       tput reset
#while :
#do
    xset -b
  #  echo "[PODS]"
  #  echo "kubectl get pods"
  #         kubectl get pods
  #  echo ""
  #  echo "[REPLICASET]"
  #  echo "kubectl get replicaset"
  #        kubectl get rs 
  #  echo "[PODS]"
    cat $1/pods-rs.yaml
    cat $1/frontend.yaml
    #sleep 20
#done

#EOF
