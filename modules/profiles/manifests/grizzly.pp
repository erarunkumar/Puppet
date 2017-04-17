# == Class: profiles::grizzly
# Install grizzly
class profiles::grizzly {
  class { 'sudo': }->
  include grizzly
}
