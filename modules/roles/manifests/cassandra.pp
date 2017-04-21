# == Class: class_name
#
class roles::cassandra {
    class { 'profiles::fstab': }->
    class { 'profiles::base': }->
    class { 'profiles::java':
      before => Class['profiles::cassandra']
    }
    class { 'profiles::cassandra': }
}
