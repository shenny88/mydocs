#!/bin/bash
#Install Docker on CentOS:

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
