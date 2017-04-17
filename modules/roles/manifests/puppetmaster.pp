# == Class: roles::puppetmater
#
class roles::puppetmaster {
  include profiles::base
  include profiles::puppetmaster
}
