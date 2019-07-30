#!/bin/bash
echo "Mise en place du master"
echo -n "Adresse IP publique du serveur : "
read ip
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$ip --kubernetes-version stable-1.9
echo "N'oubliez d'ajouter vos minions à l'aide de la commande kubeadm join"
exit 0
