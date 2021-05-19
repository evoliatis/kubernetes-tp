#!/bin/bash
echo "port d'accès https au dashboard"
kubectl get svc -n kubernetes-dashboard | grep kubernetes-dashboard | awk '{print $5; }' | cut -d ":" -f2
