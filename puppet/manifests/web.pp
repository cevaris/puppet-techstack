# exec { 'apt-update':
#   command => 'apt-get update',
#   path    => '/usr/bin'
# }

# include git

# class{ 'git':
#   svn => 'installed',
#   gui => 'installed',
# }

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


# git::repo{'repo_name':
#  path   => '/var/www/django_sample',
#  source => 'git@github.com:cevaris/django-sample.git'
# }