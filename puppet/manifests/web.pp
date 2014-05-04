# stage { 'pre':
#   before => Stage['main']
# }

# class apt_get_update {
#   exec { 'apt-update':
#     command => 'apt-get update',
#     path    => '/usr/bin'
#   }
# }

# class { 'apt_get_update':
#   stage => pre,
# }

stage { 'pre': before => Stage['main'] }
class env {
    include postgresql::client
    package {
      'build-essential': ensure => installed;
      'vim': ensure => installed;
      'git': ensure => installed;
    }
    class { 'python':
      pip        => true,
      virtualenv => true,
      gunicorn   => true,
      dev        => true,
    }
}
class { "env": stage => 'pre' }



# Git 
# package {  }
vcsrepo { '/var/www/django_sample':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/cevaris/django-sample', 
  require  => Package['git'],
}



# file { ['/var/www/django_sample/venv','/var/www/django_sample/venv/build']: 
#   ensure => directory,
#   recurse => true,
#   require => python_env
# }->
# python::virtualenv { '/var/www/django_sample/venv':
#   version      => 'system',  
#   systempkgs   => true,
#   cwd          => '/var/www/django_sample',
#   requirements => '/var/www/django_sample/requirements.txt',
# }
# # ->
# # python::gunicorn { 'vhost':
# #   ensure      => present,
# #   virtualenv  => '/var/www/django_sample/venv',
# #   mode        => 'wsgi',
# #   dir         => '/var/www/django_sample/sample',
# #   bind        => 'unix:/tmp/gunicorn.socket',
# #   environment => 'prod',
# #   template    => 'python/gunicorn.erb',
# # }


