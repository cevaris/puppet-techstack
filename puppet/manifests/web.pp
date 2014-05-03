
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
  stage => preinstall
}








group { 
  'apps': ensure => "present",
}->
user { 'web':
    ensure   => present,
    gid      => 'apps',
    groups   => ['apps'],
    home     => '/home/web',
    shell    => '/bin/bash',
    password => '$1$Armn0XkE$7rsVorlFtEYmzAxtT9hNg/',
}->
package {
 'git': ensure => "installed" 
}->
vcsrepo { '/home/web/django_sample':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/cevaris/django-sample',
  owner    => 'web',
  group    => 'apps',
}->
class { 'python':
  version    => 'system',
  pip        => true,
  virtualenv => true,
  gunicorn   => true,
}->
python::virtualenv { '/home/web/django_sample':
  ensure       => present,
  version      => 'system',
  requirements => '/home/web/django_sample/requirements.txt',
  systempkgs   => true,
  cwd          => '/home/web/django_sample',
  owner    => 'web',
  group    => 'apps',
}


include postgresql::client
