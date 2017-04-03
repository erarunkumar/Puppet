# == Class: roles::rproxy
class roles::rproxy {
  class { 'profiles::base': }->
  class { 'profiles::rproxy': }
}
