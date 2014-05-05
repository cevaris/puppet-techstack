# -*- mode: ruby -*-
# vi: set ft=ruby :

=begin
Some notes
http://michal.karzynski.pl/blog/2013/06/09/django-nginx-gunicorn-virtualenv-supervisor/
http://rogueleaderr.com/post/65157477648/the-idiomatic-guide-to-deploying-django-in-production
=end

$init_puppetmaster = %{
#!/bin/bash
  sudo apt-get update
  sudo apt-get install puppetmaster -y
  printf '[files]\npath /etc/puppet/files/\nallow 192.168.1.0/24\n[plugins]\nallow 192.168.1.0/24\n' > /etc/puppet/fileserver.conf
}

Vagrant.configure("2") do |config|

  config.librarian_puppet.puppetfile_dir = "puppet"

  config.vm.define "puppet" do |node|
    
    node.vm.box = "precise64"
    node.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    node.vm.provider :virtualbox do |v|
      v.name = "puppet"
      v.customize ["modifyvm", :id, '--memory', '1024']
    end

    node.vm.network :private_network, ip: '192.168.5.100'
    node.vm.hostname = "puppet"

    node.vm.provision :shell, :inline => $init_puppetmaster

  end

  config.vm.define "alpha" do |node|
    
    node.vm.box = "precise64"
    node.vm.box_url = "http://files.vagrantup.com/precise64.box"
    
    node.vm.provider :virtualbox do |v|
      v.name = "alpha"
      v.customize ["modifyvm", :id, '--memory', '1024']
    end

    node.vm.network :forwarded_port, guest: 8000, host: 8000
    node.vm.network :private_network, ip: '192.168.5.100'
    node.vm.hostname = "alpha"

    # node.vm.provision :shell, :inline => $init_puppet

    # node.vm.provision :puppet do |puppet|
    #   puppet.manifests_path = 'puppet/manifests'
    #   puppet.manifest_file  = "web.pp"
    #   puppet.module_path = "puppet/modules"
    #   puppet.options = "--verbose --debug"

    #   # puppet.hiera_config_path = "puppet/hiera.yaml"
    #   # puppet.working_directory = "/tmp/vagrant-puppet-2/"
    # end

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