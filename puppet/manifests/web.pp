exec { 'apt-update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

class { 'python':
  version    => 'system',
  pip        => true,
  virtualenv => true,
  gunicorn   => true,
}

vcsrepo { '/var/www/django_sample':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/cevaris/django-sample',
}