#!/usr/bin/env bash

sudo groupadd docker
sudo usermod -aG docker vagrant

### Docker ###
curl -fsSL https://get.docker.com -o get-docker.sh
chmod 755 get-docker.sh
get-docker.sh
sudo sh get-docker.sh

#ssh-keygen -f /home/vagrant/.ssh/id_rsa -N ""
#cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
#chown vagrant /home/vagrant/.ssh/authorized_keys
#chown vagrant /home/vagrant/.ssh/id_rsa
#chown vagrant /home/vagrant/.ssh/id_rsa.pub


### RKE ###
wget https://github.com/rancher/rke/releases/download/v1.3.1/rke_linux-amd64
echo "RKE Downloaded"
mv /home/vagrant/rke_linux-amd64 /home/vagrant/rke
chmod 777 /home/vagrant/rke
chown vagrant /home/vagrant/rke

#sudo chown vagrant:vagrant /home/vagrant/.docker -R
#sudo chown g+rwx vagrant/.docker -R
