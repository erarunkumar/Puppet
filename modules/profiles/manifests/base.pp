# == Class: profiles::base
#
class profiles::base {
  include timezone
  include ntp
  include selinux
  include ulimit
  include packages
  include ulimit::rules
  include zabbix::agent
  include motd
  include swap_file
}
