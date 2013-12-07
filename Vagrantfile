# -*- mode: ruby -*-
# vi: set ft=ruby :

$master_script = <<SCRIPT
#!/bin/bash
cat > /etc/hosts <<EOF
127.0.0.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

10.211.55.100   n0
10.211.55.101   n1
10.211.55.102   n2
10.211.55.103   n3
10.211.55.104   n4
10.211.55.105   n5
EOF

echo "Script done..."
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define :master do |master|
  	master.vm.box = "precise64"
    master.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    master.vm.provider :virtualbox do |v|
      v.name = "n0"
      v.customize ["modifyvm", :id, "--memory", "1024"]
    end
    master.vm.network :private_network, ip: "10.211.55.100"
    master.vm.hostname = "n0"
    master.vm.provision :shell, :inline => $master_script
  end

  config.vm.define :slave1 do |slave1|
  	slave1.vm.box = "precise64"
    slave1.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    slave1.vm.provider :virtualbox do |v|
      v.name = "n1"
      v.customize ["modifyvm", :id, "--memory", "1024"]
    end
    slave1.vm.network :private_network, ip: "10.211.55.101"
    slave1.vm.hostname = "n1"
    slave1.vm.provision :shell, :inline => $master_script
  end

  config.vm.define :slave2 do |slave2|
  	slave2.vm.box = "precise64"
    slave2.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    slave2.vm.provider :virtualbox do |v|
      v.name = "n2"
      v.customize ["modifyvm", :id, "--memory", "1024"]
    end
    slave2.vm.network :private_network, ip: "10.211.55.102"
    slave2.vm.hostname = "n2"
    slave2.vm.provision :shell, :inline => $master_script
  end

  config.vm.define :slave3 do |slave3|
  	slave3.vm.box = "precise64"
    slave3.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
    slave3.vm.provider :virtualbox do |v|
      v.name = "n3"
      v.customize ["modifyvm", :id, "--memory", "1024"]
    end
    slave3.vm.network :private_network, ip: "10.211.55.103"
    slave3.vm.hostname = "n3"
    slave3.vm.provision :shell, :inline => $master_script
  end

end