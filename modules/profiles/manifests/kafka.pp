# == Class: profiles::kafka
#
class profiles::kafka {
  class { 'kafka': }->
  class { 'kafka::broker': }
}
