# == Class: roles::kafka
#
class roles::kafka {
  class { 'profiles::base': }->
  class { 'profiles::kafka': }
}
