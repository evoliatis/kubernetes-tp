#!/bin/bash
echo "Installation des composants pré-requis :"

apt-get update \
 && apt-get install -y apt-transport-https \
 && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
  | tee -a /etc/apt/sources.list.d/kubernetes.list \
  && sudo apt-get update

apt-get install -y \
  docker.io \
  kubelet \
  kubeadm \
  kubernetes-cni

echo "Fin de l'installation des composants initiaux"
exit 0
