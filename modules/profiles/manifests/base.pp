# == Class: profiles::base
#
class profiles::base {
  include timezone
  include ntp
  include selinux
}
