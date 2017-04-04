# == Class: grizzly
#
# Full description of class a here.
#
class grizzly (
  $app_user         = $::grizzly::params::user,
  $app_home         = $::grizzly::params::home,
  $app_name         = $::grizzly::params::app_name,
  $app_dir          = "${app_home}/${app_name}",
  $property         = false
) inherits ::grizzly::params {

  user { $app_user:
    ensure     => present,
    home       => $app_home,
    managehome => true,
  }

  file { $app_dir:
    ensure  => directory,
    owner   => $app_user,
    group   => $app_user,
    require => User[$app_user]
  }

  file { "${app_dir}/log":
    ensure  => directory,
    owner   => $app_user,
    group   => $app_user,
    require => User[$app_user]
  }
  file { "${app_dir}/application":
    ensure  => directory,
    owner   => $app_user,
    group   => $app_user,
    require => User[$app_user],
    mode    => '0755'
  }

  file { "${app_dir}/bin":
    ensure  => directory,
    owner   => $app_user,
    group   => $app_user,
    require => User[$app_user]
  }

  file { "${app_dir}/pid":
    ensure  => directory,
    owner   => $app_user,
    group   => $app_user,
    require => User[$app_user]
  }

  file { "${app_dir}/bin/grizzly.sh":
    content => template('grizzly/grizzly.sh.erb'),
    mode    => '0755',
    owner   => $app_user,
    group   => $app_user,
    require => File["${app_dir}/bin"]
  }
  if $property {
    file { "${app_dir}/udf/":
      ensure  => directory,
      recurse => remote,
      source  => 'puppet:///modules/grizzly/udf',
      owner   => $app_user,
      group   => $app_user,
      require => User[$app_user]
    }

    file { '/etc/mobiadz':
      ensure  => directory,
      owner   => $app_user,
      group   => $app_user,
      require => User[$app_user]
    }

    file { '/etc/mobiadz/properties/':
      ensure  => directory,
      recurse => remote,
      source  => "puppet:///modules/grizzly/${app_name}/properties",
      owner   => $app_user,
      group   => $app_user,
      require => File['/etc/mobiadz/']
    }
  }

  $servive_name  = "grizzly_${app_name}"
  $start_command = "/bin/su grizzly -s /bin/bash -c '${app_dir}/bin/grizzly.sh start'"
  $stop_command  = "/bin/su grizzly -s /bin/bash -c '${app_dir}/bin/grizzly.sh stop'"
  $status_command  = "/bin/su grizzly -s /bin/bash -c '${app_dir}/bin/grizzly.sh status'"

  file { "/etc/init.d/grizzly_${app_name}":
    content => template('grizzly/init-grizzly-app.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
    alias   => 'initd',
    require => File["${app_dir}/bin/grizzly.sh"]
  }

  service { $servive_name:
    ensure   => 'stopped',
    enable   => true,
    provider => 'redhat',
    require  => File['initd'],
  }
}
