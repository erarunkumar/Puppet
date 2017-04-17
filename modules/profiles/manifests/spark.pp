# == Class: profiles::spark
class profiles::spark {
  class { 'sudo': }->
  class { 'spark':  }
  class { 'spark_dir': }
}
