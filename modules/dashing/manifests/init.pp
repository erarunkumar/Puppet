# == Class: dashing
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class dashing {

#Package { ensure => present }

Exec {
path => [
'/usr/local/bin',
'/opt/local/bin',
'/usr/bin',
'/usr/sbin',
'/bin',
'/sbin'],
logoutput => true,
}

exec { "apt-get_update":
    command => "apt-get update",
}


$package = ['ruby', 'ruby-dev', 'nodejs', 'g++', 'bundler']

package { $package:
    ensure => present, 
    require => Exec["apt-get_update"]
}


}
