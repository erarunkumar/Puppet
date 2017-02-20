# == Class: profiles::kafka
#
class profiles::kafka {
  include kafka
  include kafka::broker
}
