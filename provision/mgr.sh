echo Provisioning manager...
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum install -y iptables-services
sudo systemctl start iptables
sudo systemctl enable iptables
sudo iptables -I INPUT 5 -p tcp --dport 2376 -j ACCEPT
sudo iptables -I INPUT 6 -p tcp --dport 2377 -j ACCEPT
sudo iptables -I INPUT 7 -p tcp --dport 7946 -j ACCEPT
sudo iptables -I INPUT 8 -p udp --dport 7946 -j ACCEPT
sudo iptables -I INPUT 9 -p udp --dport 4789 -j ACCEPT
sudo /usr/libexec/iptables/iptables.init save
sudo systemctl restart docker.service
