# == Class: spark::config
#
# Full description of class a here.
#
class spark::config (
  $dirname      = 'spark-2.1.0-bin-hadoop2.7',
  $filename     = "${dirname}.tgz",
  $install_path = "/home/spark/${dirname}"
){
  user { 'spark':
    ensure     => 'present',
    home       => '/home/spark',
    shell      => '/bin/bash',
    managehome => true,
  }
  archive { $::filename:
    path          => "/tmp/${filename}",
    source        => 'https://archive.apache.org/dist/spark/spark-2.1.0/spark-2.1.0-bin-hadoop2.7.tgz',
    checksum_type => 'none',
    extract       => true,
    extract_path  => '/home/spark',
    creates       => "${install_path}/bin",
    cleanup       => true,
    user          => 'spark',
    group         => 'spark',
    require       => User['spark'],
  }
  file { '/home/spark/spark':
    ensure  => link,
    target  => "/home/spark/${dirname}",
    require => Archive[$::filename],
  }
}
