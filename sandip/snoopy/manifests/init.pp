# == Class: snoopy
#
class snoopy ($package = true, $service = true) {
  include snoopy::params

  $snoopy_package_name = $snoopy::params::snoopy_package_name
  $snoopy_lib_path     = $snoopy::params::snoopy_lib_path

  case $package {
    true    : { $ensure_package = 'present' }
    false   : { $ensure_package = 'purged' }
    latest  : { $ensure_package = 'latest' }
    default : { fail('package must be true, false or lastest') }
  }

  if $::operatingsystem =~ /(Debian|Ubuntu)/ {
    case $service {
      true    : { $ensure_service = true }
      false   : { $ensure_service = false }
      default : { fail('service must be true or false') }
    }

    if $service and !$package {
      fail('Can\'t have service without package!')
    }

    file { '/tmp/debconf.snoopy.preseed':
      ensure  => present,
      path    => '/tmp/debconf.snoopy.preseed',
      mode    => '0400',
      owner   => 'root',
      content => template('snoopy/debconf.snoopy.preseed.erb'),
    }

    package { $snoopy_package_name:
      ensure       => $ensure_package,
      alias        => 'snoopy',
      responsefile => '/tmp/debconf.snoopy.preseed',
      require      => File['/tmp/debconf.snoopy.preseed'],
    }

    exec { 'reconfigure':
      command     => "/usr/bin/debconf-set-selections /tmp/debconf.snoopy.preseed; /usr/sbin/dpkg-reconfigure -fnoninteractive ${snoopy_package_name}",
      refreshonly => true,
      subscribe   => File['/tmp/debconf.snoopy.preseed'],
      require     => Package['snoopy'],
    }
  } else {
    case $service {
      true    : { $ensure_service = 'present' }
      false   : { $ensure_service = 'absent' }
      default : { fail('service must be true or false') }
    }

    package { $snoopy_package_name: ensure => $ensure_package, }

    if $service == true {
      file { '/etc/ld.so.preload':
        ensure => $ensure_service,
        path   => '/etc/ld.so.preload',
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
      }

      file_line { 'snoopy':
        ensure  => $ensure_service,
        line    => $snoopy_lib_path,
        path    => '/etc/ld.so.preload',
        require => File['/etc/ld.so.preload'],
      }
    }
  }
}
# EOF
