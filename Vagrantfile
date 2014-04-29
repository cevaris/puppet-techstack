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
  sudo apt-get install vim -y
}

Vagrant.configure("2") do |config|

  config.librarian_puppet.puppetfile_dir = "puppet"

  config.vm.define "alpha" do |node|
    
    node.vm.box = "precise64"
    node.vm.box_url = "http://goo.gl/sHRjNb"
    
    node.vm.provider :virtualbox do |v|
      v.name = "alpha"
      v.customize ["modifyvm", :id, '--memory', '1024']
    end

    node.vm.network :private_network, ip: '192.168.5.100'
    node.vm.hostname = "alpha"

    node.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file  = "web.pp"
      puppet.module_path = "puppet/modules"
      puppet.options = "--verbose --debug"
    end

  end

  # config.vm.define "web1" do |node|
    
  #   node.vm.box = "precise64"
  #   node.vm.box_url = "http://goo.gl/sHRjNb"
    
  #   node.vm.provider :virtualbox do |v|
  #     v.name = "web1"
  #     v.customize ["modifyvm", :id, '--memory', '1024']
  #   end

  #   node.vm.network :private_network, ip: '192.168.5.101'
  #   node.vm.hostname = "web1"
  #   node.vm.provision :shell, :inline => $init_script

  # end



  # config.vm.define "db" do |node|
    
  #   node.vm.box = "precise64"
  #   node.vm.box_url = "http://goo.gl/sHRjNb"
    
  #   node.vm.provider :virtualbox do |v|
  #     v.name = "db"
  #     v.customize ["modifyvm", :id, '--memory', '1024']
  #   end

  #   node.vm.network :private_network, ip: '192.168.6.105'
  #   node.vm.hostname = "db"

  #   node.vm.provision :puppet do |puppet|
  #       puppet.manifests_path = "puppet/manifests"
  #       puppet.manifest_file  = "db.pp"
  #       puppet.module_path = "puppet/modules"
  #       puppet.options = "--verbose --debug"
  #   end

  # end

end