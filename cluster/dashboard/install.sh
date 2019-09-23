#!/bin/bash
echo "Installation du dashboard sur Rancher"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl rollout status deploy/kubernetes-dashboard -n kube-system
sleep 5
echo "Publication du port"
kubectl get svc/kubernetes-dashboard  -n kube-system  -o yaml | sed 's/ClusterIP/NodePort/g' | kubectl apply -f -
echo "Mise en place du rôle pour rancher"

cat <<'EOF' | kubectl create -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system
EOF

exit 0
