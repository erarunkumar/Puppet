# class nvm_nodejs
#  - installs specified version of nodejs in home directory
class nvm_nodejs (
  $app_user    = $::nvm_nodejs::params::user,
  $app_home    = $::nvm_nodejs::params::home,
  $version     = $::nvm_nodejs::params::version,
  $packages    = undef, #like bower@4.4,
  $environment = '',
  $port        = $::nvm_nodejs::params::port,
  $node_app    = $::nvm_nodejs::params::node_app,
  $app_name    = undef,
  $app_dir     = "${app_home}/${app_name}",
) inherits ::nvm_nodejs::params {
  Exec {
    path => [
      '/usr/local/bin',
      '/usr/bin',
      '/usr/sbin',
      '/bin',
      '/sbin',
    ],
    logoutput => on_failure,
  }
  # NOTE: supports full version numbers (x.x.x) only, otherwise node path will be wrong
  validate_re($version, '^\d+\.\d+\.\d+$',
    'Please specify a valid nodejs version, format: x.x.x (e.g. 0.8.10)')

  user { $app_user:
    ensure     => present,
    home       => $app_home,
    managehome => true,
  } ~> Exec[nvm-install-script]

  # install via script
  exec { 'nvm-install-script':
    command     => 'curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh',
    logoutput   => true,
    cwd         => $app_home,
    user        => $app_user,
    creates     => "${app_home}/.nvm/nvm.sh",
    environment => [ "HOME=${app_home}" ],
    require     => Package['git','make'],
  }

  exec { 'nvm-install-node':
    command     => "/bin/bash -c \"source ${app_home}/.nvm/nvm.sh && nvm install ${version}\"",
    cwd         => $app_home,
    user        => $app_user,
    creates     => "${nvm_nodejs::app_home}/.nvm/versions/v${nvm_nodejs::version}/bin/node",
    provider    => shell,
    environment => [ "HOME=${app_home}", "NVM_DIR=${app_home}/.nvm" ],
    require     => Exec['nvm-install-script']
  }

  exec { 'node_configure':
    command     => "/bin/bash -c \"source ${app_home}/.nvm/nvm.sh && nvm alias default ${version} && nvm use default\"",
    user        => $app_user,
    cwd         => $app_home,
    environment => [ "HOME=${app_home}", "NVM_DIR=${app_home}/.nvm" ],
    require     => Exec['nvm-install-node']
  }

  file { "/etc/init.d/node_${app_name}":
    content => template('nvm_nodejs/init.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
  } ->
  class { 'nvm_nodejs::service': }

  if $packages != undef {
    nvm_nodejs::installpackages { $packages:
      require => Exec['node_configure']
    }
  }
}
