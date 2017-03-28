# == Class: class_name
#
class roles::java {
    class { 'profiles::base': }->
    class { 'profiles::java': }
}
