# exec { 'apt-update':
#   command => 'apt-get update',
#   path    => '/usr/bin'
# }

class { "postgresql::server":
  listen_addresses => "*"
}

postgresql::server::role { 'django':
  password_hash => postgresql_password('django', 'djangopass'),
}

postgresql::server::db { 'simpledb':
  user     => 'django',
  password => postgresql_password('django', 'djangopass'),
}

# postgresql::server::database_grant { 'simpledb':
#   privilege => 'ALL',
#   db        => 'simpledb',
#   role      => 'django',
# }

postgresql::server::pg_hba_rule { 'allow application network to access app database':
  description => "Open up postgresql for access from 0.0.0.0/0",
  type => 'host',
  database => 'all',
  user => 'all',
  address => '0.0.0.0/0',
  auth_method => 'md5',
}


# postgresql::server::pg_hba_rule { 'allow application network to access app database':
#   description => "Open up postgresql for access from 192.168.6.1/32",
#   type => 'host',
#   database => 'all',
#   user => 'all',
#   address => '192.168.6.1/32',
#   auth_method => 'md5',
# }


