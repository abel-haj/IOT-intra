#!/bin/bash

apt install net-tools -y
echo "export PATH=$PATH:/usr/sbin" >> /etc/profile
export INSTALL_K3S_EXEC="server --write-kubeconfig-mode 644  --advertise-address=${MASTER_IP} --node-ip=${MASTER_IP}"
curl -sfL https://get.k3s.io |  sh -
cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/
echo "alias k='k3s kubectl'" >> /etc/profile.d/apps-bin-path.sh