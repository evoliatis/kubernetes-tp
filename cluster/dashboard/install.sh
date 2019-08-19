#!/bin/bash
echo "Mise en place des composants"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
echo "N'oubliez pas de créer le compte utilisateur"
echo "La connexion se réalise avec kubectl proxy"
exit 0
