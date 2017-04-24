# == Class: roles::kafka
#
class roles::kafka {
  class { 'profiles::java': }->
  class { 'profiles::base': }->
  class { 'profiles::kafka': }
}
