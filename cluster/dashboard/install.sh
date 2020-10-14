#!/bin/bash
echo "Installation du dashboard sur Rancher"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
kubectl rollout status deploy/kubernetes-dashboard -n kube-system

sleep 5

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
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
  namespace: kubernetes-dashboard
EOF

echo "Publication du port"
kubectl get svc/kubernetes-dashboard -n kubernetes-dashboard -o yaml | sed 's/ClusterIP/NodePort/g' | kubectl apply -f -

exit 0
