# == Class: profiles::nginx
class roles::rproxy {
  class { 'profiles::base': }->
  class { 'profiles::rproxy': }
}
