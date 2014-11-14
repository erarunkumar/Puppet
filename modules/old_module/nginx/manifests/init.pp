class nginx {
exec { 'apt-update':                    
  command => '/usr/bin/apt-get update'  
}
package { 'nginx':
  require => Exec['apt-update'],        
  ensure => installed,
}
service { 'nginx':
  ensure => running,
}
}

