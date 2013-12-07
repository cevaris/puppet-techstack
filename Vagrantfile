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

10.211.55.100   node0
10.211.55.101   node1
10.211.55.102   node2
10.211.55.103   node3
10.211.55.104   node4
10.211.55.105   node5
10.211.55.106   node6
10.211.55.107   node7
10.211.55.108   node8
10.211.55.109   node9
EOF

echo "Script done..."
SCRIPT


server_count = 3
network = '10.211.55.'
first_ip = 100

servers = []
(-1..server_count-1).each do |i|
  name = 'node' + (i + 1).to_s
  ip = network + (first_ip + i).to_s
  servers << {:name => name, :ip => ip,}
end

Vagrant.configure("2") do |config|

  servers.each do |options|

    config.vm.define "#{options[:name]}" do |node|
      node.vm.box = "precise64"
      node.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
      node.vm.provider :virtualbox do |v|
        v.name = "#{options[:name]}"
        v.customize ["modifyvm", :id, "--memory", "1024"]
      end
      node.vm.network :private_network, ip: "#{options[:ip]}"
      node.vm.hostname = "#{options[:name]}"
      node.vm.provision :shell, :inline => $master_script
    end


  end

end