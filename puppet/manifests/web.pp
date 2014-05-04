stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-update':
    command => 'apt-get update',
    path    => '/usr/bin'
  }
}

class { 'apt_get_update':
  stage => preinstall,
}

package { 'git': 
  ensure => installed 
}->
vcsrepo { '/var/www/django_sample':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/cevaris/django-sample',
}



class { 'python':
  pip        => true,
  virtualenv => true,
  gunicorn   => true,
  dev        => true,
}->
# file { ['/root/.pip','/var/www/django_sample/venv','/var/www/django_sample/venv/build']: 
file { ['/var/www/django_sample/venv','/var/www/django_sample/venv/build']: 
  ensure => directory,
  recurse => true,
}->
python::virtualenv { '/var/www/django_sample/venv':
  version      => 'system',  
  systempkgs   => true,
  cwd          => '/var/www/django_sample',
  requirements => '/var/www/django_sample/requirements.txt',
}->
python::gunicorn { 'vhost':
  ensure      => present,
  virtualenv  => '/var/www/django_sample/venv',
  mode        => 'wsgi',
  dir         => '/var/www/django_sample/sample',
  bind        => 'unix:/tmp/gunicorn.socket',
  environment => 'prod',
  template    => 'python/gunicorn.erb',
}


include postgresql::client
package { 'vim': ensure => "installed" }