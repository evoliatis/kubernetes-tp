#!/bin/bash
echo "port d'accès https au dashboard"
kubectl get svc -n kube-system | grep kubernetes-dashboard | awk '{print $5; }' | cut -d ":" -f2
