# -*- mode: ruby -*-
# vi: set ft=ruby :

key = File.new('keys/id_rsa.pub').read()

$provision_script = %{
#!/bin/bash
cat > /etc/hosts <<EOF
127.0.0.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

192.168.2.100   node0
192.168.2.101   node1
192.168.2.102   node2
192.168.2.103   node3
192.168.2.104   node4
192.168.2.105   node5
192.168.2.106   node6
192.168.2.107   node7
192.168.2.108   node8
192.168.2.109   node9
EOF

echo "Adding authorized_keys to root user"
sudo mkdir -p /root/.ssh/
sudo echo "#{key}" >> /root/.ssh/authorized_keys
echo "Done adding authorized_keys"

echo "Adding authorized_keys to vagrant user"
mkdir -p .ssh/
echo "#{key}" >> .ssh/authorized_keys
echo "Done adding authorized_keys"

echo "Script done..."
}



server_count = 3
base_network = '192.168.2.'
base_ip = 100

servers = []
id = 0
while id < server_count
  name = 'node' + (id).to_s
  ip = base_network + (base_ip + id).to_s
  servers << {:name => name, :ip => ip}
  id += 1
end

Vagrant.configure("2") do |config|

  servers.each do |options|

    config.vm.define "#{options[:name]}" do |node|
      
      # node.vm.box = "precise64web"
      # node.vm.box_url = "boxes/precise64web.box"
      node.vm.box = "precise64"
      node.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
      
      node.vm.provider :virtualbox do |v|
        v.name = "#{options[:name]}"
        v.customize ["modifyvm", :id, "--memory", "1024"]
      end

      node.vm.network :private_network, ip: "#{options[:ip]}"
      node.vm.hostname = "#{options[:name]}"
      # node.vm.provision :shell, :inline => $provision_script

    end


  end

end