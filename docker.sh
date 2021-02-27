#!/bin/bash

#Install Docker on CentOS:
rhel() {
  yum install -y device-mapper-persistent-data lvm2
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  yum install -y docker-ce docker-ce-cli containerd.io
  systemctl start docker
  systemctl enable docker

#Test the installation by running a simple container:
  docker run hello-world

===========================================================================

#Add your user to the docker group, giving the user permission to run docker commands:
  usermod -aG docker cloud_user

===========================================================================

#Install docker-compose

  curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
}

#Install Docker on Ubuntu:
debian() {
  sudo su -
  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io
#Test the installation by running a simple container:
  docker run hello-world

## FYI Only ## Check Available Version for Install"
  sudo apt-cache madison docker-ce | awk '{print $3}'
}

if grep -iqE "centos|redhat" /etc/*release;then
  rhel
else
  debian
fi
