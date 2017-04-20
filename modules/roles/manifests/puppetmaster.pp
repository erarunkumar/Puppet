# == Class: roles::puppetmater
#
class roles::puppetmaster {
  include profiles::base
  include profiles::puppetmaster
  class {'spark::spark_pub_key':
    require => Class['profiles::puppetmaster']
  }
}
