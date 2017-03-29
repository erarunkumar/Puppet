# == Class: profiles::zookeeper
# Install zookeeper
class profiles::zookeeper {
  class { 'cdh_repo': }->
  class { 'profiles::java': }->
  class { 'zookeeper': }
}
