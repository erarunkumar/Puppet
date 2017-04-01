# == Class: profiles::java
# Install java::oracles
class roles::java {
  class { 'profiles::base': }->
  class { '::java::oracles': }
}
