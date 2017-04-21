#
class roles::zookeeper {
  class { 'profiles::base': }->
  class { 'profiles::zookeeper':}
  class { 'profiles::java':
    before => Class['profiles::zookeeper']
  }
}
