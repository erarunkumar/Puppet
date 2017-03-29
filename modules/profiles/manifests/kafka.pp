# == Class: profiles::kafka
#
class profiles::kafka {
  class { 'profiles::java': }->
  class { 'kafka': }->
  class { 'kafka::broker': }
}
