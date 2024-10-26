#!/bin/bash

#      tput reset
xset -b
echo "--------------------------"
echo "[CHECK START NAMESPACE default]"
echo "kubectl get svc -n default"
      kubectl get svc -n default
echo "[Nodes]"
echo " kubectl get nodes"
       kubectl get nodes
echo " kubectl get sts"
      kubectl get sts
echo "[STORAGE CLASS]"
echo " kubectl get sc"
     kubectl get sc
echo "[PERSISTENT VOLUME CLAIM]"
echo " kubectl get pvc "
      kubectl get pvc
echo "[PERSISTENT VOLUME]"
echo " kubectl get pv "
      kubectl get pv
echo ""
echo "[CHECK DONE ]"

#EOF
