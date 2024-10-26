#!/bin/bash
echo ""
echo ""
echo "[PODS]"
echo  "kubectl apply -f pods-ns.yaml"
       kubectl apply -f $1/pods-ns.yaml
       sleep 10

    xset -b
    cat $1/pods-ns.yaml
    cat $1/frontend.yaml
   

#EOF
