# == Class: class_name
#
class roles::cassandra {
    class { 'profiles::base': }->
    class { 'profiles::java': }->
    class { 'profiles::cassandra': }
}
