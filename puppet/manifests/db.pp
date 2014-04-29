# exec { 'apt-update':
#   command => 'apt-get update',
#   path    => '/usr/bin'
# }




class { "postgresql::server":
  listen_addresses => "*"
}

# postgresql::server::db { 'analyze_db':
#   user     => 'analyze_login',
#   password => postgresql_password('analyze_login', '3m3rgEncY'),
# }


# class { 'postgresql::server':
#   ip_mask_allow_all_users => '0.0.0.0/0',
#   listen_addresses        => '*',
#   postgres_password       => 'Master_Pass',
# }

postgresql::server::db { 'simpledb':
  user     => 'django',
  password => postgresql_password('django', 'djangopass'),
}

postgresql::server::pg_hba_rule { 'allow application network to access app database':
  description => "Open up postgresql for access from 0.0.0.0/0",
  type => 'host',
  database => 'simpledb',
  user => 'django',
  address => '0.0.0.0/0',
  auth_method => 'md5',
}



# postgresql::server::db { 'test1':
#   user     => 'test1',
#   password => 'test1',
# }

# class { 'postgresql::server':
#   ip_mask_allow_all_users => '0.0.0.0/0',
#   listen_addresses        => '*',
#   postgres_password       => 'masterPass_',
# }
# postgresql::server::role { 'sampleuser':
#   createdb      => true,
#   login         => true,
#   password_hash => postgresql_password('sampleuser', 'sample'),
# }
# postgresql::server::db { 'sampledb':
#   user     => 'sampleuser',
#   password => postgresql_password('sampleuser', 'sample'),
# }



