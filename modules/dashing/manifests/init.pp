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

exec{"dashing": 
command => "sudo gem install dashing --verbose",
require => Package[$package]
}

exec{"dashing_project":
command => 'dashing new "/sau_dashboard_project"',
require => Exec["dashing"]
}

exec{"bundle_project":
cwd => "/sau_dashboard_project",
command => "bundle",
require => Exec["dashing_project"]
}

exec{"dashing_start":
cwd => "/sau_dashboard_project",
command => "dashing start",
require => Exec["bundle_project"]
}

}
