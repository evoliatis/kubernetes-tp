#!/bin/bash
echo "Script à lancé depuis l'utilisateur executant kubectl"
echo "Mise en place du réseau"
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml
exit 0
