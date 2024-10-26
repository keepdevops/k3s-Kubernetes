#!/bin/bash

echo "[HORIZONTAL POD AUTOSCALER]"
echo " kubectl apply -f general-hpa.yaml"
       kubectl apply -f $1/general-hpa.yaml

echo ""
sleep 4
   tput reset


while :
do
   xset -b
   echo "-------------------------"
   echo "[HORIZONTAL-AUTOSCALER]"
   echo "kubectl get hpa general-hpa"
         kubectl get hpa general-hpa
   echo ""
	 grep -i desiredReplicas $1/general-hpa.yaml 
   sleep 4
   tput reset
done

#EOF
