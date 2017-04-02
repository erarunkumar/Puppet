# == Class: profiles::grizzly
class roles::grizzly {
  class { 'profiles::base': }->
  class { '::java::oracles': }->
  class { 'grizzly': }
}
