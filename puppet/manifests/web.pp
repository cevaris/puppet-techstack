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
    exec { 'apt-update':
      command => 'apt-get update',
      path    => '/usr/bin'
    }
    package { ['build-essential', 'vim', 'git']:
      ensure => installed,
      require => Exec['apt-update'],
    }
    class { 'python':
      pip        => true,
      virtualenv => true,
      gunicorn   => true,
      dev        => true,
      require => Exec['apt-update'],
    }
}
class { "env": stage => 'pre' }


# Git 
vcsrepo { '/var/www/django_sample':
  ensure   => present,
  provider => git,
  source   => hiera('git_repo'),
  require  => Package['git'],
}



# # file { ['/var/www/django_sample/venv','/var/www/django_sample/venv/build']: 
# #   ensure => directory,
# #   recurse => true,
# #   require => env
# # }->
# include   ->
# python::virtualenv { '/var/www/django_sample/venv':
#   version      => 'system',  
#   systempkgs   => true,
#   cwd          => '/var/www/django_sample',
#   requirements => '/var/www/django_sample/requirements.txt',
#   require => Class['env']
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


