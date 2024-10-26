#!/bin/bash
echo "[DESCRIBE HPA]"
echo "kubectl describe hpa general-hpa | grep -i size"
sleep 4
tput reset


while : 
do
  xset -b
  echo "----------------------------------"
  echo "[DESCRIBE HPA]"
  echo " kubectl describe hpa general-hpa | grep -i size"
  kubectl describe hpa general-hpa | grep -i size 

  echo ""
  echo "[TOP]"
  echo "kubectl top pods"
  kubectl top pods

   echo ""
   echo "[PODS]"
   echo "kubectl get pods"
   kubectl get pods 

   sleep 4
   tput reset
done

#read -p "<cr> to continue..." aaa
#     tput reset
#     sleep 10

#EOF
