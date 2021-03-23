#!/bin/bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get install git docker-ce docker-ce-cli containerd.io -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
sudo usermod -aG ubuntu $USER
newgrp docker
sudo mkdir /opt/wireguard-server
sudo chown shenny:shenny /opt/wireguard-server
git clone https://github.com/shenny88/mydocs.git
cd mydocs
ip="$(curl ifconfig.co)"
sed -i "s/wireguard.domain.com/$ip/g" docker-compose.yaml
sudo cp docker-compose.yaml /opt/wireguard-server/
sudo chown $USER. /opt/wireguard-server/docker-compose.yaml
cd /opt/wireguard-server/
docker-compose up -d
