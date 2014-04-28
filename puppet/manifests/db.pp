# exec { 'apt-update':
#   command => 'apt-get update',
#   path    => '/usr/bin'
# }

node db {
  include postgresql::server

  postgresql::role {  'sampleuser':
    password_hash => postgresql_password('sampleuser', 'sample'),
  }

  postgresql::server::db { 'sampledb':
    user     => 'sampleuser',
    password => 'sample'
  }

  postgresql::server::db { 'sampledb':
    user     => 'sampleuser',
    password => 'sample'
  }

}

