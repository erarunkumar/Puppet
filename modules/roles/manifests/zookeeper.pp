#
class roles::zookeeper {
  class { 'profiles::zookeeper':
    require => Class['profiles::java']
}
