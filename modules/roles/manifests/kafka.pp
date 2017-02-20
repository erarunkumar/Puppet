# == Class: roles::kafka
#
class roles::kafka {
  class { 'profiles::java': }->
  class { 'profiles::kafka': }
}
