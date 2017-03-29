#
class roles::zookeeper {
  class { 'profiles::java': }
  class { 'profiles::zookeeper':
    require => Class['profiles::java']
  }
}
