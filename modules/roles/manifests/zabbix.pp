# == Class: roles::zabbix
#
class roles::zabbix {
  class { 'profiles::base': }->
  class { 'profiles::zabbix': }
}
