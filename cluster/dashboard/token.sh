#!/bin/bash
echo "Récupération du tocker de connexion"
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
exit 0
