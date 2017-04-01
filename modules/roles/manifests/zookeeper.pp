#
class roles::zookeeper {
  class { 'profiles::base': }->
  class { 'profiles::zookeeper':}
}
