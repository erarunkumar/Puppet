#
class roles::zookeeper {
  class { 'profiles::java': }->
  class { 'profiles::base': }->
  class { 'profiles::zookeeper':}
}
