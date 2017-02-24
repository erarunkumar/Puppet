# == Class: spark::config
#
# Full description of class a here.
#
class spark::config (
  $dirname      = 'spark-2.1.0-bin-hadoop2.7',
  $filename     = "${dirname}.tgz",
  $install_path = "/opt/${dirname}"
){
  user { 'spark':
    ensure     => 'present',
  }
  archive { $filename :
    path          => "/tmp/${filename}",
    source        => 'https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz',
    checksum_type => 'none',
    extract       => true,
    extract_path  => '/opt/',
    creates       => "${install_path}/bin",
    cleanup       => true,
  }
  file { '/opt/spark':
    ensure  => link,
    target  => "/opt/${dirname}",
    require => Archive[$::filename],
  }

  file { $install_path:
    ensure  => directory,
    owner   => 'spark'
    group   => 'spark'
    require => Archive[$filename]
  }
}
