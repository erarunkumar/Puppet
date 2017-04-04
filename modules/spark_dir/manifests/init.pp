#
class spark_dir {
    file { ['/data','/data/mobiadz','/data/mobiadz/spark/','/data/mobiadz/spark/analytics', '/data/mobiadz/spark/apiserver']:
      ensure  => directory,
      owner   => 'spark',
      group   => 'spark',
      require => Class['spark']
    }
}
