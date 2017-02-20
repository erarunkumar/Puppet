# == Class: class_name
#
class roles::cassandra {
    class { 'profiles::java': }->
    class { 'profiles::cassandra': }
}
