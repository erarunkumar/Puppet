# == Class: profiles::spark
class profiles::spark {
  class { 'spark':  }
  class { 'spark_dir': }
}
