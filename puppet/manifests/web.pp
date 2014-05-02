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
    # uid => 2001,
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
  # proxy        => 'http://proxy.domain.com:3128',
  systempkgs   => true,
  # distribute   => false,
  # ownero=> 'web',
  # group        => 'apps',
  cwd          => '/home/web/django_sample',
  # timeout      => 0,
}
