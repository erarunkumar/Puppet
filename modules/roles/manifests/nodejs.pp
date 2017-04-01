# == Class: roles::nodejs
#
class roles::nodejs {
  class { 'profiles::base': }->
  include profiles::nodejs
}
