# == Class: roles::jenkins
#
class roles::jenkins {
  class { 'profiles::base': }->
  class { 'profiles::jenkins': }
  class { 'profiles::java':
    before => Class['profiles::jenkins']
  }
}
