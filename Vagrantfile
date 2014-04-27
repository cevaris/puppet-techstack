# -*- mode: ruby -*-
# vi: set ft=ruby :

name = 'fission'
ip_address = '192.168.5.100'

$provision_script = %{
#!/bin/bash
}

Vagrant.configure("2") do |config|

  config.vm.define "#{name}-web" do |node|
    
    node.vm.box = "precise64"
    node.vm.box_url = "http://goo.gl/sHRjNb"
    
    node.vm.provider :virtualbox do |v|
      v.name = "#{name}-web"
      v.customize ["modifyvm", :id, '--memory', '4096']
    end

    node.vm.network :private_network, ip: ip_address
    node.vm.hostname = "#{name}-web"
    # node.vm.provision :shell, :inline => $provision_script
    config.vm.synced_folder "scripts/", "/dev/install"

  end

end