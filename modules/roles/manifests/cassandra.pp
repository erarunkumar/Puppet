# == Class: class_name
#
class roles::cassandra {
  class { 'profiles::java': }->
  class { 'profiles::fstab': }->
  class { 'profiles::base': }->
  class { 'profiles::cassandra': }
}
