# == Class: roles::jenkins
#
class roles::nexus {
  class { 'profiles::java': } ->
  class { 'profiles::base': }->
  class { 'profiles::nexus': }
}
