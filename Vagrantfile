# -*- mode: ruby -*-
# vi: set ft=ruby :

servers=[
  {
    :hostname => "mgr1",
    :ip => "10.0.0.2",
    :box => "Dougs71/CentOS-7.6.1810-Minimal",
    :memory => 512,
    :cpus => 1,
    :role => "mgr",
  },
  {
    :hostname => "mgr2",
    :ip => "10.0.0.3",
    :box => "Dougs71/CentOS-7.6.1810-Minimal",
    :memory => 512,
    :cpus => 1,
    :role => "mgr",
  },
  {
    :hostname => "mgr3",
    :ip => "10.0.0.4",
    :box => "Dougs71/CentOS-7.6.1810-Minimal",
    :memory => 512,
    :cpus => 1,
    :role => "mgr",
  },
  {
    :hostname => "wrk1",
    :ip => "10.0.0.5",
    :box => "Dougs71/CentOS-7.6.1810-Minimal",
    :memory => 512,
    :cpus => 1,
    :role => "wrk",
  },
  {
    :hostname => "wrk2",
    :ip => "10.0.0.6",
    :box => "Dougs71/CentOS-7.6.1810-Minimal",
    :memory => 512,
    :cpus => 1,
    :role => "wrk",
  },
  {
    :hostname => "wrk3",
    :ip => "10.0.0.7",
    :box => "Dougs71/CentOS-7.6.1810-Minimal",
    :memory => 512,
    :cpus => 1,
    :role => "wrk",
  }
]

Vagrant.configure("2") do |config|
  config.vbguest.auto_update = false
  config.vm.box_check_update = false
  config.vm.box = "Dougs71/CentOS-7.6.1810-Minimal"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.ssh.insert_key = false
  config.ssh.private_key_path = ['provision/vagrant']

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostname = machine[:hostname]
      node.vm.network "private_network", ip: machine[:ip]

      node.vm.provider "virtualbox" do |vb|
        vb.memory = machine[:memory]
        vb.cpus = machine[:cpus]
        vb.name = machine[:hostname]
      end

      case machine[:role]
      when "mgr"
        node.vm.provision "shell", path: "provision/mgr.sh", privileged: false
      when "wrk"
        node.vm.provision "shell", path: "provision/wrk.sh", privileged: false
      end
   end
  end

  config.vm.provision "shell", path: "provision/common.sh", privileged: false
end