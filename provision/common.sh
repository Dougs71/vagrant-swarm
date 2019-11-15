echo Provisioning common...
sudo -H -u vagrant bash -c 'yes y | ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa'
cp /vagrant/provision/vagrant ~/.ssh/id_rsa
cp /vagrant/provision/vagrant.pub ~/.ssh/id_rsa.pub
cat /vagrant/provision/vagrant.pub >> ~/.ssh/authorized_keys
sudo chmod 0600 ~/.ssh/*
sudo cp -f /vagrant/provision/hosts /etc

# Common packages
sudo yum install -y epel-release
sudo yum install -y wget
sudo yum install -y git
sudo yum install -y unzip
sudo yum install -y curl
sudo yum install -y telnet
sudo yum install -y net-tools

# Docker

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo usermod -aG docker vagrant
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Docker Compose
sudo yum upgrade -y python*
sudo yum install -y python-pip
sudo pip install docker-compose
