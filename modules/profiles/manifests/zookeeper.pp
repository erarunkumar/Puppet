# == Class: profiles::zookeeper
# Install zookeeper
class profiles::zookeeper {
  class { 'cdh_repo': }->
  class { 'zookeeper': }
}
