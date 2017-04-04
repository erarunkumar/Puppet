#
class spark_dir {
  file {
    file { ['/data','/data/mobiadz','/data/mobiadz/spark/','/data/mobiadz/spark/analytics', '/data/mobiadz/spark/apiserver']:
      ensure  => directory,
      owner   => 'spark',
      group   => 'app_user',
      require => Class['spark']
    }
  }
}
