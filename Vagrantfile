# -*- mode: ruby -*-
# vi: set ft=ruby :

=begin
Some notes
http://michal.karzynski.pl/blog/2013/06/09/django-nginx-gunicorn-virtualenv-supervisor/
http://rogueleaderr.com/post/65157477648/the-idiomatic-guide-to-deploying-django-in-production

=end

$init_script = %{
#!/bin/bash
sudo apt-get update
}

Vagrant.configure("2") do |config|

  config.vm.define "web" do |node|
    
    node.vm.box = "precise64"
    node.vm.box_url = "http://goo.gl/sHRjNb"
    
    node.vm.provider :virtualbox do |v|
      v.name = "web"
      v.customize ["modifyvm", :id, '--memory', '4096']
    end

    node.vm.network :private_network, ip: '192.168.5.100'
    node.vm.hostname = "web"
    node.vm.provision :shell, :inline => $init_script
    config.vm.synced_folder "scripts/", "/dev/"

  end

end