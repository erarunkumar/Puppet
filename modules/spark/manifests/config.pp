# == Class: spark::config
#
# Full description of class a here.
#
class spark::config (
  $dirname          = 'spark-2.0.0-bin-hadoop2.7',
  $filename         = "${dirname}.tgz",
  $install_path     = "/opt/${dirname}",
  $spark_home       = "/opt/${dirname}",
  $spark_env        = $spark::spark_env,
  $spark_master_url = $spark::master_url,
  $slave            = $spark::slave,
  $confdir          = "/opt/${dirname}/conf",
  $sshkey           = '',
){
  user { 'spark':
    ensure     => 'present',
    managehome =>  true,
  }

  if ($sshkey != '') {
    ssh_authorized_key { 'spark':
      ensure  => present,
      name    => spark,
      user    => spark,
      type    => 'rsa',
      key     => $sshkey,
      require => User[spark]
    }
  }

  archive { $filename :
    path          => "/tmp/${filename}",
    source        => 'https://archive.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz',
    checksum_type => 'none',
    extract       => true,
    extract_path  => '/opt/',
    user          => 'root',
    group         => 'root',
    creates       => "${install_path}/bin",
    cleanup       => true,
    require       => User['spark']
  }

  file { '/opt/spark':
    ensure  => link,
    target  => "/opt/${dirname}",
    require => Archive[$::filename],
  }

  file { $install_path:
    ensure  => directory,
    owner   => 'spark',
    group   => 'spark',
    recurse => true,
    require => Archive[$filename]
  }

  file { "/opt/${dirname}/conf/spark-env.sh":
    content => template('spark/spark-env.sh.erb'),
    mode    => '0755',
    owner   => 'spark',
    group   => 'spark',
    notify  => Service[$service_name],
  }

  if $slave != undef {
    file { "${confdir}/slaves":
      content => template('spark/slaves.erb'),
      mode    => '0644',
      owner   => 'spark',
      group   => 'spark',
    }
  }
  if $spark_master_url != undef {
    $service_name  = 'spark_slave'
    $start_command  = "/bin/su spark -s /bin/bash -c '${install_path}/sbin/start-slave.sh spark://${spark_master_url}:7077'"
    $stop_command   = "/bin/su spark -s /bin/bash -c '${install_path}/sbin/stop-slave.sh'"
    file { '/etc/init.d/spark_slave':
      content => template('spark/init.erb'),
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
      alias   => 'initd'
    }
    sshkeys::authorize { 'spark':
      authorized_keys => [
        'spark@spark-master'
      ],
    }
  } else {
    $start_command = "/bin/su spark -s /bin/bash -c '${install_path}/sbin/start-master.sh'"
    $stop_command  = "/bin/su spark -s /bin/bash -c '${install_path}/sbin/stop-master.sh'"
    $service_name  = 'spark_master'
    sshkeys::install_keypair { 'spark@spark-master':
      source => '/etc/sshkeys/spark@spark-master'
    }
    file { '/etc/init.d/spark_master':
      content => template('spark/init.erb'),
      mode    => '0755',
      owner   => 'root',
      group   => 'root',
      alias   => 'initd'
    }
  }

  #service { $service_name:
  #  ensure   => 'running',
  #  enable   => true,
  #  provider => 'redhat',
  #  require  => File['initd', $install_path],
  #}
}
