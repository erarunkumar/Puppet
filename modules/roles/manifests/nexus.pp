# == Class: roles::jenkins
#
class roles::nexus {
  class { 'profiles::base': }->
  class { 'profiles::nexus': }
  class { 'profiles::java':
    before => Class['profiles::nexus']
  }
}
