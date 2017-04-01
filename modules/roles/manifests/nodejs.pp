# == Class: roles::nodejs
#
class roles::nodejs {
  class { 'profiles::base': }->
  class { 'profiles::nodejs': }
}
