exec { 'apt-update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

$defaults = [ 'vim', 'git']
package { $defaults: ensure => "installed" }


include postgresql::client


class { 'python':
  version    => 'system',
  pip        => true,
  virtualenv => true,
  gunicorn   => true,
}


group { 'apps':
  ensure => "present",
}

user { 'web':
    ensure => present,
    gid => 'apps',
    groups => ['apps'],
    home => '/home/web',
    shell => '/bin/bash',
    password => '$1$IawipmjB$OCWi4dIX15rRxMZ80hRkS/'
}

vcsrepo { '/home/web/django_sample':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/cevaris/django-sample',
  owner    => 'web',
  group    => 'apps',
}


python::virtualenv { '/home/web/django_sample':
  ensure       => present,
  version      => 'system',
  requirements => '/home/web/django_sample/requirements.txt',
  systempkgs   => true,
  cwd          => '/home/web/django_sample',
}
