# == Class: profiles::base
#
class profiles::base {
  include timezone
  include ntp
  include selinux
  include ulimit
  include ulimit::rules
}
