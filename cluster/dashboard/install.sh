#!/bin/bash
echo "Installation du dashboard sur Rancher"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
kubectl rollout status deploy/kubernetes-dashboard -n kube-system

sleep 5
echo "Publication du port"
kubectl get svc/kubernetes-dashboard  -n kubernetes-dashboard  -o yaml | sed 's/ClusterIP/NodePort/g' | kubectl apply -f -

exit 0
