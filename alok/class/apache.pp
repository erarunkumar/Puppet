class apache{
user {'sandeep':
  ensure           => 'present',
  comment          => 'root',
  gid              => '1003',
  home             => 'root/sandeep',
  password         => '$1$oPe7.3fd$JkWVIrqZCVzHT1DolHTXE0',
  password_max_age => '99',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '1000088',
}
exec {'apt-update':                    
  command => '/usr/bin/apt-get update'  
}
package {'apache2':
  require => Exec['apt-update'],        
  ensure => installed,
}
service {'apache2':
  ensure => running,
}
}

