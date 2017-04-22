# == Class: profles::zabbix
#
class profiles::zabbix {
  include apache
  include apache::mod::php
  include mysql::server
  include zabbix
}
