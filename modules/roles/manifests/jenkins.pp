# == Class: roles::jenkins
#
class roles::jenkins {
  class { 'profiles::java': } ->
  class { 'profiles::base': }->
  class { 'profiles::jenkins': }
}
